# ============================================================================
# Lightweight headless sanity check for Vivado 2023.2.
#
# Opens the project, validates the block design and reports IP status
# WITHOUT opening the GUI and WITHOUT running synthesis. Use it to
# confirm the project "comes up" on your machine:
#   vivado -mode batch -notrace -source verify_project.tcl
# ============================================================================

set scriptDir [file normalize [file dirname [info script]]]
cd $scriptDir

open_project vivado_prj.xpr

puts "=== Project opened: [current_project] ==="
puts "=== Part: [get_property PART [current_project]] ==="

# Make sure the deep-learning IP is visible in the catalog
update_ip_catalog
set dlDefs [get_ipdefs -all xilinx.com:ip:GenericProcessor:1.0]
if {$dlDefs eq ""} {
  puts "WARNING: GenericProcessor IP not found in catalog - check ip_repo_paths"
} else {
  puts "OK: GenericProcessor IP found: $dlDefs"
}

# Validate the block design (catches broken connections / missing IPs)
set bdFile [get_files -quiet system.bd]
if {$bdFile eq ""} {
  puts "ERROR: system.bd not found in project"
} else {
  open_bd_design $bdFile
  validate_bd_design
  puts "OK: system.bd validated"
}

report_ip_status -file ip_status.rpt
puts "IP status report written to ip_status.rpt"

close_project
