# Copyright 2023 The MathWorks, Inc.

set RFIP_IP_NAME {xilinx.com:ip:usp_rf_data_converter:2.6}
set RFIP_BLK_NAME RFDataConverter

set RFDC_ADC_GSPS_RATE [format {%0.5f} [expr {$RFDC_ADC_SAMPLING_RATE/1000.0}]]
set RFDC_DAC_GSPS_RATE [format {%0.5f} [expr {$RFDC_DAC_SAMPLING_RATE/1000.0}]]

if { ! [info exists RFDC_DAC_DUC_MODE] } {
    set RFDC_DAC_DUC_MODE ""
}

switch $RFDC_DAC_MIXER_TYPE {
    "Bypassed" {	
      set RFDC_DAC_MIXER_TYPE_INT {1} ;	# Bypassed
      set RFDC_DAC_MIXER_MODE_INT {2} ;	# Real->Real
      set RFDC_DAC_SAMPLES_PER_CLOCK_REVISED [expr $RFDC_DAC_SAMPLES_PER_CLOCK_CYCLE]	
    }
    "Coarse" {
        set RFDC_DAC_MIXER_TYPE_INT {1} ;   # Coarse
        set RFDC_DAC_MIXER_MODE_INT {0} ;	# IQ->Real
	    set RFDC_DAC_SAMPLES_PER_CLOCK_REVISED [expr $RFDC_DAC_SAMPLES_PER_CLOCK_CYCLE*2]
    }
    "Fine" {
        set RFDC_DAC_MIXER_TYPE_INT {2} ;	# Fine
        set RFDC_DAC_MIXER_MODE_INT {0} ;	# IQ->Real
	    set RFDC_DAC_SAMPLES_PER_CLOCK_REVISED [expr $RFDC_DAC_SAMPLES_PER_CLOCK_CYCLE*2]
    }
}


switch $RFDC_ADC_MIXER_TYPE {
   "Bypassed" {
      set RFDC_ADC_DATA_TYPE_INT  {0} ;	# Real
      set RFDC_ADC_MIXER_TYPE_INT {1} ;	# Bypassed
      set RFDC_ADC_MIXER_MODE_INT {2} ;	# Real->Real
      
   }
   "Coarse" {
      set RFDC_ADC_DATA_TYPE_INT  {1} ;	# I/Q
      set RFDC_ADC_MIXER_TYPE_INT {1} ;	# Coarse
      set RFDC_ADC_MIXER_MODE_INT {0} ;	# Real->I/Q
   }
   "Fine" {
      set RFDC_ADC_DATA_TYPE_INT  {1} ;	# I/Q
      set RFDC_ADC_MIXER_TYPE_INT {2} ;	# Fine
      set RFDC_ADC_MIXER_MODE_INT {0} ;	# Real->I/Q
   }
}

if { (([string first "zcu216" $BOARD_PART ] != -1) || ([string first "zcu670" $BOARD_PART ] != -1)) && ![string  match $RFDC_ADC_MIXER_TYPE "Bypassed"]} { 
    # if its a ZCU216, double the samples per clock when using the mixer
    set RFDC_ADC_SAMPLES_PER_CLOCK_REVISED [expr $RFDC_ADC_SAMPLES_PER_CLOCK_CYCLE*2]
    set RFDC_ENABLE_ADC_WIDE_DATAWIDTH false
} else {
   # If bypassed or is board ZCU111 or ZCU208
   if {$RFDC_ADC_SAMPLES_PER_CLOCK_CYCLE > $RFDC_MAX_ADC_SAMP_PER_CLK} {
	    set RFDC_ADC_SAMPLES_PER_CLOCK_REVISED [expr $RFDC_ADC_SAMPLES_PER_CLOCK_CYCLE/2]
	    set RFDC_ENABLE_ADC_WIDE_DATAWIDTH true
    } else {
	    set RFDC_ADC_SAMPLES_PER_CLOCK_REVISED [expr $RFDC_ADC_SAMPLES_PER_CLOCK_CYCLE]
	    set RFDC_ENABLE_ADC_WIDE_DATAWIDTH false
    }
}

# Create instance: usp_rf_data_converter_0, and set properties
set usp_rf_data_converter_0 [ create_bd_cell -type ip -vlnv $RFIP_IP_NAME  $RFIP_BLK_NAME]  

set DATA_CONVERTER_PROPERTIES []

# Configure clock distribution for ZU48DR
	if {[string first "zcu208" $BOARD_PART ] != -1 } { 
		lappend DATA_CONVERTER_PROPERTIES CONFIG.ADC0_Clock_Source {1} CONFIG.ADC1_Clock_Dist {1} CONFIG.ADC2_Clock_Source {1} CONFIG.ADC3_Clock_Source {1}
		lappend DATA_CONVERTER_PROPERTIES CONFIG.DAC0_Clock_Source {6} CONFIG.DAC1_Clock_Source {6} CONFIG.DAC2_Clock_Dist {1} CONFIG.DAC3_Clock_Source {6}
	}
	


