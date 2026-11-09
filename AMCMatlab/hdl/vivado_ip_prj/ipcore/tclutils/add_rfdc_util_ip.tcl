# Copyright 2023 The MathWorks, Inc.
set RFDC_IP $RFIP_BLK_NAME
set DAC_MUX DAC_Muxer
set ADC_MUX ADC_Demuxer


proc AddDACMuxerIP_IQ {RFDC_IP DAC_MUX RFDC_DAC_TILE_CHANNELS TILE_ID RFDC_DAC_MIXER_TYPE RFDC_DAC_SAMPLES_PER_CLOCK_CYCLE} {
    set chIndx 0
	foreach {ChId} [split $RFDC_DAC_TILE_CHANNELS] { 
			# puts Ch=$ChId
            set ipIndx [expr $TILE_ID*[llength $RFDC_DAC_TILE_CHANNELS] + $chIndx]
			set BlkName $DAC_MUX\_$ipIndx
			create_bd_cell -type ip -vlnv mathworks.com:user:DAC_Muxer:1.0 $BlkName
            
			if [string  match $RFDC_DAC_MIXER_TYPE "Bypassed"] {
				set_property -dict [list CONFIG.IQMODE {false}] [get_bd_cells $BlkName]
			} else {
				set_property -dict [list CONFIG.IQMODE {true}] [get_bd_cells $BlkName]	
			}
            set_property -dict [list CONFIG.SAMPLESPERCLOCK $RFDC_DAC_SAMPLES_PER_CLOCK_CYCLE] [get_bd_cells $BlkName]		
            connect_bd_net [get_bd_pins $RFDC_IP/s$TILE_ID$ChId\_axis_tdata] [get_bd_pins $BlkName\/DAC]
			connect_bd_net [get_bd_pins $RFDC_IP/s$TILE_ID$ChId\_axis_tvalid] [get_bd_pins $BlkName\/ValidOut] 

            set chIndx [expr $chIndx + 1]
		}
}

