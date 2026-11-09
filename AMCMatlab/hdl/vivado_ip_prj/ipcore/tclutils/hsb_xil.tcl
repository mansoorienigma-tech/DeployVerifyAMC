# Copyright 2023 The MathWorks, Inc.
proc get_bd_obj {obj_str} {

  set obj [get_bd_intf_pins $obj_str -quiet]
  if {$obj eq ""} {set obj [get_bd_intf_ports $obj_str -quiet]}
  if {$obj eq ""} {set obj [get_bd_intf_nets $obj_str -quiet]}
  if {$obj eq ""} {set obj [get_bd_pins $obj_str -quiet]}
  if {$obj eq ""} {set obj [get_bd_ports $obj_str -quiet]}
  if {$obj eq ""} {set obj [get_bd_nets $obj_str -quiet]}
  return $obj
}

proc hsb_connect {str_1 str_2} {

  set bd_obj_1 [get_bd_obj $str_1]
  set bd_obj_2 [get_bd_obj $str_2]
  set bd_obj_1_class [get_property CLASS $bd_obj_1]
  set bd_obj_2_class [get_property CLASS $bd_obj_2]

  if {($bd_obj_1_class eq "bd_intf_pin") || ($bd_obj_1_class eq "bd_intf_ports") \
     && ($bd_obj_2_class eq "bd_intf_pin") || ($bd_obj_2_class eq "bd_intf_ports")} {
    connect_bd_intf_net $bd_obj_1 $bd_obj_2
    return
  }

  if {($bd_obj_1_class eq "bd_intf_nets") \
     && ($bd_obj_2_class eq "bd_intf_pin") || ($bd_obj_2_class eq "bd_intf_ports")} {
    connect_bd_intf_net -intf_net $bd_obj_1 $bd_obj_2
    return
  }  

  if {($bd_obj_1_class eq "bd_pin") || ($bd_obj_1_class eq "bd_ports") \
     && ($bd_obj_2_class eq "bd_pin") || ($bd_obj_2_class eq "bd_ports")} {
    connect_bd_net $bd_obj_1 $bd_obj_2
    return
  }

  if {($bd_obj_1_class eq "bd_nets") \
     && ($bd_obj_2_class eq "bd_pin") || ($bd_obj_2_class eq "bd_ports")} {
    connect_bd_net -net $bd_obj_1 $bd_obj_2
    return
  }
}


# FIFO to support wider data widths for ADC in RF Data Converter
proc create_hier_cell_FIFO_WdCvtr { parentCell nameHier DataWidthWr} {
# Datawidth FIFO

  # It is assumed that the WriteWidth = 2*ReadWidth
  set DataWidthRd [expr $DataWidthWr*2]
  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_FIFO_WidthConvert() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I -type clk rd_clk_0
  create_bd_pin -dir O -from [expr ${DataWidthRd}-1] -to 0 rd_data
  create_bd_pin -dir O rd_valid
  create_bd_pin -dir I -type clk wr_clk_0
  create_bd_pin -dir I -from [expr ${DataWidthWr}-1] -to 0 wr_data
  create_bd_pin -dir I wr_valid

  # Create instance: fifo_generator_0, and set properties
  set fifo_generator_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 fifo_generator_0 ]
  set_property -dict [ list \
   CONFIG.Enable_Safety_Circuit {true} \
   CONFIG.Fifo_Implementation {Independent_Clocks_Block_RAM} \
   CONFIG.Full_Flags_Reset_Value {1} \
   CONFIG.Input_Data_Width ${DataWidthWr} \
   CONFIG.Output_Data_Width ${DataWidthRd} \
   CONFIG.Reset_Type {Asynchronous_Reset} \
   CONFIG.asymmetric_port_width {true} \
 ] $fifo_generator_0


  # Create instance: lower_bits, and set properties
  set lower_bits [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 lower_bits ]
  set_property -dict [ list \
   CONFIG.DIN_FROM [expr ${DataWidthWr} -1] \
   CONFIG.DIN_WIDTH ${DataWidthRd} \
   CONFIG.DOUT_WIDTH ${DataWidthWr} \
 ] $lower_bits

  # Create instance: read_en, and set properties
  set read_en [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 read_en ]

  # Create instance: upper_bits, and set properties
  set upper_bits [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 upper_bits ]
  set_property -dict [ list \
   CONFIG.DIN_FROM [expr ${DataWidthRd} -1] \
   CONFIG.DIN_TO ${DataWidthWr} \
   CONFIG.DIN_WIDTH ${DataWidthRd} \
   CONFIG.DOUT_WIDTH ${DataWidthWr} \
 ] $upper_bits

  # Create instance: xlconcat_0, and set properties
  set xlconcat_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_0 ]

  # Create port connections
  connect_bd_net -net din_0_1 [get_bd_pins wr_data] [get_bd_pins fifo_generator_0/din]
  connect_bd_net -net fifo_generator_0_dout [get_bd_pins fifo_generator_0/dout] [get_bd_pins lower_bits/Din] [get_bd_pins upper_bits/Din]
  connect_bd_net -net lower_bits_Dout [get_bd_pins lower_bits/Dout] [get_bd_pins xlconcat_0/In1]
  connect_bd_net -net rd_clk_0_1 [get_bd_pins rd_clk_0] [get_bd_pins fifo_generator_0/rd_clk]
  connect_bd_net -net read_en_dout [get_bd_pins rd_valid] [get_bd_pins fifo_generator_0/rd_en] [get_bd_pins read_en/dout]
  connect_bd_net -net upper_bits_Dout [get_bd_pins upper_bits/Dout] [get_bd_pins xlconcat_0/In0]
  connect_bd_net -net wr_clk_0_1 [get_bd_pins wr_clk_0] [get_bd_pins fifo_generator_0/wr_clk]
  connect_bd_net -net wr_en_0_1 [get_bd_pins wr_valid] [get_bd_pins fifo_generator_0/wr_en]
  connect_bd_net -net xlconcat_0_dout [get_bd_pins rd_data] [get_bd_pins xlconcat_0/dout]

  # Restore current instance
  current_bd_instance $oldCurInst
}
