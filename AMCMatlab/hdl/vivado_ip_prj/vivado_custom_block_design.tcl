# Copyright 2023 The MathWorks, Inc.
set thisDir [file normalize [file dirname [info script]]]
if { ! [info exists mw_hdl_dir] } {
    set mw_hdl_dir ${thisDir}/ipcore/tclutils
}

set ADC_RF_TILE_CONFIG "DUAL"
set DAC_RF_TILE_CONFIG "QUAD"

set ADC_TILES {0 1 2 3}
set DAC_TILES {0 1}

set ADC_CHAN {0 1}
set DAC_CHAN {0 1 2 3}

set RFDC_ADC_TILE0_ACTIVE {true}
set RFDC_ADC_TILE0_CHANNELS {0 1}
set RFDC_ADC_TILE1_ACTIVE {true}
set RFDC_ADC_TILE1_CHANNELS {0 1}
set RFDC_ADC_TILE2_ACTIVE {true}
set RFDC_ADC_TILE2_CHANNELS {0 1}
set RFDC_ADC_TILE3_ACTIVE {true}
set RFDC_ADC_TILE3_CHANNELS {0 1}

set RFDC_DAC_TILE0_ACTIVE {true}
set RFDC_DAC_TILE0_CHANNELS {0 1 2 3}
set RFDC_DAC_TILE1_ACTIVE {true}
set RFDC_DAC_TILE1_CHANNELS {0 1 2 3}


set RFDC_MAX_ADC_SAMP_PER_CLK {8}
set RFDC_MAX_DAC_SAMP_PER_CLK {16}

source $mw_hdl_dir/add_system.tcl
