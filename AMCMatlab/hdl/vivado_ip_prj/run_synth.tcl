# ============================================================================
# Vivado 2023.2 batch synthesis + implementation + bitstream.
# Run AFTER run_build.bat (the block design must exist first).
#   vivado -mode batch -notrace -source run_synth.tcl
# NOTE: this takes a long time (hours) and a lot of RAM on a small PC.
# IMPORTANT: close any open Vivado GUI window before running this,
# otherwise the block design stays locked and synthesis fails.
# ============================================================================

set scriptDir [file normalize [file dirname [info script]]]
cd $scriptDir

open_project vivado_prj.xpr

# If the block design is open it is locked and cannot generate a wrapper.
# Close it first (try both name and object forms).
set curBD [current_bd_design -quiet]
if {$curBD ne ""} {
  puts "Block design is open ($curBD) - closing it."
  catch {close_bd_design [get_bd_designs $curBD]}
  catch {close_bd_design $curBD}
  puts "After close, current_bd_design = [current_bd_design -quiet]"
} else {
  puts "No block design is open in this session."
}

# Batch-created projects do not always auto-set the top module.
# Set it explicitly to the BD wrapper so synthesis can run.
if {[catch {make_wrapper -files [get_files system.bd] -top} msg]} {
  puts "make_wrapper failed: $msg"
} else {
  puts "make_wrapper OK"
}
set_property top system_wrapper [get_filesets sources_1]

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
  puts "Synthesis failed - skipping implementation."
}

close_project
puts "=== Synthesis/implementation finished ==="
