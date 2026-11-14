# ============================================================================
# Vivado 2023.2 batch synthesis + implementation + bitstream.
# Run AFTER run_build.bat (the block design must exist first).
#   vivado -mode batch -notrace -source run_synth.tcl
# NOTE: this takes a long time (hours) and a lot of RAM on a small PC.
#
# IMPORTANT (fixed 2026-11-14): make_wrapper CREATES system_wrapper.v on disk
# but does NOT register it in the project. It must be added with
#   add_files -norecurse [make_wrapper ...]
# otherwise "set_property top system_wrapper" points at a module Vivado cannot
# find and synthesis fails with [Synth 8-439] module 'system_wrapper' not found.
# ============================================================================

set scriptDir [file normalize [file dirname [info script]]]
cd $scriptDir

open_project vivado_prj.xpr

# --- Find the wrapper: in the project file list, or on disk ------------------
proc find_wrapper {scriptDir} {
  foreach f [get_files -quiet -all] {
    if {[string match {*system_wrapper*} $f] && [file exists $f]} {
      return $f
    }
  }
  # make_wrapper writes here but does not add the file to the project.
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
      # CRITICAL: register the generated wrapper in the project.
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
} else {
  puts "FATAL: system_wrapper still missing."
  puts "       FIX: run run_build.bat once, then run run_synth.bat again."
}

if {$wrapOk} {
  puts "=== Starting synthesis (synth_1) ==="
  launch_runs synth_1 -jobs 2
  catch {wait_on_run synth_1}
  set synthStatus [get_property STATUS [get_runs synth_1]]
  puts "Synthesis status: $synthStatus"

  if {[string match "*Complete*" $synthStatus]} {
    puts "=== Starting implementation + bitstream (impl_1) ==="
    launch_runs impl_1 -jobs 2
    catch {wait_on_run impl_1}
    puts "Implementation status: [get_property STATUS [get_runs impl_1]]"
  } else {
    puts "FATAL: Synthesis failed - skipping implementation."
  }
} else {
  puts "FATAL: synthesis skipped because the top-level wrapper is missing."
}

close_project
puts "=== Synthesis/implementation finished ==="
