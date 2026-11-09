 
# Add the Deep Learning IP core into the repository
set existing_path [get_property ip_repo_paths [current_fileset]]
lappend existing_path $DLIPcoreLocation
set_property ip_repo_paths $existing_path [current_fileset]
update_ip_catalog

set VLNV_log1 "VLNV == $DLIPcoreVendor:ip:$DLIPcoreName:1.0"
set useripcore_name_log [get_ipdefs -filter ${VLNV_log1}]

if { [string first $DLIPcoreName $useripcore_name_log] !=-1} {
    set dlprocessor_0 [ create_bd_cell -type ip -vlnv $DLIPcoreVendor:ip:$DLIPcoreName:1.0 dlprocessor_0 ]
} else {
    puts "Deep Learning processor IP core is not available."
    puts "The Vendor name specified in step 1.2 should be same as the vendor name in component.xml."
}

set_property -dict [list \
  CONFIG.NUM_MI {1} \
  CONFIG.NUM_SI {8} \
] [get_bd_cells axi_intc_pl_mem]
 
set_property -dict [list \
  CONFIG.CLKOUT3_JITTER {140.732} \
  CONFIG.CLKOUT3_PHASE_ERROR {254.994} \
  CONFIG.CLKOUT3_REQUESTED_OUT_FREQ {150} \
  CONFIG.CLKOUT3_USED {true} \
  CONFIG.MMCM_CLKOUT2_DIVIDE {10} \
  CONFIG.NUM_OUT_CLKS {3} \
] [get_bd_cells clkgen]
 
create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_0
 
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_dlproc
 
set_property CONFIG.NUM_MI {5} [get_bd_cells axi_intc_reg]
 
set_property -dict [list \
  CONFIG.NUM_MI {1} \
  CONFIG.NUM_SI {2} \
] [get_bd_cells axi_interconnect_dlproc]
 
create_bd_cell -type ip -vlnv mathworks.com:ip:AXIS2AXIM:1.0 AXIS2AXIM_0
 
create_bd_cell -type ip -vlnv analog.com:user:axi_dmac:1.0 axi_dl_s2mm
set_property CONFIG.DMA_TYPE_SRC {1} [get_bd_cells axi_dl_s2mm]
set_property -dict [list \
  CONFIG.ENABLE_DIAGNOSTICS_IF {true} \
  CONFIG.DMA_DATA_WIDTH_DEST {1024} \
  CONFIG.FIFO_SIZE {8} \
  CONFIG.MAX_BYTES_PER_BURST {2048} \
] [get_bd_cells axi_dl_s2mm]

create_bd_cell -type ip -vlnv analog.com:user:axi_dmac:1.0 axi_dl_mm2s

set_property -dict [list \
  CONFIG.ENABLE_DIAGNOSTICS_IF {true} \
  CONFIG.DMA_DATA_WIDTH_SRC {1024} \
  CONFIG.DMA_TYPE_DEST {1} \
  CONFIG.DMA_TYPE_SRC {0} \
  CONFIG.FIFO_SIZE {8} \
  CONFIG.MAX_BYTES_PER_BURST {1024} \
] [get_bd_cells axi_dl_mm2s]

create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_2
set_property -dict [list \
  CONFIG.NUM_MI {1} \
  CONFIG.NUM_SI {1} \
] [get_bd_cells axi_interconnect_2]

create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_1
set_property -dict [list \
  CONFIG.NUM_MI {1} \
  CONFIG.NUM_SI {1} \
] [get_bd_cells axi_interconnect_1]

set_property CONFIG.NUM_PORTS {5} [get_bd_cells interrupt_concat]

set_property -dict [list \
  CONFIG.PSU__USE__S_AXI_GP4 {1} \
  CONFIG.PSU__USE__S_AXI_GP5 {1} \
] [get_bd_cells zynq_ultra_ps]

set_property CONFIG.NUM_MI {8} [get_bd_cells axi_intc_reg]