# ADC Tiles
foreach {TileID} [split $ADC_TILES] {		
	lappend DATA_CONVERTER_PROPERTIES CONFIG.ADC${TileID}_Enable {1}

	if {[string first "zcu111" $BOARD_PART ] != -1 } { 
	# TODO: Replace this with DUAL vs QUAD channel later		
		#set_property -dict [list CONFIG.ADC_Slice${TileID}${ChID}_Enable {true}] [get_bd_cells $RFIP_BLK_NAME]			
		foreach {ChID} [split $ADC_CHAN] {
			set TempCh [expr $ChID*2]
			lappend DATA_CONVERTER_PROPERTIES CONFIG.ADC_Slice${TileID}${TempCh}_Enable {true}	
		}
	
	} else {
		if {[string first "zcu208" $BOARD_PART ] != -1 } {
			# ZU48DR has actually 4 per tile (for multiband, which is not supported), Vivado enables all of them
			foreach {ChID} {0 1 2 3} {
				lappend DATA_CONVERTER_PROPERTIES CONFIG.ADC_Slice${TileID}${ChID}_Enable {true}	
			}
		} else {
			foreach {ChID} [split $ADC_CHAN] {                
				lappend DATA_CONVERTER_PROPERTIES CONFIG.ADC_Slice${TileID}${ChID}_Enable {true}	
			}
		}
	}
    
	lappend DATA_CONVERTER_PROPERTIES CONFIG.ADC${TileID}_Sampling_Rate $RFDC_ADC_GSPS_RATE CONFIG.ADC${TileID}_PLL_Enable {true}



	if { ${ADC_RF_TILE_CONFIG} eq "QUAD" } {
		if { $RFDC_ADC_MIXER_TYPE != "Bypassed" } {

			lappend DATA_CONVERTER_PROPERTIES \
			CONFIG.ADC_Data_Type${TileID}0  $RFDC_ADC_DATA_TYPE_INT \
			CONFIG.ADC_Mixer_Type${TileID}0 $RFDC_ADC_MIXER_TYPE_INT \
			CONFIG.ADC_Mixer_Mode${TileID}0 $RFDC_ADC_MIXER_MODE_INT \
			CONFIG.ADC_Data_Type${TileID}1  $RFDC_ADC_DATA_TYPE_INT \
			CONFIG.ADC_Mixer_Type${TileID}1 $RFDC_ADC_MIXER_TYPE_INT \
			CONFIG.ADC_Mixer_Mode${TileID}1 $RFDC_ADC_MIXER_MODE_INT \
			CONFIG.ADC_Data_Type${TileID}2  $RFDC_ADC_DATA_TYPE_INT \
			CONFIG.ADC_Mixer_Type${TileID}2 $RFDC_ADC_MIXER_TYPE_INT \
			CONFIG.ADC_Mixer_Mode${TileID}2 $RFDC_ADC_MIXER_MODE_INT \
			CONFIG.ADC_Data_Type${TileID}3  $RFDC_ADC_DATA_TYPE_INT \
			CONFIG.ADC_Mixer_Type${TileID}3 $RFDC_ADC_MIXER_TYPE_INT \
			CONFIG.ADC_Mixer_Mode${TileID}3 $RFDC_ADC_MIXER_MODE_INT

		}

		lappend DATA_CONVERTER_PROPERTIES \
		CONFIG.ADC_Decimation_Mode${TileID}0 $RFDC_ADC_DECIMATION_MODE \
		CONFIG.ADC_Decimation_Mode${TileID}1 $RFDC_ADC_DECIMATION_MODE \
		CONFIG.ADC_Decimation_Mode${TileID}2 $RFDC_ADC_DECIMATION_MODE \
		CONFIG.ADC_Decimation_Mode${TileID}3 $RFDC_ADC_DECIMATION_MODE \
		CONFIG.ADC_Data_Width${TileID}0 $RFDC_ADC_SAMPLES_PER_CLOCK_REVISED \
		CONFIG.ADC_Data_Width${TileID}1 $RFDC_ADC_SAMPLES_PER_CLOCK_REVISED \
		CONFIG.ADC_Data_Width${TileID}2 $RFDC_ADC_SAMPLES_PER_CLOCK_REVISED \
		CONFIG.ADC_Data_Width${TileID}3 $RFDC_ADC_SAMPLES_PER_CLOCK_REVISED

	} elseif { ${ADC_RF_TILE_CONFIG} eq "DUAL"} {
		if { $RFDC_ADC_MIXER_TYPE != "Bypassed" } {

			lappend DATA_CONVERTER_PROPERTIES \
			CONFIG.ADC_Data_Type${TileID}0  $RFDC_ADC_DATA_TYPE_INT \
			CONFIG.ADC_Mixer_Type${TileID}0 $RFDC_ADC_MIXER_TYPE_INT \
			CONFIG.ADC_Mixer_Mode${TileID}0 $RFDC_ADC_MIXER_MODE_INT \
			CONFIG.ADC_Data_Type${TileID}1  $RFDC_ADC_DATA_TYPE_INT \
			CONFIG.ADC_Mixer_Type${TileID}1 $RFDC_ADC_MIXER_TYPE_INT \
			CONFIG.ADC_Mixer_Mode${TileID}1 $RFDC_ADC_MIXER_MODE_INT \
			CONFIG.ADC_Data_Type${TileID}2  $RFDC_ADC_DATA_TYPE_INT \
			CONFIG.ADC_Mixer_Type${TileID}2 $RFDC_ADC_MIXER_TYPE_INT \
			CONFIG.ADC_Mixer_Mode${TileID}2 $RFDC_ADC_MIXER_MODE_INT \
			CONFIG.ADC_Data_Type${TileID}3  $RFDC_ADC_DATA_TYPE_INT \
			CONFIG.ADC_Mixer_Type${TileID}3 $RFDC_ADC_MIXER_TYPE_INT \
			CONFIG.ADC_Mixer_Mode${TileID}3 $RFDC_ADC_MIXER_MODE_INT

		}

		lappend DATA_CONVERTER_PROPERTIES \
		CONFIG.ADC_Decimation_Mode${TileID}0 $RFDC_ADC_DECIMATION_MODE \
		CONFIG.ADC_Decimation_Mode${TileID}1 $RFDC_ADC_DECIMATION_MODE \
		CONFIG.ADC_Decimation_Mode${TileID}2 $RFDC_ADC_DECIMATION_MODE \
		CONFIG.ADC_Decimation_Mode${TileID}3 $RFDC_ADC_DECIMATION_MODE \
		CONFIG.ADC_Data_Width${TileID}0 $RFDC_ADC_SAMPLES_PER_CLOCK_REVISED \
		CONFIG.ADC_Data_Width${TileID}1 $RFDC_ADC_SAMPLES_PER_CLOCK_REVISED \
		CONFIG.ADC_Data_Width${TileID}2 $RFDC_ADC_SAMPLES_PER_CLOCK_REVISED \
		CONFIG.ADC_Data_Width${TileID}3 $RFDC_ADC_SAMPLES_PER_CLOCK_REVISED

	} else {
		error "Unknown tile configuration for ADC. QUAD/DUAL are the only options"
	}	
}