proc AddADCMuxerIP_IQ {RFDC_IP ADC_MUX RFDC_ADC_TILE_CHANNELS TILE_ID  RFDC_ADC_SAMPLES_PER_CLOCK_CYCLE ADC_RF_TILE_CONFIG BOARD_PART} {
	
	if { ${ADC_RF_TILE_CONFIG} eq "QUAD" } {
		#QUAD Tile specified here
		# valid ranges are 0 1 2 3 for 4 channels
		# each ADC IQ port is a single interleaved data connection
		
        set chIndx 0
		foreach {ChId} [split $RFDC_ADC_TILE_CHANNELS] {
                set ipIndx [expr $TILE_ID*[llength $RFDC_ADC_TILE_CHANNELS] + $chIndx]
				set BlkName ADC_IQSeperator\_$ipIndx	
				create_bd_cell -type ip -vlnv mathworks.com:user:ADC_IQSeperator:1.0 $BlkName
				set_property -dict [list CONFIG.SAMPLESPERCLOCK [expr $RFDC_ADC_SAMPLES_PER_CLOCK_CYCLE*2]] [get_bd_cells $BlkName]	

				connect_bd_net [get_bd_pins $RFDC_IP/m$TILE_ID$ChId\_axis_tdata] [get_bd_pins $BlkName\/ADC]
				connect_bd_net [get_bd_pins $RFDC_IP/m$TILE_ID$ChId\_axis_tvalid] [get_bd_pins $BlkName\/ValidIn] 	
                set chIndx [expr $chIndx + 1]
		} 	
		

	} else {
		# DUAL Tile specified here
		# valid ranges for ChId are {0 1}  
		# 0 -> {0 1}  1->{2 3}  		
        set chIndx 0
		foreach {ChId} [split $RFDC_ADC_TILE_CHANNELS] {
			    
                set ipIndx [expr $TILE_ID*[llength $RFDC_ADC_TILE_CHANNELS] + $chIndx]
				set BlkName $ADC_MUX\_$ipIndx
				create_bd_cell -type ip -vlnv mathworks.com:user:ADC_Demuxer:1.0 $BlkName
				set_property -dict [list CONFIG.SAMPLESPERCLOCK $RFDC_ADC_SAMPLES_PER_CLOCK_CYCLE] [get_bd_cells $BlkName]	
				set_property -dict [list CONFIG.IQMODE {true}] [get_bd_cells $BlkName]

				set PortIQ "[expr $ChId*2] [expr $ChId*2 +1]"
				set ComplexIQ {I Q}
				foreach {I_or_Q} [split $ComplexIQ] {PortName} [split $PortIQ] {
					connect_bd_net [get_bd_pins $RFDC_IP/m${TILE_ID}${PortName}_axis_tdata] [get_bd_pins $BlkName\/${I_or_Q}_In]
					connect_bd_net [get_bd_pins $RFDC_IP/m${TILE_ID}${PortName}_axis_tvalid] [get_bd_pins $BlkName\/${I_or_Q}_Valid] 
				}
                set chIndx [expr $chIndx + 1]
		}			
	}
}


 proc AddADCMuxerIP_IQ_zcu670 {RFDC_IP ADC_MUX RFDC_ADC_TILE_CHANNELS TILE_ID  RFDC_ADC_SAMPLES_PER_CLOCK_CYCLE ADC_RF_TILE_CONFIG BOARD_PART} {
 
          # ADC Tile2 is DUAL Tile in ZCU670
		  # valid ranges for ChId are {0 1}  
		  # 0 -> {0 1}  1->{2 3} 
         set channelIndx 0
         foreach {ChId} {0 1} {
		  set ipIndx [expr 2*[llength {0 1}] + $channelIndx]
		  set BlkName $ADC_MUX\_$ipIndx
		  create_bd_cell -type ip -vlnv mathworks.com:user:ADC_Demuxer:1.0 $BlkName
		  set_property -dict [list CONFIG.SAMPLESPERCLOCK $RFDC_ADC_SAMPLES_PER_CLOCK_CYCLE] [get_bd_cells $BlkName]	
		  set_property -dict [list CONFIG.IQMODE {true}] [get_bd_cells $BlkName]  		  
          
          set PortIQ "[expr $ChId*2] [expr $ChId*2 +1]"
		  set ComplexIQ {I Q}
		  foreach {I_or_Q} [split $ComplexIQ] {PortName} [split $PortIQ] {
		  	connect_bd_net [get_bd_pins $RFDC_IP/m2${PortName}_axis_tdata] [get_bd_pins $BlkName\/${I_or_Q}_In]
		  	connect_bd_net [get_bd_pins $RFDC_IP/m2${PortName}_axis_tvalid] [get_bd_pins $BlkName\/${I_or_Q}_Valid] 
		  }
           set channelIndx [expr $channelIndx + 1]
		}
      }



if ![string  match $RFDC_DAC_MIXER_TYPE "Bypassed"] {
	# Connect up DAC IQ Tiles
	#${ChId} [split $DAC_TILES]
	foreach {TileID} [split $DAC_TILES]  {
		eval "set ActiveChanId $[subst RFDC_DAC_TILE${TileID}_ACTIVE]"
		# gen 3 8x8 uses 0,2 numbering for dual Tiles
		if { [string first "zcu208" $BOARD_PART ] != -1 } {
			set VarTileId {0 2}
		} else {
			eval "set VarTileId $[subst RFDC_DAC_TILE${TileID}_CHANNELS]"
		}

		if {$ActiveChanId == true} {
			# puts $VarTileId
			AddDACMuxerIP_IQ $RFDC_IP $DAC_MUX $VarTileId $TileID $RFDC_DAC_MIXER_TYPE $RFDC_DAC_SAMPLES_PER_CLOCK_CYCLE
		}
	}
}