connect_bd_net [get_bd_pins dlprocessor_0/AXI4_ACLK] [get_bd_pins clkgen/clk_out3] [get_bd_pins axi_interconnect_dlproc/S00_ACLK] [get_bd_pins axi_interconnect_dlproc/M00_ACLK]
connect_bd_net [get_bd_pins axi_intc_pl_mem/S06_ARESETN] [get_bd_pins ipcore_rstgen/peripheral_aresetn]
connect_bd_net [get_bd_pins dlprocessor_0/AXI4_ARESETN] [get_bd_pins proc_sys_reset_0/peripheral_aresetn]
connect_bd_net [get_bd_pins axi_intc_pl_mem/S06_ACLK] [get_bd_pins rfDCStreamClkGen/clk_out1]
connect_bd_net [get_bd_pins axi_interconnect_dlproc/ACLK] [get_bd_pins clkgen/clk_out3]
connect_bd_net [get_bd_pins axi_interconnect_dlproc/M00_ARESETN] [get_bd_pins proc_sys_reset_0/peripheral_aresetn]
connect_bd_net [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins axi_interconnect_dlproc/S00_ARESETN]
connect_bd_net [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins axi_interconnect_dlproc/ARESETN]
connect_bd_net [get_bd_pins axi_interconnect_dlproc/S01_ACLK] [get_bd_pins rfDCStreamClkGen/clk_out1]
connect_bd_net [get_bd_pins axi_interconnect_dlproc/S01_ARESETN] [get_bd_pins ipcore_rstgen/peripheral_aresetn]
connect_bd_net [get_bd_pins clkgen/clk_out3] [get_bd_pins proc_sys_reset_0/slowest_sync_clk]
connect_bd_net [get_bd_pins proc_sys_reset_0/ext_reset_in] [get_bd_pins zynq_ultra_ps/pl_resetn0]
connect_bd_net [get_bd_pins axi_intc_pl_mem/S04_ARESETN] [get_bd_pins proc_sys_reset_0/peripheral_aresetn]
connect_bd_net [get_bd_pins axi_intc_pl_mem/S05_ARESETN] [get_bd_pins proc_sys_reset_0/peripheral_aresetn]
connect_bd_net [get_bd_pins axi_intc_pl_mem/S03_ARESETN] [get_bd_pins proc_sys_reset_0/peripheral_aresetn]
connect_bd_net [get_bd_pins axi_intc_pl_mem/S07_ARESETN] [get_bd_pins proc_sys_reset_0/peripheral_aresetn]
connect_bd_net [get_bd_pins dlprocessor_0/IPCORE_RESETN] [get_bd_pins proc_sys_reset_0/peripheral_aresetn]
connect_bd_net [get_bd_pins axi_intc_pl_mem/S04_ACLK] [get_bd_pins clkgen/clk_out3]
connect_bd_net [get_bd_pins axi_intc_pl_mem/S03_ACLK] [get_bd_pins clkgen/clk_out3]
connect_bd_net [get_bd_pins dlprocessor_0/IPCORE_CLK] [get_bd_pins clkgen/clk_out3]
connect_bd_net [get_bd_pins axi_intc_pl_mem/S05_ACLK] [get_bd_pins clkgen/clk_out3]
connect_bd_net [get_bd_pins axi_intc_pl_mem/S07_ACLK] [get_bd_pins clkgen/clk_out3]
connect_bd_net [get_bd_pins AXIS2AXIM_0/IPCORE_CLK] [get_bd_pins clkgen/clk_out3]
connect_bd_net [get_bd_pins AXIS2AXIM_0/AXI4_Lite_ACLK] [get_bd_pins clkgen/clk_out3]
connect_bd_net [get_bd_pins AXIS2AXIM_0/IPCORE_RESETN] [get_bd_pins proc_sys_reset_0/peripheral_aresetn]
connect_bd_net [get_bd_pins AXIS2AXIM_0/AXI4_Lite_ARESETN] [get_bd_pins proc_sys_reset_0/peripheral_aresetn]
connect_bd_net [get_bd_pins axi_dl_s2mm/s_axi_aclk] [get_bd_pins clkgen/clk_out1]
connect_bd_net [get_bd_pins axi_dl_s2mm/s_axi_aresetn] [get_bd_pins sys_rstgen/peripheral_aresetn]
connect_bd_net [get_bd_pins axi_dl_s2mm/m_dest_axi_aresetn] [get_bd_pins mem_rstgen/peripheral_aresetn]
connect_bd_net [get_bd_pins axi_dl_s2mm/m_dest_axi_aclk] [get_bd_pins clkgen/clk_out2]
connect_bd_net [get_bd_pins axi_dl_s2mm/s_axis_aclk] [get_bd_pins clkgen/clk_out3]
connect_bd_net [get_bd_pins axi_dl_mm2s/m_axis_aclk] [get_bd_pins clkgen/clk_out3]
connect_bd_net [get_bd_pins clkgen/clk_out2] [get_bd_pins axi_dl_mm2s/m_src_axi_aclk]
connect_bd_net [get_bd_pins axi_dl_mm2s/s_axi_aclk] [get_bd_pins clkgen/clk_out1]
connect_bd_net [get_bd_pins axi_dl_mm2s/s_axi_aresetn] [get_bd_pins sys_rstgen/peripheral_aresetn]
connect_bd_net [get_bd_pins axi_dl_mm2s/m_src_axi_aresetn] [get_bd_pins mem_rstgen/peripheral_aresetn]
connect_bd_net [get_bd_pins clkgen/clk_out2] [get_bd_pins axi_interconnect_1/ACLK]
connect_bd_net [get_bd_pins clkgen/clk_out2] [get_bd_pins axi_interconnect_1/M00_ACLK]
connect_bd_net [get_bd_pins clkgen/clk_out2] [get_bd_pins axi_interconnect_1/S00_ACLK]
connect_bd_net [get_bd_pins axi_interconnect_1/ARESETN] [get_bd_pins mem_rstgen/peripheral_aresetn]
connect_bd_net [get_bd_pins mem_rstgen/peripheral_aresetn] [get_bd_pins axi_interconnect_1/S00_ARESETN]
connect_bd_net [get_bd_pins mem_rstgen/peripheral_aresetn] [get_bd_pins axi_interconnect_1/M00_ARESETN]
connect_bd_net [get_bd_pins zynq_ultra_ps/saxihp3_fpd_aclk] [get_bd_pins clkgen/clk_out2]
connect_bd_net [get_bd_pins clkgen/clk_out2] [get_bd_pins zynq_ultra_ps/saxihp2_fpd_aclk]
connect_bd_net [get_bd_pins axi_dl_mm2s/irq] [get_bd_pins interrupt_concat/In3]
connect_bd_net [get_bd_pins mem_rstgen/peripheral_aresetn] [get_bd_pins axi_interconnect_2/ARESETN]
connect_bd_net [get_bd_pins mem_rstgen/peripheral_aresetn] [get_bd_pins axi_interconnect_2/S00_ARESETN]
connect_bd_net [get_bd_pins mem_rstgen/peripheral_aresetn] [get_bd_pins axi_interconnect_2/M00_ARESETN]
connect_bd_net [get_bd_pins clkgen/clk_out2] [get_bd_pins axi_interconnect_2/ACLK]
connect_bd_net [get_bd_pins clkgen/clk_out2] [get_bd_pins axi_interconnect_2/S00_ACLK]
connect_bd_net [get_bd_pins clkgen/clk_out2] [get_bd_pins axi_interconnect_2/M00_ACLK]
connect_bd_net [get_bd_pins axi_intc_reg/M04_ACLK] [get_bd_pins clkgen/clk_out3]
connect_bd_net [get_bd_pins axi_intc_reg/M04_ARESETN] [get_bd_pins proc_sys_reset_0/peripheral_aresetn]
connect_bd_net [get_bd_pins axi_intc_reg/M06_ACLK] [get_bd_pins clkgen/clk_out3]
connect_bd_net [get_bd_pins axi_intc_reg/M06_ARESETN] [get_bd_pins proc_sys_reset_0/peripheral_aresetn]
connect_bd_net [get_bd_pins axi_intc_reg/M05_ARESETN] [get_bd_pins sys_rstgen/peripheral_aresetn]
connect_bd_net [get_bd_pins sys_rstgen/peripheral_aresetn] [get_bd_pins axi_intc_reg/M07_ARESETN]
connect_bd_net [get_bd_pins axi_intc_reg/M07_ACLK] [get_bd_pins clkgen/clk_out1]
connect_bd_net [get_bd_pins clkgen/clk_out1] [get_bd_pins axi_intc_reg/M05_ACLK]
connect_bd_net [get_bd_pins axi_dl_s2mm/irq] [get_bd_pins interrupt_concat/In4]