if {[string first "zcu670" $BOARD_PART ] != -1 } {
       # ZU67DR has 3 ADC Tiles and Tile2 having DUAL Channels
       foreach {ChID} {0 1} {
                set TempCh [expr $ChID*2]
				lappend DATA_CONVERTER_PROPERTIES CONFIG.ADC_Slice2${TempCh}_Enable {true}
        }     
    
       if { $RFDC_ADC_MIXER_TYPE != "Bypassed" } {

			lappend DATA_CONVERTER_PROPERTIES \
			CONFIG.ADC_Data_Type20  $RFDC_ADC_DATA_TYPE_INT \
			CONFIG.ADC_Mixer_Type20 $RFDC_ADC_MIXER_TYPE_INT \
			CONFIG.ADC_Mixer_Mode20 $RFDC_ADC_MIXER_MODE_INT \
			CONFIG.ADC_Data_Type22  $RFDC_ADC_DATA_TYPE_INT \
			CONFIG.ADC_Mixer_Type22 $RFDC_ADC_MIXER_TYPE_INT \
			CONFIG.ADC_Mixer_Mode22 $RFDC_ADC_MIXER_MODE_INT 
			
		} else {
          lappend DATA_CONVERTER_PROPERTIES \
		  CONFIG.ADC_Decimation_Mode20 $RFDC_ADC_DECIMATION_MODE \
		  CONFIG.ADC_Decimation_Mode22 $RFDC_ADC_DECIMATION_MODE \
		  CONFIG.ADC_Data_Width20 $RFDC_ADC_SAMPLES_PER_CLOCK_REVISED \
		  CONFIG.ADC_Data_Width22 $RFDC_ADC_SAMPLES_PER_CLOCK_REVISED 
      }
	  
	  lappend DATA_CONVERTER_PROPERTIES \
      CONFIG.ADC2_Sampling_Rate $RFDC_ADC_GSPS_RATE CONFIG.ADC2_PLL_Enable {true}	  
   }


	

# Configure clock distribution for ZU67DR
if {[string first "zcu670" $BOARD_PART ] != -1 } { 
	lappend DATA_CONVERTER_PROPERTIES CONFIG.ADC0_Clock_Source {1} CONFIG.ADC1_Clock_Dist {1} CONFIG.ADC1_Clock_Source {1} CONFIG.ADC2_Clock_Source {1}
	lappend DATA_CONVERTER_PROPERTIES CONFIG.DAC0_Clock_Source {3} CONFIG.DAC0_Clock_Dist {1} CONFIG.DAC1_Clock_Source {3}
 }

