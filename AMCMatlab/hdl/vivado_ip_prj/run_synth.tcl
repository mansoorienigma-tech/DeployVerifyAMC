# ============================================================================
# Vivado 2023.2 batch synthesis + implementation + bitstream.
# Run AFTER run_build.bat (the block design must exist first).
#   vivado -mode batch -notrace -source run_synth.tcl
# NOTE: this takes a long time (hours) and a lot of RAM on a small PC.
#
# The HDL wrapper (system_wrapper) is created by run_build.bat. Here we only
# VERIFY it exists and set it as top - we no longer call make_wrapper on the
# saved project, because that project can report
#   [BD 41-1665] ... 'system.bd' is locked / contains locked IPs.
# ============================================================================

set scriptDir [file normalize [file dirname [info script]]]
cd $scriptDir

open_project vivado_prj.xpr

# --- Locate the wrapper file -------------------------------------------------
proc find_wrapper {} {
  foreach f [get_files -quiet -all] {
    if {[string match {*system_wrapper*} $f] && [file exists $f]} {
      return $f
    }
  }
  return ""
}

set wrapFile [find_wrapper]

if {$wrapFile eq ""} {
  puts "FATAL: no system_wrapper HDL found in the project."
  puts "       Repair attempt: refresh IP repos + upgrade locked IPs."
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
    if {[catch {make_wrapper -files $bdFiles -top -force} m]} {
      puts "FATAL: make_wrapper failed: $m"
    } else {
      puts "OK: system_wrapper regenerated"
    }
  }
  set wrapFile [find_wrapper]
}

set wrapOk [expr {$wrapFile ne ""}]
if {$wrapOk} {
  puts "OK: wrapper = $wrapFile"
  set_property top system_wrapper [get_filesets sources_1]
  catch {save_project}
} else {
  puts "FATAL: system_wrapper still missing."
  puts "       FIX: run run_build.bat once (it creates the wrapper),"
  puts "       then run run_synth.bat again."
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