connect_bd_intf_net -boundary_type upper [get_bd_intf_pins axi_interconnect_dlproc/S00_AXI] [get_bd_intf_pins axi_intc_reg/M04_AXI]
connect_bd_intf_net -boundary_type upper [get_bd_intf_pins axi_interconnect_dlproc/M00_AXI] [get_bd_intf_pins dlprocessor_0/AXI4]
connect_bd_intf_net [get_bd_intf_pins dlprocessor_0/AXI4_Master_Activation_Data] -boundary_type upper [get_bd_intf_pins axi_intc_pl_mem/S03_AXI]
connect_bd_intf_net [get_bd_intf_pins dlprocessor_0/AXI4_Master_Weight_Data] -boundary_type upper [get_bd_intf_pins axi_intc_pl_mem/S04_AXI]
connect_bd_intf_net [get_bd_intf_pins dlprocessor_0/AXI4_Master_Debug] -boundary_type upper [get_bd_intf_pins axi_intc_pl_mem/S05_AXI]
connect_bd_intf_net -boundary_type upper [get_bd_intf_pins axi_interconnect_1/M00_AXI] [get_bd_intf_pins zynq_ultra_ps/S_AXI_HP2_FPD]
connect_bd_intf_net [get_bd_intf_pins axi_dl_mm2s/m_src_axi] -boundary_type upper [get_bd_intf_pins axi_interconnect_1/S00_AXI]
connect_bd_intf_net -boundary_type upper [get_bd_intf_pins axi_intc_reg/M07_AXI] [get_bd_intf_pins axi_dl_mm2s/s_axi]
connect_bd_intf_net [get_bd_intf_pins AXIS2AXIM_0/AXI4_Stream_Slave] [get_bd_intf_pins axi_dl_mm2s/m_axis]
connect_bd_intf_net [get_bd_intf_pins axi_dl_s2mm/m_dest_axi] -boundary_type upper [get_bd_intf_pins axi_interconnect_2/S00_AXI]
connect_bd_intf_net -boundary_type upper [get_bd_intf_pins axi_intc_pl_mem/S07_AXI] [get_bd_intf_pins AXIS2AXIM_0/AXI4_Master]
connect_bd_intf_net [get_bd_intf_pins axi_dl_s2mm/s_axis] [get_bd_intf_pins AXIS2AXIM_0/AXI4_Stream_Master]
connect_bd_intf_net [get_bd_intf_pins axi_dl_s2mm/s_axi] -boundary_type upper [get_bd_intf_pins axi_intc_reg/M05_AXI]
connect_bd_intf_net [get_bd_intf_pins AXIS2AXIM_0/AXI4_Lite] -boundary_type upper [get_bd_intf_pins axi_intc_reg/M06_AXI]
connect_bd_intf_net -boundary_type upper [get_bd_intf_pins axi_interconnect_2/M00_AXI] [get_bd_intf_pins zynq_ultra_ps/S_AXI_HP3_FPD]