# DAC Tiles
foreach {TileID} [split $DAC_TILES] {
	lappend DATA_CONVERTER_PROPERTIES CONFIG.DAC${TileID}_Enable {1}

	if {[string first "zcu208" $BOARD_PART ] != -1 } {
		# The ZCU208 has DUAL DAC Tiles
		foreach {ChID} [split $DAC_CHAN] {
			set TempCh [expr $ChID*2]
			lappend DATA_CONVERTER_PROPERTIES CONFIG.DAC_Slice${TileID}${TempCh}_Enable {true}
		}
	} else {
		# The ZCU111, ZCU216, and ZCU670 have QUAD DAC Tiles
		foreach {ChID} [split $DAC_CHAN] {
			lappend DATA_CONVERTER_PROPERTIES CONFIG.DAC_Slice${TileID}${ChID}_Enable {true}
		}
	}

	lappend DATA_CONVERTER_PROPERTIES CONFIG.DAC${TileID}_Sampling_Rate $RFDC_DAC_GSPS_RATE CONFIG.DAC${TileID}_PLL_Enable {true}

	if { ${DAC_RF_TILE_CONFIG} eq "QUAD" } {
		if { $RFDC_DAC_MIXER_TYPE != "Bypassed" } {

			lappend DATA_CONVERTER_PROPERTIES \
			CONFIG.DAC_Mixer_Type${TileID}0 $RFDC_DAC_MIXER_TYPE_INT \
			CONFIG.DAC_Mixer_Mode${TileID}0 $RFDC_DAC_MIXER_MODE_INT \
			CONFIG.DAC_Mixer_Type${TileID}1 $RFDC_DAC_MIXER_TYPE_INT \
			CONFIG.DAC_Mixer_Mode${TileID}1 $RFDC_DAC_MIXER_MODE_INT \
			CONFIG.DAC_Mixer_Type${TileID}2 $RFDC_DAC_MIXER_TYPE_INT \
			CONFIG.DAC_Mixer_Mode${TileID}2 $RFDC_DAC_MIXER_MODE_INT \
			CONFIG.DAC_Mixer_Type${TileID}3 $RFDC_DAC_MIXER_TYPE_INT \
			CONFIG.DAC_Mixer_Mode${TileID}3 $RFDC_DAC_MIXER_MODE_INT

		}	  
		
		if { ${RFDC_ENABLE_MTS} eq "true" } {

			lappend DATA_CONVERTER_PROPERTIES \
			CONFIG.DAC_Interpolation_Mode${TileID}0 $RFDC_DAC_INTERPOLATION_MODE \
			CONFIG.DAC_Interpolation_Mode${TileID}1 $RFDC_DAC_INTERPOLATION_MODE \
			CONFIG.DAC_Interpolation_Mode${TileID}2 $RFDC_DAC_INTERPOLATION_MODE \
			CONFIG.DAC_Interpolation_Mode${TileID}3 $RFDC_DAC_INTERPOLATION_MODE \
			CONFIG.DAC_Data_Width${TileID}0 $RFDC_DAC_SAMPLES_PER_CLOCK_REVISED \
			CONFIG.DAC_Data_Width${TileID}1 $RFDC_DAC_SAMPLES_PER_CLOCK_REVISED \
			CONFIG.DAC_Data_Width${TileID}2 $RFDC_DAC_SAMPLES_PER_CLOCK_REVISED \
			CONFIG.DAC_Data_Width${TileID}3 $RFDC_DAC_SAMPLES_PER_CLOCK_REVISED

		} else {

			lappend DATA_CONVERTER_PROPERTIES \
			CONFIG.DAC_Interpolation_Mode${TileID}0 $RFDC_DAC_INTERPOLATION_MODE \
			CONFIG.DAC_Interpolation_Mode${TileID}1 $RFDC_DAC_INTERPOLATION_MODE \
			CONFIG.DAC_Interpolation_Mode${TileID}2 $RFDC_DAC_INTERPOLATION_MODE \
			CONFIG.DAC_Interpolation_Mode${TileID}3 $RFDC_DAC_INTERPOLATION_MODE \
			CONFIG.DAC_Data_Width${TileID}0 $RFDC_DAC_SAMPLES_PER_CLOCK_REVISED \
			CONFIG.DAC_Data_Width${TileID}1 $RFDC_DAC_SAMPLES_PER_CLOCK_REVISED \
			CONFIG.DAC_Data_Width${TileID}2 $RFDC_DAC_SAMPLES_PER_CLOCK_REVISED \
			CONFIG.DAC_Data_Width${TileID}3 $RFDC_DAC_SAMPLES_PER_CLOCK_REVISED \
			CONFIG.DAC${TileID}_Fabric_Freq $DUT_SYNTHESIS_FREQUENCY \
			CONFIG.DAC${TileID}_Outclk_Freq $RFDC_TILE_CLK_OUT

		}

	} elseif { ${DAC_RF_TILE_CONFIG} eq "DUAL" } {

		if { $RFDC_DAC_MIXER_TYPE != "Bypassed" } {
			if {[string first "zcu208" $BOARD_PART ] != -1 } {
				
				lappend DATA_CONVERTER_PROPERTIES \
				CONFIG.DAC_Mixer_Type${TileID}0 $RFDC_DAC_MIXER_TYPE_INT \
				CONFIG.DAC_Mixer_Mode${TileID}0 $RFDC_DAC_MIXER_MODE_INT \
				CONFIG.DAC_Mixer_Type${TileID}2 $RFDC_DAC_MIXER_TYPE_INT \
				CONFIG.DAC_Mixer_Mode${TileID}2 $RFDC_DAC_MIXER_MODE_INT

			} else {
				
				lappend DATA_CONVERTER_PROPERTIES \
				CONFIG.DAC_Mixer_Type${TileID}0 $RFDC_DAC_MIXER_TYPE_INT \
				CONFIG.DAC_Mixer_Mode${TileID}0 $RFDC_DAC_MIXER_MODE_INT \
				CONFIG.DAC_Mixer_Type${TileID}1 $RFDC_DAC_MIXER_TYPE_INT \
				CONFIG.DAC_Mixer_Mode${TileID}1 $RFDC_DAC_MIXER_MODE_INT

			}
		}	  

		if { ${RFDC_ENABLE_MTS} eq "true" } {
			if {[string first "zcu208" $BOARD_PART ] != -1 } { 
				
				lappend DATA_CONVERTER_PROPERTIES \
				CONFIG.DAC_Interpolation_Mode${TileID}0 $RFDC_DAC_INTERPOLATION_MODE \
				CONFIG.DAC_Interpolation_Mode${TileID}2 $RFDC_DAC_INTERPOLATION_MODE \
				CONFIG.DAC_Data_Width${TileID}0 $RFDC_DAC_SAMPLES_PER_CLOCK_REVISED \
				CONFIG.DAC_Data_Width${TileID}2 $RFDC_DAC_SAMPLES_PER_CLOCK_REVISED

			} else {
				
				lappend DATA_CONVERTER_PROPERTIES \
				CONFIG.DAC_Interpolation_Mode${TileID}0 $RFDC_DAC_INTERPOLATION_MODE \
				CONFIG.DAC_Interpolation_Mode${TileID}1 $RFDC_DAC_INTERPOLATION_MODE \
				CONFIG.DAC_Data_Width${TileID}0 $RFDC_DAC_SAMPLES_PER_CLOCK_REVISED \
				CONFIG.DAC_Data_Width${TileID}1 $RFDC_DAC_SAMPLES_PER_CLOCK_REVISED

			}
		} else {
			if {[string first "zcu208" $BOARD_PART ] != -1 } { 

				lappend DATA_CONVERTER_PROPERTIES \
				CONFIG.DAC_Interpolation_Mode${TileID}0 $RFDC_DAC_INTERPOLATION_MODE \
				CONFIG.DAC_Interpolation_Mode${TileID}2 $RFDC_DAC_INTERPOLATION_MODE \
				CONFIG.DAC_Data_Width${TileID}0 $RFDC_DAC_SAMPLES_PER_CLOCK_REVISED \
				CONFIG.DAC_Data_Width${TileID}2 $RFDC_DAC_SAMPLES_PER_CLOCK_REVISED \
				CONFIG.DAC${TileID}_Fabric_Freq $DUT_SYNTHESIS_FREQUENCY \
				CONFIG.DAC${TileID}_Outclk_Freq $RFDC_TILE_CLK_OUT

			} else {

				lappend DATA_CONVERTER_PROPERTIES \
				CONFIG.DAC_Interpolation_Mode${TileID}0 $RFDC_DAC_INTERPOLATION_MODE \
				CONFIG.DAC_Interpolation_Mode${TileID}1 $RFDC_DAC_INTERPOLATION_MODE \
				CONFIG.DAC_Data_Width${TileID}0 $RFDC_DAC_SAMPLES_PER_CLOCK_REVISED \
				CONFIG.DAC_Data_Width${TileID}1 $RFDC_DAC_SAMPLES_PER_CLOCK_REVISED \
				CONFIG.DAC${TileID}_Fabric_Freq $DUT_SYNTHESIS_FREQUENCY \
				CONFIG.DAC${TileID}_Outclk_Freq $RFDC_TILE_CLK_OUT

			}
		}
	} else {
		error "Unknown tile configuration for DAC. QUAD/DUAL are the only options"
	}
	
	if { $RFDC_DAC_DUC_MODE != "" } {
	# apply DUC path mode if variable exists	  
		switch $RFDC_DAC_DUC_MODE {
			"Full DUC Nyquist (0-Fs/2)" {
				# Default mode
				set L_DUC_MODE 0
			}
			"IMR Low-Pass (0-Fs/2)" {
				# Tile clock divided by half
				set L_DUC_MODE 1
			}
			"IMR High-Pass (Fs/2-Fs)" {
				# Tile clock divided by half
				set L_DUC_MODE 2
			}
			"DUC Bypass" {
				# DAC Tile locked to output 16 samples per clock
				set L_DUC_MODE 3				
			}
			default {
				error "Unknown DUC Mode"
			}
		}
		if { ${DAC_RF_TILE_CONFIG} eq "QUAD" } {

			lappend DATA_CONVERTER_PROPERTIES \
			CONFIG.DAC_Mode${TileID}0 ${L_DUC_MODE} \
			CONFIG.DAC_Mode${TileID}1 ${L_DUC_MODE} \
			CONFIG.DAC_Mode${TileID}2 ${L_DUC_MODE} \
			CONFIG.DAC_Mode${TileID}3 ${L_DUC_MODE}

		} else {

			lappend DATA_CONVERTER_PROPERTIES \
			CONFIG.DAC_Mode${TileID}0 ${L_DUC_MODE} \
			CONFIG.DAC_Mode${TileID}2 ${L_DUC_MODE}
	
		}
	}
}
# End DAC Tile for list

