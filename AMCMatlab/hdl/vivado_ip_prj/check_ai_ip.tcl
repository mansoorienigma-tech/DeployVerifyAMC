# ============================================================================
# Quick check: is the deep-learning (AI) IP inside the system block design?
#
# From Vivado Tcl Console (after opening vivado_prj.xpr):
#     source check_ai_ip.tcl
# Or headless:
#     vivado -mode batch -notrace -source check_ai_ip.tcl
# ============================================================================
set scriptDir [file normalize [file dirname [info script]]]
cd $scriptDir

puts "================ AI IP CHECK ================"
if {[catch {open_project vivado_prj.xpr} m]} {
  puts "Note: open_project: $m"
}
catch {open_bd_design [get_files system.bd]}

set aiCells [get_bd_cells -quiet *dlprocessor*]
if {[llength $aiCells] == 0} {
  puts "RESULT: FAIL - no dlprocessor cell found."
  puts "        The AI IP is NOT in this block design."
} else {
  foreach c $aiCells {
    puts "AI IP cell  : $c"
    puts "  VLNV      : [get_property VLNV $c]"
  }
  set conns [get_bd_intf_nets -quiet -of_objects $aiCells]
  puts "Interfaces  : [llength $conns] connected"
  puts "Interconnect: [llength [get_bd_cells -quiet *axi_interconnect_dlproc*]]"
  puts "DL DMAs     : [llength [get_bd_cells -quiet *axi_dl_*]]"
  puts "RESULT: PASS - the AI IP (GenericProcessor, named dlprocessor_0) IS present."
  puts "        Look for 'dlprocessor_0' in the BD, not 'AI' or 'GenericProcessor'."
}
puts "=============================================="
