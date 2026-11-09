set_param board.repoPaths [get_property LOCAL_ROOT_DIR [xhub::get_xstores xilinx_board_store]]
create_project vivado_prj {} -part xczu28dr-ffvg1517-2-e -force
set_property board_part xilinx.com:zcu111:part0:1.2 [current_project]
set_property target_language Verilog [current_project]
set defaultRepoPath {./ipcore}
set_property ip_repo_paths $defaultRepoPath [current_fileset]
update_ip_catalog
set ipList [glob -nocomplain -directory $defaultRepoPath *.zip]
foreach ipCore $ipList {
  set folderList [glob -nocomplain -directory $defaultRepoPath -type d *]
  if {[lsearch -exact $folderList [file rootname $ipCore]] == -1} {
    catch {update_ip_catalog -add_ip $ipCore -repo_path $defaultRepoPath}
  }
}
update_ip_catalog
set AXI4_STREAM_TO_SOFTWARE_DATA_WIDTH {128}
set SOFTWARE_TO_AXI4_STREAM_DATA_WIDTH {128}
set RFDC_ADC_SAMPLING_RATE {2048}
set RFDC_ADC_DECIMATION_MODE {4}
set RFDC_ADC_SAMPLES_PER_CLOCK_CYCLE {4}
set RFDC_ADC_MIXER_TYPE {Fine}
set RFDC_DAC_SAMPLING_RATE {2048}
set RFDC_DAC_INTERPOLATION_MODE {4}
set RFDC_DAC_SAMPLES_PER_CLOCK_CYCLE {4}
set RFDC_DAC_MIXER_TYPE {Fine}
set RFDC_NCO_MIXER_LO {0.5}
set RFDC_ENABLE_MTS {false}
set RFDC_TILE_CLK_OUT {128.000}
set DUT_SYNTHESIS_FREQUENCY {128}
set RFDC_PLL_REFERENCE_CLK {245.76}
set DLIPcoreName {GenericProcessor}
set DLIPcoreLocation {E:/AMC_Projects/deployModule/matlab code for vivido ip/genericipcore/ipcore/GenericProcessor_v1_0}
set DLIPcoreVendor {xilinx.com}
source vivado_custom_block_design.tcl
# Use global synthesis for this project
set_property synth_checkpoint_mode None [get_files system.bd]
save_bd_design
close_project
exit