# Add an NCO value for rfdc IP if Mixer is enabled
if {![string  match $RFDC_ADC_MIXER_TYPE "Bypassed"]} { 
	# ADC Mixers
	foreach {TileID} [split $ADC_TILES] {
		foreach {ADCChID} [split $ADC_CHAN] {
			if {[string first "zcu216" $BOARD_PART ] != -1 || [string first "zcu670" $BOARD_PART ] != -1 } { 
				set tempCh $ADCChID
			} else {
				set tempCh [expr $ADCChID*2]
			}
			lappend DATA_CONVERTER_PROPERTIES CONFIG.ADC_NCO_Freq${TileID}${tempCh} -$RFDC_NCO_MIXER_LO
		}
	}
}

if {![string  match $RFDC_ADC_MIXER_TYPE "Bypassed"]} { 
	# ADC Mixers
   if {[string first "zcu670" $BOARD_PART ] != -1 } {
    foreach {ADCChID} {0 1} {
    set tempCh [expr $ADCChID*2]
    lappend DATA_CONVERTER_PROPERTIES CONFIG.ADC_NCO_Freq2${tempCh} -$RFDC_NCO_MIXER_LO
    }
  }
}

if {![string  match $RFDC_DAC_MIXER_TYPE "Bypassed"]} {
	# DAC Mixers
	foreach {TileID} [split $DAC_TILES] {
		foreach {DACChID} [split $DAC_CHAN] {
			if {[string first "zcu208" $BOARD_PART ] != -1 } { 
				set tempCh [expr $DACChID*2]
			} else {
				set tempCh $DACChID
			}
			lappend DATA_CONVERTER_PROPERTIES CONFIG.DAC_NCO_Freq${TileID}${tempCh} $RFDC_NCO_MIXER_LO
		}
	}  
}

# Enable MTS on rfdc IP
if { ${RFDC_ENABLE_MTS} eq "true" } { 
	foreach {ChId} [split $ADC_TILES] {
		lappend DATA_CONVERTER_PROPERTIES CONFIG.ADC${ChId}_Multi_Tile_Sync {true} 
	} 

	foreach {ChId} [split $DAC_TILES] {
		lappend DATA_CONVERTER_PROPERTIES CONFIG.DAC${ChId}_Multi_Tile_Sync {true}
	}   
}


#######################################################
# For debug, uncomment below to output all properties
#  to console
######################################################
# puts ${DATA_CONVERTER_PROPERTIES}

#######################################################
# For debug, uncomment below to output all properties
#  as single lines to a text file: 'rfip_props.txt'
######################################################
# set dbg_file [open "rfip_props.txt" w+]
# set list_idx {0}
# foreach {rf_ip_prop} [split ${DATA_CONVERTER_PROPERTIES}] {
# 	if {$list_idx == 0} {
# 		set dbg_line ${rf_ip_prop}
# 		set list_idx {1}
# 	} else {
# 		lappend dbg_line ${rf_ip_prop}
# 		puts $dbg_file ${dbg_line}
#		set list_idx {0}
# 	}
# }
# close $dbg_file

#######################################################
# Activate the properties for the IP Core all in one,
# instead of property by property.  This should
# eliminate having to set the properties in specific
# orders.  Some properties are conditional on other,
# properties and the order can be critical.  By making
# a dict list of the properties and then calling one
# set_property Vivado won't depend on this .tcl to
# keep a correct order.
######################################################
set_property -dict ${DATA_CONVERTER_PROPERTIES} [get_bd_cells $RFIP_BLK_NAME]