assign_bd_address -offset 0xA0060000 -range 0x00010000 -target_address_space [get_bd_addr_spaces sys_cpu/Data] [get_bd_addr_segs dlprocessor_0/AXI4/reg0] -force
assign_bd_address -offset 0x80000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces AXIS2AXIM_0/AXI4_Master] [get_bd_addr_segs ddr4_0/C0_DDR4_MEMORY_MAP/C0_DDR4_ADDRESS_BLOCK] -force
assign_bd_address -offset 0x80000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces dlprocessor_0/AXI4_Master_Activation_Data] [get_bd_addr_segs ddr4_0/C0_DDR4_MEMORY_MAP/C0_DDR4_ADDRESS_BLOCK] -force
assign_bd_address -offset 0x80000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces dlprocessor_0/AXI4_Master_Weight_Data] [get_bd_addr_segs ddr4_0/C0_DDR4_MEMORY_MAP/C0_DDR4_ADDRESS_BLOCK] -force
assign_bd_address -offset 0x80000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces dlprocessor_0/AXI4_Master_Debug] [get_bd_addr_segs ddr4_0/C0_DDR4_MEMORY_MAP/C0_DDR4_ADDRESS_BLOCK] -force
assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces axi_dl_mm2s/m_src_axi] [get_bd_addr_segs zynq_ultra_ps/SAXIGP4/HP2_DDR_LOW] -force
assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces axi_dl_s2mm/m_dest_axi] [get_bd_addr_segs zynq_ultra_ps/SAXIGP5/HP3_DDR_LOW] -force
assign_bd_address -offset 0xA0070000 -range 0x00010000 -target_address_space [get_bd_addr_spaces zynq_ultra_ps/Data] [get_bd_addr_segs AXIS2AXIM_0/AXI4_Lite/reg0] -force
assign_bd_address -offset 0xA0080000 -range 0x00010000 -target_address_space [get_bd_addr_spaces zynq_ultra_ps/Data] [get_bd_addr_segs axi_dl_mm2s/s_axi/axi_lite] -force
assign_bd_address -offset 0xA0090000 -range 0x00010000 -target_address_space [get_bd_addr_spaces zynq_ultra_ps/Data] [get_bd_addr_segs axi_dl_s2mm/s_axi/axi_lite] -force
