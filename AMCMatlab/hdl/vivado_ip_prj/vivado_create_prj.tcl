# ============================================================================
# Vivado 2023.2 batch build script for the RFSoC ZCU111 "system" design
# (Modulation-Classification DUT + GenericProcessor deep-learning IP).
#
# Run it in BATCH (headless) mode, e.g. from this folder:
#   vivado -mode batch -notrace -source vivado_create_prj.tcl
# or just double-click run_build.bat in this folder.
#
# Batch mode never opens the Vivado GUI, so graphics/OpenGL driver
# crashes cannot kill the build. Use this path if the GUI keeps
# closing on your PC.
# ============================================================================

# --- Always work from this script's own folder ------------------------------
# The MathWorks Tcl flow (add_system.tcl, add_pl_ddr.tcl, add_rfdc_ip.tcl,
# constr.xdc, mw_compile_dma.tcl) uses paths relative to this folder, so
# make sure the current directory is this folder no matter where Vivado
# was launched from.
set scriptDir [file normalize [file dirname [info script]]]
cd $scriptDir

# --- Board files (optional; guarded so a missing board store is not fatal) --
catch {set_param board.repoPaths [get_property LOCAL_ROOT_DIR [xhub::get_xstores xilinx_board_store]]}

# --- Create the project ------------------------------------------------------
create_project vivado_prj {} -part xczu28dr-ffvg1517-2-e -force
catch {set_property board_part xilinx.com:zcu111:part0:1.2 [current_project]}
set_property target_language Verilog [current_project]

# --- IP repositories ---------------------------------------------------------
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

# --- RFSoC / DUT parameters (from the MATLAB reference design) ---------------
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

# --- Deep-learning processor IP (built by MATLAB, see repo root) -------------
# NOTE: the path is computed relative to THIS script, so the build works
# on any machine / any clone location. Do NOT hard-code an absolute
# Windows path (e.g. E:/...) here.
set DLIPcoreName {GenericProcessor}
set DLIPcoreVendor {xilinx.com}
set DLIPcoreLocation [file normalize [file join $scriptDir ".." ".." ".." "matlab code for vivido ip" "genericipcore" "ipcore" "GenericProcessor_v1_0"]]

# --- Build the block design (subsystem + RFDC + DDR + DL IP) -----------------
source vivado_custom_block_design.tcl

# Use global synthesis for this project (only if the design was created)
catch {set_property synth_checkpoint_mode None [get_files system.bd]}

# Set the BD wrapper as top so the saved project is ready for synthesis
# (batch-created projects do not always auto-set it).
catch {make_wrapper -files [get_files system.bd] -top}
catch {set_property top system_wrapper [get_filesets sources_1]}

save_bd_design
close_project

# In batch mode Vivado exits by itself after the script finishes.
# Do NOT call "exit" here: sourcing this file from the GUI Tcl console
# would otherwise close Vivado.