# ADC Clock external interface connections and ports
foreach {TileID} [split $ADC_TILES] {
	set adc${TileID}_clk_0 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 adc${TileID}_clk_0 ]
	if {[string first "zcu208" $BOARD_PART ] != -1 || [string first "zcu670" $BOARD_PART ] != -1} {
		# Not all dac clock intf pins are assigned by default, so add the -quiet option which allows the tcl to carry on (with a Warning)
		connect_bd_intf_net -quiet -intf_net adc${TileID}_clk_0_1 [get_bd_intf_ports adc${TileID}_clk_0] [get_bd_intf_pins $RFIP_BLK_NAME/adc${TileID}_clk]
	} else {
		connect_bd_intf_net -intf_net adc${TileID}_clk_0_1 [get_bd_intf_ports adc${TileID}_clk_0] [get_bd_intf_pins $RFIP_BLK_NAME/adc${TileID}_clk]
	}
}

# DAC Clock external interface connections and ports
foreach {TileID} [split $DAC_TILES] {
	set dac${TileID}_clk_0 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 dac${TileID}_clk_0 ]
	if {[string first "zcu208" $BOARD_PART ] != -1 || [string first "zcu670" $BOARD_PART ] != -1} {
		# Not all dac clock intf pins are assigned by default, so add the -quiet option which allows the tcl to carry on (with a Warning)
		connect_bd_intf_net -quiet -intf_net dac${TileID}_clk_0_1 [get_bd_intf_ports dac${TileID}_clk_0] [get_bd_intf_pins $RFIP_BLK_NAME/dac${TileID}_clk]
	} else {
		connect_bd_intf_net -intf_net dac${TileID}_clk_0_1 [get_bd_intf_ports dac${TileID}_clk_0] [get_bd_intf_pins $RFIP_BLK_NAME/dac${TileID}_clk]
	}
}

# Vout port and connections
# DACs:
if {[string first "zcu208" $BOARD_PART ] != -1 } {
	# Has dual DACs with different names than quads
	foreach {TileID} [split $DAC_TILES] {
		foreach {DACChID} [split $DAC_CHAN] {
			set dacID [expr $DACChID*2]
			set vout${TileID}${DACChID}_0 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vout${TileID}${DACChID}_0 ]
			connect_bd_intf_net -intf_net ${RFIP_BLK_NAME}_vout${TileID}${dacID} [get_bd_intf_ports vout${TileID}${DACChID}_0] [get_bd_intf_pins $RFIP_BLK_NAME/vout${TileID}${dacID}]
		}
	}
} else {
	foreach {TileID} [split $DAC_TILES] {
		foreach {DACChID} [split $DAC_CHAN] {
			set vout${TileID}${DACChID}_0 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vout${TileID}${DACChID}_0 ]
			connect_bd_intf_net -intf_net ${RFIP_BLK_NAME}_vout${TileID}${DACChID} [get_bd_intf_ports vout${TileID}${DACChID}_0] [get_bd_intf_pins $RFIP_BLK_NAME/vout${TileID}${DACChID}]
		}
	}
}

# ADCs: NOTE: there is a difference between dual vs quad tiles
if {[string first "zcu111" $BOARD_PART ] != -1 || [string first "zcu208" $BOARD_PART ] != -1 } { 
	set GEN_PORT_NAMES {vin0_01 vin0_23 vin1_01 vin1_23 vin2_01 vin2_23 vin3_01 vin3_23} 	
	foreach {PORTNAME} [split $GEN_PORT_NAMES] {
		set ${PORTNAME}_0 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 ${PORTNAME}_0 ]
		connect_bd_intf_net -intf_net ${PORTNAME}_0_1 [get_bd_intf_ports ${PORTNAME}_0] [get_bd_intf_pins $RFIP_BLK_NAME/${PORTNAME}]
	}
} elseif {[string first "zcu670" $BOARD_PART ] != -1} {
    # There is difference vin connections in Tile2 of ZCU670
    set GEN_PORT_NAMES {vin2_01 vin2_23} 	
	foreach {PORTNAME} [split $GEN_PORT_NAMES] {
	set ${PORTNAME}_0 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 ${PORTNAME}_0 ]
	connect_bd_intf_net -intf_net ${PORTNAME}_0_1 [get_bd_intf_ports ${PORTNAME}_0] [get_bd_intf_pins $RFIP_BLK_NAME/${PORTNAME}]
  }
  for {set TileIdx 0} {$TileIdx < 2} {incr TileIdx} {
		for {set ChanCount 0} {$ChanCount < 4} {incr ChanCount} {
			set vin${TileIdx}${ChanCount}_0 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vin${TileIdx}${ChanCount}_0 ]
			connect_bd_intf_net -intf_net vin${TileIdx}${ChanCount}_0 [get_bd_intf_ports vin${TileIdx}${ChanCount}_0] [get_bd_intf_pins $RFIP_BLK_NAME/vin${TileIdx}${ChanCount}]
		}
     }
	} else {
	for {set TileIdx 0} {$TileIdx < 4} {incr TileIdx} {
		for {set ChanCount 0} {$ChanCount < 4} {incr ChanCount} {
			set vin${TileIdx}${ChanCount}_0 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vin${TileIdx}${ChanCount}_0 ]
			connect_bd_intf_net -intf_net vin${TileIdx}${ChanCount}_0 [get_bd_intf_ports vin${TileIdx}${ChanCount}_0] [get_bd_intf_pins $RFIP_BLK_NAME/vin${TileIdx}${ChanCount}]
		}
	}
}


 
# setup distributed clocks for Gen3 boards, other properties can reset the clk distribution so do this last
if {[string first "zcu216" $BOARD_PART ] != -1 } { 
	set_property -dict [list CONFIG.ADC0_Clock_Source {2} \
	CONFIG.ADC1_Clock_Source {2} \
	CONFIG.ADC2_Clock_Dist {1} \
	CONFIG.ADC3_Clock_Source {2} \
	CONFIG.DAC0_Clock_Source {6} \
	CONFIG.DAC1_Clock_Source {6} \
	CONFIG.DAC2_Clock_Dist {1} \
	CONFIG.DAC3_Clock_Source {6}] [get_bd_cells $usp_rf_data_converter_0]
}