if ![string  match $RFDC_ADC_MIXER_TYPE "Bypassed"] {
    foreach {TileID} [split $ADC_TILES] {
	    eval "set ActiveChanId $[subst RFDC_ADC_TILE${TileID}_ACTIVE]"
	    eval "set VarTileId $[subst RFDC_ADC_TILE${TileID}_CHANNELS]"
    
	    if {$ActiveChanId == true} {
		    # puts $VarTileId
		    AddADCMuxerIP_IQ $RFDC_IP $ADC_MUX $VarTileId $TileID $RFDC_ADC_SAMPLES_PER_CLOCK_CYCLE $ADC_RF_TILE_CONFIG $BOARD_PART
	    }
    }
}

if {![string  match $RFDC_ADC_MIXER_TYPE "Bypassed"] && [string first "zcu670" $BOARD_PART ] != -1} {
    
	    eval "set ActiveChanId $[subst RFDC_ADC_TILE2_ACTIVE]"
	    eval "set VarTileId $[subst RFDC_ADC_TILE2_CHANNELS]"
    
	    if {$ActiveChanId == true} {
		    # puts $VarTileId
		    AddADCMuxerIP_IQ_zcu670 $RFDC_IP $ADC_MUX $VarTileId 2 $RFDC_ADC_SAMPLES_PER_CLOCK_CYCLE $ADC_RF_TILE_CONFIG $BOARD_PART
	    }
    }


if $RFDC_ENABLE_ADC_WIDE_DATAWIDTH {
    # Use FIFO generator for clock domain crossing
    # Setup second clock output on main clock wizard
    if [string  match $RFDC_ADC_MIXER_TYPE "Bypassed"] {	   
	    # Setup secondary AXI4S Clock for ADC
	    set ADC_AXI4S_CLK [expr {$DUT_SYNTHESIS_FREQUENCY*2}]
        set_property -dict [list CONFIG.CLKOUT2_USED {true} CONFIG.CLKOUT2_REQUESTED_OUT_FREQ $ADC_AXI4S_CLK] $rfDCStreamClkGen
        set adc_axis_rstgen [create_bd_cell -vlnv xilinx.com:ip:proc_sys_reset:5.0 adc_axis_rstgen]
        set_property -dict [list CONFIG.C_EXT_RST_WIDTH {1}] $adc_axis_rstgen
        hsb_connect rfDCStreamClkGen/clk_out2 adc_axis_rstgen/slowest_sync_clk
        hsb_connect zynq_ultra_ps/pl_resetn0 adc_axis_rstgen/ext_reset_in
        
        # perform channel mapping for dual vs quad tiles
        if { ${ADC_RF_TILE_CONFIG} eq "QUAD" } {
            set RFDC_IP_ADC_ChanMap {0 1 2 3}
        } else {
            set RFDC_IP_ADC_ChanMap {0 2}
        }
        set fifoIPIndx 0
        foreach {TileID} [split $ADC_TILES]  {
            hsb_connect $RFDC_IP/m$TileID\_axis_aclk rfDCStreamClkGen/clk_out2
            hsb_connect $RFDC_IP/m$TileID\_axis_aresetn adc_axis_rstgen/peripheral_aresetn

            foreach {ChID} [split $ADC_CHAN] {chMap} [split $RFDC_IP_ADC_ChanMap] {
                create_hier_cell_FIFO_WdCvtr [current_bd_instance .] ADC_FIFO_$fifoIPIndx [expr $RFDC_ADC_SAMPLES_PER_CLOCK_CYCLE*8]
                hsb_connect $RFDC_IP/m$TileID$chMap\_axis_tdata ADC_FIFO_$fifoIPIndx/wr_data
                hsb_connect $RFDC_IP/m$TileID$chMap\_axis_tvalid ADC_FIFO_$fifoIPIndx/wr_valid
                hsb_connect rfDCStreamClkGen/clk_out1 ADC_FIFO_$fifoIPIndx/rd_clk_0
                hsb_connect rfDCStreamClkGen/clk_out2 ADC_FIFO_$fifoIPIndx/wr_clk_0

                set fifoIPIndx [expr $fifoIPIndx + 1]
            }
        }
    }
}
