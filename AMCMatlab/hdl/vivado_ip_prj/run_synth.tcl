# ============================================================================
# Vivado 2023.2 batch synthesis + implementation + BITSTREAM.
#   vivado -mode batch -notrace -source run_synth.tcl
#
# IMPORTANT: this script is SAFE to re-run. If implementation already finished
# (system_wrapper_routed.dcp exists) it takes the FAST PATH: it only writes the
# bitstream from that checkpoint - a few minutes, NOT the 6-hour synth again.
#
# History of fixes:
#  - make_wrapper creates the HDL file but does NOT add it to the project:
#      add_files -norecurse [make_wrapper ...] is mandatory.
#  - an interrupted run leaves synth_1 dirty: reset_run before launch_runs.
#  - launch_runs impl_1 without -to_step stops at route_design and never
#    produces a .bit: now we run -to_step write_bitstream.
# ============================================================================

set scriptDir [file normalize [file dirname [info script]]]
cd $scriptDir

open_project vivado_prj.xpr

set implDir [file join $scriptDir "vivado_prj.runs" "impl_1"]
set bitFiles [glob -nocomplain -directory $implDir *.bit]
set routedDcp [file join $implDir "system_wrapper_routed.dcp"]

# --- Fast path: routed checkpoint already exists ----------------------------
proc make_bitstream {implDir} {
  set bit [file join $implDir "system_wrapper.bit"]
  set opened 0
  if {[catch {open_run impl_1} m]} {
    puts "Note: open_run impl_1: $m"
    set dcp [file join $implDir "system_wrapper_routed.dcp"]
    if {[file exists $dcp]} {
      if {[catch {open_checkpoint $dcp} m2]} {
        puts "FATAL: cannot open routed checkpoint: $m2"
        return 0
      }
      set opened 1
    }
  } else {
    puts "OK: opened implemented run impl_1"
    set opened 1
  }
  if {!$opened} {
    puts "FATAL: no implemented design available."
    return 0
  }
  if {[catch {write_bitstream -force $bit} m]} {
    puts "FATAL: write_bitstream failed: $m"
    return 0
  }
  puts "OK: bitstream written: $bit"
  return 1
}

# --- Locate / register the top-level wrapper --------------------------------
proc find_wrapper {scriptDir} {
  foreach f [get_files -quiet -all] {
    if {[string match {*system_wrapper*} $f] && [file exists $f]} {
      return $f
    }
  }
  foreach sub [list \
      [file join "vivado_prj.gen" "sources_1" "bd" "system" "hdl"] \
      [file join "vivado_prj.srcs" "sources_1" "bd" "system" "hdl"]] {
    foreach f [glob -nocomplain -directory [file join $scriptDir $sub] system_wrapper.*] {
      if {[file exists $f]} {
        puts "OK: found wrapper on disk, registering it: $f"
        if {[catch {add_files -norecurse $f} addMsg]} {
          puts "FATAL: could not register wrapper: $addMsg"
        } else {
          puts "OK: wrapper added to project sources"
        }
        return $f
      }
    }
  }
  return ""
}

if {[llength $bitFiles] > 0} {
  puts "OK: bitstream already exists: [lindex $bitFiles 0]"
  puts "RESULT: OK - nothing to do"

} elseif {[file exists $routedDcp]} {
  puts "=== FAST PATH: routed checkpoint found - writing bitstream only ==="
  puts "=== (this takes minutes, NOT the 6-hour synthesis again) ==="
  if {[make_bitstream $implDir]} {
    puts "RESULT: OK - bitstream created from existing routed design"
  } else {
    puts "RESULT: FAILED - see errors above"
  }

} else {
  # ---------------- Full flow (only when no implementation exists) ---------
  set wrapFile [find_wrapper $scriptDir]
  if {$wrapFile eq ""} {
    puts "FATAL: no system_wrapper HDL found. Repairing (refresh repos + upgrade locked IPs)."
    set repo1 [file normalize [file join $scriptDir "ipcore"]]
    set repo2 [file normalize [file join $scriptDir ".." ".." ".." "matlab code for vivido ip" "genericipcore" "ipcore" "GenericProcessor_v1_0"]]
    catch {set_property ip_repo_paths [list $repo1 $repo2] [current_fileset]}
    catch {update_ip_catalog -rebuild}
    catch {report_ip_status}
    catch {upgrade_ip [get_ips -quiet]}
    foreach bd [get_bd_designs -quiet] {
      catch {close_bd_design $bd}
    }
    set bdFiles [get_files -quiet system.bd]
    if {[llength $bdFiles] > 0} {
      catch {open_bd_design $bdFiles}
      catch {validate_bd_design}
      if {[catch {make_wrapper -files $bdFiles -top -force} wrapPath]} {
        puts "FATAL: make_wrapper failed: $wrapPath"
      } else {
        puts "OK: system_wrapper regenerated: $wrapPath"
        if {[file exists $wrapPath]} {
          if {[catch {add_files -norecurse $wrapPath} addMsg]} {
            puts "FATAL: add_files wrapper failed: $addMsg"
          } else {
            puts "OK: wrapper added to project sources"
          }
        }
      }
    }
    set wrapFile [find_wrapper $scriptDir]
  }

  set wrapOk [expr {$wrapFile ne ""}]
  if {$wrapOk} {
    puts "OK: wrapper = $wrapFile"
    set_property top system_wrapper [get_filesets sources_1]
    catch {update_compile_order -fileset sources_1}
    catch {save_project}

    # An interrupted run needs a reset before launch_runs will accept it.
    catch {reset_run synth_1}
    catch {reset_run impl_1}
    # Make sure the implementation run goes all the way to the bitstream.
    catch {set_property STEPS.WRITE_BITSTREAM.IS_ENABLED true [get_runs impl_1]}

    puts "=== Starting synthesis (synth_1) ==="
    launch_runs synth_1 -jobs 2
    catch {wait_on_run synth_1}
    set synthStatus [get_property STATUS [get_runs synth_1]]
    puts "Synthesis status: $synthStatus"

    if {[string match "*Complete*" $synthStatus]} {
      puts "=== Starting implementation + bitstream (impl_1) ==="
      launch_runs impl_1 -to_step write_bitstream -jobs 2
      catch {wait_on_run impl_1}
      puts "Implementation status: [get_property STATUS [get_runs impl_1]]"
    } else {
      puts "FATAL: Synthesis failed - skipping implementation."
    }
  } else {
    puts "FATAL: synthesis skipped because the top-level wrapper is missing."
  }
}

close_project
puts "=== Synthesis/implementation finished ==="