# Create a clock wizard to generate clock for DUT
set rfDCStreamClkGen [create_bd_cell -vlnv xilinx.com:ip:clk_wiz:6.0 rfDCStreamClkGen]
set_property -dict [list CONFIG.USE_LOCKED {false} CONFIG.USE_RESET {false} CONFIG.CLKOUT1_REQUESTED_OUT_FREQ $DUT_SYNTHESIS_FREQUENCY] $rfDCStreamClkGen

if $RFDC_ENABLE_MTS {
    create_bd_intf_port -mode Slave -vlnv xilinx.com:display_usp_rf_data_converter:diff_pins_rtl:1.0 sysref_in
    hsb_connect sysref_in $RFIP_BLK_NAME/sysref_in
    set_property -dict [list CONFIG.CLKOUT1_REQUESTED_PHASE {22.5}] [get_bd_cells rfDCStreamClkGen]
    create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 FPGA_REFCLK
    set_property CONFIG.FREQ_HZ 122880000 [get_bd_intf_ports FPGA_REFCLK]
    create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 SYSREF_FPGA
    create_bd_cell -type ip -vlnv xilinx.com:ip:util_ds_buf:2.2 util_ds_buf_0
    set_property -dict [list CONFIG.C_SIZE {1} CONFIG.C_BUF_TYPE {IBUFDS}] [get_bd_cells util_ds_buf_0]
    create_bd_cell -type ip -vlnv xilinx.com:ip:util_ds_buf:2.2 util_ds_buf_1
    set_property -dict [list CONFIG.C_SIZE {1} CONFIG.C_BUF_TYPE {IBUFDS}] [get_bd_cells util_ds_buf_1]
    create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0
    set_property -dict [list CONFIG.CONST_WIDTH {1} CONFIG.CONST_VAL {0}] [get_bd_cells xlconstant_0]
    create_bd_cell -type ip -vlnv xilinx.com:user:sync:1.0 sync_0
    set_property -dict [list CONFIG.DEST_SYNC_FF {2} CONFIG.INIT_SYNC_FF {0} CONFIG.SIM_ASSERT_CHK {0} CONFIG.SRC_INPUT_REG {0}] [get_bd_cells sync_0]
    create_bd_cell -type ip -vlnv xilinx.com:user:sync:1.0 sync_1
    set_property -dict [list CONFIG.DEST_SYNC_FF {2} CONFIG.INIT_SYNC_FF {0} CONFIG.SIM_ASSERT_CHK {0} CONFIG.SRC_INPUT_REG {0}] [get_bd_cells sync_1]
    hsb_connect FPGA_REFCLK util_ds_buf_0/CLK_IN_D
    hsb_connect SYSREF_FPGA util_ds_buf_1/CLK_IN_D
    hsb_connect xlconstant_0/dout sync_0/src_clk\n
    hsb_connect xlconstant_0/dout sync_1/src_clk
    hsb_connect util_ds_buf_0/IBUF_OUT rfDCStreamClkGen/clk_in1
    hsb_connect util_ds_buf_0/IBUF_OUT sync_0/dest_clk
    hsb_connect util_ds_buf_1/IBUF_OUT sync_0/src_in
    hsb_connect rfDCStreamClkGen/clk_out1 sync_1/dest_clk
    hsb_connect sync_0/dest_out sync_1/src_in
    hsb_connect sync_1/dest_out $RFIP_BLK_NAME/user_sysref_adc
    hsb_connect sync_1/dest_out $RFIP_BLK_NAME/user_sysref_dac

    # Add consraints to constr.xdc file
    set xdc_fd [open $mts_constr_filename a+]
    puts $xdc_fd "\n\n# MTS constraints"
    
    if {[string first "zcu111" $BOARD_PART ]!= -1} {
        puts $xdc_fd "create_clock -period 8.138 \[get_ports FPGA_REFCLK_clk_p]"
        puts $xdc_fd "set_property PACKAGE_PIN AL16 \[get_ports {FPGA_REFCLK_clk_p[0]}]"
        puts $xdc_fd "set_property PACKAGE_PIN AL15 \[get_ports {FPGA_REFCLK_clk_n[0]}]"
        puts $xdc_fd "set_property PACKAGE_PIN AK17 \[get_ports {SYSREF_FPGA_clk_p[0]}]"
        puts $xdc_fd "set_property PACKAGE_PIN AK16 \[get_ports {SYSREF_FPGA_clk_n[0]}]"
        puts $xdc_fd "set_property IOSTANDARD LVDS \[get_ports {FPGA_REFCLK_clk_p[0]}]"
        puts $xdc_fd "set_property IOSTANDARD LVDS \[get_ports {FPGA_REFCLK_clk_n[0]}]"
        puts $xdc_fd "set_property IOSTANDARD LVDS \[get_ports {SYSREF_FPGA_clk_p[0]}]"
        puts $xdc_fd "set_property IOSTANDARD LVDS \[get_ports {SYSREF_FPGA_clk_n[0]}]"
        puts $xdc_fd "set_property DIFF_TERM_ADV TERM_100 \[get_ports {FPGA_REFCLK_clk_p[0]}]"
        puts $xdc_fd "set_property DIFF_TERM_ADV TERM_100 \[get_ports {SYSREF_FPGA_clk_p[0]}]"
    } elseif {[string first "zcu208" $BOARD_PART ]!=-1}  {
        puts $xdc_fd "create_clock -period 8.138 \[get_ports FPGA_REFCLK_clk_p]"
        puts $xdc_fd "set_property PACKAGE_PIN B8 \[get_ports {FPGA_REFCLK_clk_p[0]}]"
        puts $xdc_fd "set_property PACKAGE_PIN B7 \[get_ports {FPGA_REFCLK_clk_n[0]}]"
        puts $xdc_fd "set_property PACKAGE_PIN B10 \[get_ports {SYSREF_FPGA_clk_p[0]}]"
        puts $xdc_fd "set_property PACKAGE_PIN B9 \[get_ports {SYSREF_FPGA_clk_n[0]}]"
        puts $xdc_fd "set_property IOSTANDARD LVDS_25 \[get_ports {FPGA_REFCLK_clk_p[0]}]"
        puts $xdc_fd "set_property IOSTANDARD LVDS_25 \[get_ports {FPGA_REFCLK_clk_n[0]}]"
        puts $xdc_fd "set_property IOSTANDARD LVDS_25 \[get_ports {SYSREF_FPGA_clk_p[0]}]"
        puts $xdc_fd "set_property IOSTANDARD LVDS_25 \[get_ports {SYSREF_FPGA_clk_n[0]}]"
        puts $xdc_fd "set_property CLOCK_DEDICATED_ROUTE ANY_CMT_COLUMN \[get_nets {*/util_ds_buf_0/IBUF_OUT[0]}]"
    } elseif {[string first "zcu216" $BOARD_PART ]!=-1}  {
        puts $xdc_fd "create_clock -period 8.138 \[get_ports FPGA_REFCLK_clk_p]"
        puts $xdc_fd "set_property PACKAGE_PIN E10 \[get_ports {FPGA_REFCLK_clk_p[0]}]"
        puts $xdc_fd "set_property PACKAGE_PIN E9 \[get_ports {FPGA_REFCLK_clk_n[0]}]"
        puts $xdc_fd "set_property PACKAGE_PIN E11 \[get_ports {SYSREF_FPGA_clk_p[0]}]"
        puts $xdc_fd "set_property PACKAGE_PIN D11 \[get_ports {SYSREF_FPGA_clk_n[0]}]"
        puts $xdc_fd "set_property IOSTANDARD LVDS_25 \[get_ports {FPGA_REFCLK_clk_p[0]}]"
        puts $xdc_fd "set_property IOSTANDARD LVDS_25 \[get_ports {FPGA_REFCLK_clk_n[0]}]"
        puts $xdc_fd "set_property IOSTANDARD LVDS_25 \[get_ports {SYSREF_FPGA_clk_p[0]}]"
        puts $xdc_fd "set_property IOSTANDARD LVDS_25 \[get_ports {SYSREF_FPGA_clk_n[0]}]"
        puts $xdc_fd "set_property CLOCK_DEDICATED_ROUTE ANY_CMT_COLUMN \[get_nets {*/util_ds_buf_0/IBUF_OUT[0]}]"
    } elseif {[string first "zcu670" $BOARD_PART ]!=-1}  {
        puts $xdc_fd "create_clock -period 8.138 \[get_ports FPGA_REFCLK_clk_p]"
        puts $xdc_fd "set_property PACKAGE_PIN AP11 \[get_ports {FPGA_REFCLK_clk_p[0]}]"
        puts $xdc_fd "set_property PACKAGE_PIN AP10 \[get_ports {FPGA_REFCLK_clk_n[0]}]"
        puts $xdc_fd "set_property PACKAGE_PIN E10 \[get_ports {SYSREF_FPGA_clk_p[0]}]"
        puts $xdc_fd "set_property PACKAGE_PIN E9 \[get_ports {SYSREF_FPGA_clk_n[0]}]"
        puts $xdc_fd "set_property DIFF_SSTL12 LVDS_25 \[get_ports {FPGA_REFCLK_clk_p[0]}]"
        puts $xdc_fd "set_property DIFF_SSTL12 LVDS_25 \[get_ports {FPGA_REFCLK_clk_n[0]}]"
        puts $xdc_fd "set_property IOSTANDARD LVDS_25 \[get_ports {SYSREF_FPGA_clk_p[0]}]"
        puts $xdc_fd "set_property IOSTANDARD LVDS_25 \[get_ports {SYSREF_FPGA_clk_n[0]}]"
        puts $xdc_fd "set_property CLOCK_DEDICATED_ROUTE ANY_CMT_COLUMN \[get_nets {*/util_ds_buf_0/IBUF_OUT[0]}]"
    }
     close $xdc_fd
   } else {
    hsb_connect $RFIP_BLK_NAME/clk_adc0 rfDCStreamClkGen/clk_in1
  }
  
# clock and reset for DAC/ADC stream
if !$RFDC_ENABLE_ADC_WIDE_DATAWIDTH {
    foreach {TileID} [split $ADC_TILES] {
        hsb_connect rfDCStreamClkGen/clk_out1 $RFIP_BLK_NAME/m${TileID}_axis_aclk
        hsb_connect ipcore_rstgen/peripheral_aresetn $RFIP_BLK_NAME/m${TileID}_axis_aresetn
    }
}

foreach {TileID} [split $DAC_TILES] {
    hsb_connect rfDCStreamClkGen/clk_out1 $RFIP_BLK_NAME/s${TileID}_axis_aclk
    hsb_connect ipcore_rstgen/peripheral_aresetn $RFIP_BLK_NAME/s${TileID}_axis_aresetn
}

if [string first "zcu670" $BOARD_PART ]!=-1 {
     hsb_connect rfDCStreamClkGen/clk_out1 $RFIP_BLK_NAME/m2_axis_aclk
     hsb_connect ipcore_rstgen/peripheral_aresetn $RFIP_BLK_NAME/m2_axis_aresetn
    }

source $mw_hdl_dir/add_rfdc_util_ip.tcl
