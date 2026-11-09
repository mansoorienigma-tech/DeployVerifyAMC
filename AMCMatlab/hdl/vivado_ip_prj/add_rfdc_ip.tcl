set RFDataConverter [create_bd_cell -type ip -vlnv xilinx.com:ip:usp_rf_data_converter:2.6 RFDataConverter]
set_property -dict [list \
 CONFIG.Axiclk_Freq 50 \
 CONFIG.ADC0_Enable {1} \
 CONFIG.ADC0_Sampling_Rate 2.04800000 \
 CONFIG.ADC0_PLL_Enable {true} \
 CONFIG.ADC0_Outclk_Freq 128.000 \
 CONFIG.ADC0_PLL_Enable {true} \
 CONFIG.ADC0_Outclk_Freq 128.000 \
 CONFIG.ADC0_Multi_Tile_Sync {false} \
 CONFIG.ADC1_Enable {1} \
 CONFIG.ADC1_Sampling_Rate 2.04800000 \
 CONFIG.ADC1_PLL_Enable {true} \
 CONFIG.ADC1_Outclk_Freq 128.000 \
 CONFIG.ADC1_PLL_Enable {true} \
 CONFIG.ADC1_Outclk_Freq 128.000 \
 CONFIG.ADC1_Multi_Tile_Sync {false} \
 CONFIG.ADC2_Enable {1} \
 CONFIG.ADC2_Sampling_Rate 2.04800000 \
 CONFIG.ADC2_PLL_Enable {true} \
 CONFIG.ADC2_Outclk_Freq 128.000 \
 CONFIG.ADC2_PLL_Enable {true} \
 CONFIG.ADC2_Outclk_Freq 128.000 \
 CONFIG.ADC2_Multi_Tile_Sync {false} \
 CONFIG.ADC3_Enable {1} \
 CONFIG.ADC3_Sampling_Rate 2.04800000 \
 CONFIG.ADC3_PLL_Enable {true} \
 CONFIG.ADC3_Outclk_Freq 128.000 \
 CONFIG.ADC3_PLL_Enable {true} \
 CONFIG.ADC3_Outclk_Freq 128.000 \
 CONFIG.ADC3_Multi_Tile_Sync {false} \
 CONFIG.ADC_Slice00_Enable {true} \
 CONFIG.ADC_Data_Type00 I/Q \
 CONFIG.ADC_Decimation_Mode00 8 \
 CONFIG.ADC_Mixer_Type00 Fine \
 CONFIG.ADC_Mixer_Mode00 Real->I/Q \
 CONFIG.ADC_Data_Width00 1 \
 CONFIG.ADC_NCO_Freq00 -0.5 \
 CONFIG.ADC_NCO_Phase00 0 \
 CONFIG.ADC_Slice01_Enable {true} \
 CONFIG.ADC_Data_Type01 I/Q \
 CONFIG.ADC_Decimation_Mode01 8 \
 CONFIG.ADC_Mixer_Type01 Fine \
 CONFIG.ADC_Mixer_Mode01 Real->I/Q \
 CONFIG.ADC_Data_Width01 1 \
 CONFIG.ADC_NCO_Freq01 -0.5 \
 CONFIG.ADC_NCO_Phase01 0 \
 CONFIG.ADC_Slice02_Enable {true} \
 CONFIG.ADC_Data_Type02 I/Q \
 CONFIG.ADC_Decimation_Mode02 8 \
 CONFIG.ADC_Mixer_Type02 Fine \
 CONFIG.ADC_Mixer_Mode02 Real->I/Q \
 CONFIG.ADC_Data_Width02 1 \
 CONFIG.ADC_NCO_Freq02 0 \
 CONFIG.ADC_NCO_Phase02 0 \
 CONFIG.ADC_Slice03_Enable {true} \
 CONFIG.ADC_Data_Type03 I/Q \
 CONFIG.ADC_Decimation_Mode03 8 \
 CONFIG.ADC_Mixer_Type03 Fine \
 CONFIG.ADC_Mixer_Mode03 Real->I/Q \
 CONFIG.ADC_Data_Width03 1 \
 CONFIG.ADC_NCO_Freq03 0 \
 CONFIG.ADC_NCO_Phase03 0 \
 CONFIG.ADC_Slice10_Enable {true} \
 CONFIG.ADC_Data_Type10 I/Q \
 CONFIG.ADC_Decimation_Mode10 8 \
 CONFIG.ADC_Mixer_Type10 Fine \
 CONFIG.ADC_Mixer_Mode10 Real->I/Q \
 CONFIG.ADC_Data_Width10 1 \
 CONFIG.ADC_NCO_Freq10 0 \
 CONFIG.ADC_NCO_Phase10 0 \
 CONFIG.ADC_Slice11_Enable {true} \
 CONFIG.ADC_Data_Type11 I/Q \
 CONFIG.ADC_Decimation_Mode11 8 \
 CONFIG.ADC_Mixer_Type11 Fine \
 CONFIG.ADC_Mixer_Mode11 Real->I/Q \
 CONFIG.ADC_Data_Width11 1 \
 CONFIG.ADC_NCO_Freq11 0 \
 CONFIG.ADC_NCO_Phase11 0 \
 CONFIG.ADC_Slice12_Enable {true} \
 CONFIG.ADC_Data_Type12 I/Q \
 CONFIG.ADC_Decimation_Mode12 8 \
 CONFIG.ADC_Mixer_Type12 Fine \
 CONFIG.ADC_Mixer_Mode12 Real->I/Q \
 CONFIG.ADC_Data_Width12 1 \
 CONFIG.ADC_NCO_Freq12 0 \
 CONFIG.ADC_NCO_Phase12 0 \
 CONFIG.ADC_Slice13_Enable {true} \
 CONFIG.ADC_Data_Type13 I/Q \
 CONFIG.ADC_Decimation_Mode13 8 \
 CONFIG.ADC_Mixer_Type13 Fine \
 CONFIG.ADC_Mixer_Mode13 Real->I/Q \
 CONFIG.ADC_Data_Width13 1 \
 CONFIG.ADC_NCO_Freq13 0 \
 CONFIG.ADC_NCO_Phase13 0 \
 CONFIG.ADC_Slice20_Enable {true} \
 CONFIG.ADC_Data_Type20 I/Q \
 CONFIG.ADC_Decimation_Mode20 8 \
 CONFIG.ADC_Mixer_Type20 Fine \
 CONFIG.ADC_Mixer_Mode20 Real->I/Q \
 CONFIG.ADC_Data_Width20 1 \
 CONFIG.ADC_NCO_Freq20 0 \
 CONFIG.ADC_NCO_Phase20 0 \
 CONFIG.ADC_Slice21_Enable {true} \
 CONFIG.ADC_Data_Type21 I/Q \
 CONFIG.ADC_Decimation_Mode21 8 \
 CONFIG.ADC_Mixer_Type21 Fine \
 CONFIG.ADC_Mixer_Mode21 Real->I/Q \
 CONFIG.ADC_Data_Width21 1 \
 CONFIG.ADC_NCO_Freq21 0 \
 CONFIG.ADC_NCO_Phase21 0 \
 CONFIG.ADC_Slice22_Enable {true} \
 CONFIG.ADC_Data_Type22 I/Q \
 CONFIG.ADC_Decimation_Mode22 8 \
 CONFIG.ADC_Mixer_Type22 Fine \
 CONFIG.ADC_Mixer_Mode22 Real->I/Q \
 CONFIG.ADC_Data_Width22 1 \
 CONFIG.ADC_NCO_Freq22 0 \
 CONFIG.ADC_NCO_Phase22 0 \
 CONFIG.ADC_Slice23_Enable {true} \
 CONFIG.ADC_Data_Type23 I/Q \
 CONFIG.ADC_Decimation_Mode23 8 \
 CONFIG.ADC_Mixer_Type23 Fine \
 CONFIG.ADC_Mixer_Mode23 Real->I/Q \
 CONFIG.ADC_Data_Width23 1 \
 CONFIG.ADC_NCO_Freq23 0 \
 CONFIG.ADC_NCO_Phase23 0 \
 CONFIG.ADC_Slice30_Enable {true} \
 CONFIG.ADC_Data_Type30 I/Q \
 CONFIG.ADC_Decimation_Mode30 8 \
 CONFIG.ADC_Mixer_Type30 Fine \
 CONFIG.ADC_Mixer_Mode30 Real->I/Q \
 CONFIG.ADC_Data_Width30 1 \
 CONFIG.ADC_NCO_Freq30 0 \
 CONFIG.ADC_NCO_Phase30 0 \
 CONFIG.ADC_Slice31_Enable {true} \
 CONFIG.ADC_Data_Type31 I/Q \
 CONFIG.ADC_Decimation_Mode31 8 \
 CONFIG.ADC_Mixer_Type31 Fine \
 CONFIG.ADC_Mixer_Mode31 Real->I/Q \
 CONFIG.ADC_Data_Width31 1 \
 CONFIG.ADC_NCO_Freq31 0 \
 CONFIG.ADC_NCO_Phase31 0 \
 CONFIG.ADC_Slice32_Enable {true} \
 CONFIG.ADC_Data_Type32 I/Q \
 CONFIG.ADC_Decimation_Mode32 8 \
 CONFIG.ADC_Mixer_Type32 Fine \
 CONFIG.ADC_Mixer_Mode32 Real->I/Q \
 CONFIG.ADC_Data_Width32 1 \
 CONFIG.ADC_NCO_Freq32 0 \
 CONFIG.ADC_NCO_Phase32 0 \
 CONFIG.ADC_Slice33_Enable {true} \
 CONFIG.ADC_Data_Type33 I/Q \
 CONFIG.ADC_Decimation_Mode33 8 \
 CONFIG.ADC_Mixer_Type33 Fine \
 CONFIG.ADC_Mixer_Mode33 Real->I/Q \
 CONFIG.ADC_Data_Width33 1 \
 CONFIG.ADC_NCO_Freq33 0 \
 CONFIG.ADC_NCO_Phase33 0 \
 CONFIG.DAC0_Enable {1} \
 CONFIG.DAC0_Sampling_Rate 2.04800000 \
 CONFIG.DAC0_PLL_Enable {true} \
 CONFIG.DAC0_Outclk_Freq 128.000 \
 CONFIG.DAC0_PLL_Enable {true} \
 CONFIG.DAC0_Outclk_Freq 128.000 \
 CONFIG.DAC0_Multi_Tile_Sync {false} \
 CONFIG.DAC1_Enable {1} \
 CONFIG.DAC1_Sampling_Rate 2.04800000 \
 CONFIG.DAC1_PLL_Enable {true} \
 CONFIG.DAC1_Outclk_Freq 128.000 \
 CONFIG.DAC1_PLL_Enable {true} \
 CONFIG.DAC1_Outclk_Freq 128.000 \
 CONFIG.DAC1_Multi_Tile_Sync {false} \
 CONFIG.DAC_Slice00_Enable {true} \
 CONFIG.DAC_Data_Type00 Real \
 CONFIG.DAC_Interpolation_Mode00 8 \
 CONFIG.DAC_Mixer_Type00 Fine \
 CONFIG.DAC_Mixer_Mode00 I/Q->Real \
 CONFIG.DAC_Data_Width00 2 \
 CONFIG.DAC_NCO_Freq00 0.5 \
 CONFIG.DAC_NCO_Phase00 0 \
 CONFIG.DAC_Invsinc_Ctrl00 {false} \
 CONFIG.DAC_Slice01_Enable {true} \
 CONFIG.DAC_Data_Type01 Real \
 CONFIG.DAC_Interpolation_Mode01 8 \
 CONFIG.DAC_Mixer_Type01 Fine \
 CONFIG.DAC_Mixer_Mode01 I/Q->Real \
 CONFIG.DAC_Data_Width01 2 \
 CONFIG.DAC_NCO_Freq01 0.5 \
 CONFIG.DAC_NCO_Phase01 0 \
 CONFIG.DAC_Invsinc_Ctrl01 {false} \
 CONFIG.DAC_Slice02_Enable {true} \
 CONFIG.DAC_Data_Type02 Real \
 CONFIG.DAC_Interpolation_Mode02 8 \
 CONFIG.DAC_Mixer_Type02 Fine \
 CONFIG.DAC_Mixer_Mode02 I/Q->Real \
 CONFIG.DAC_Data_Width02 2 \
 CONFIG.DAC_NCO_Freq02 0.5 \
 CONFIG.DAC_NCO_Phase02 0 \
 CONFIG.DAC_Invsinc_Ctrl02 {false} \
 CONFIG.DAC_Slice03_Enable {true} \
 CONFIG.DAC_Data_Type03 Real \
 CONFIG.DAC_Interpolation_Mode03 8 \
 CONFIG.DAC_Mixer_Type03 Fine \
 CONFIG.DAC_Mixer_Mode03 I/Q->Real \
 CONFIG.DAC_Data_Width03 2 \
 CONFIG.DAC_NCO_Freq03 0.5 \
 CONFIG.DAC_NCO_Phase03 0 \
 CONFIG.DAC_Invsinc_Ctrl03 {false} \
 CONFIG.DAC_Slice10_Enable {true} \
 CONFIG.DAC_Data_Type10 Real \
 CONFIG.DAC_Interpolation_Mode10 8 \
 CONFIG.DAC_Mixer_Type10 Fine \
 CONFIG.DAC_Mixer_Mode10 I/Q->Real \
 CONFIG.DAC_Data_Width10 2 \
 CONFIG.DAC_NCO_Freq10 0.5 \
 CONFIG.DAC_NCO_Phase10 0 \
 CONFIG.DAC_Invsinc_Ctrl10 {false} \
 CONFIG.DAC_Slice11_Enable {true} \
 CONFIG.DAC_Data_Type11 Real \
 CONFIG.DAC_Interpolation_Mode11 8 \
 CONFIG.DAC_Mixer_Type11 Fine \
 CONFIG.DAC_Mixer_Mode11 I/Q->Real \
 CONFIG.DAC_Data_Width11 2 \
 CONFIG.DAC_NCO_Freq11 0.5 \
 CONFIG.DAC_NCO_Phase11 0 \
 CONFIG.DAC_Invsinc_Ctrl11 {false} \
 CONFIG.DAC_Slice12_Enable {true} \
 CONFIG.DAC_Data_Type12 Real \
 CONFIG.DAC_Interpolation_Mode12 8 \
 CONFIG.DAC_Mixer_Type12 Fine \
 CONFIG.DAC_Mixer_Mode12 I/Q->Real \
 CONFIG.DAC_Data_Width12 2 \
 CONFIG.DAC_NCO_Freq12 0.5 \
 CONFIG.DAC_NCO_Phase12 0 \
 CONFIG.DAC_Invsinc_Ctrl12 {false} \
 CONFIG.DAC_Slice13_Enable {true} \
 CONFIG.DAC_Data_Type13 Real \
 CONFIG.DAC_Interpolation_Mode13 8 \
 CONFIG.DAC_Mixer_Type13 Fine \
 CONFIG.DAC_Mixer_Mode13 I/Q->Real \
 CONFIG.DAC_Data_Width13 2 \
 CONFIG.DAC_NCO_Freq13 0.5 \
 CONFIG.DAC_NCO_Phase13 0 \
 CONFIG.DAC_Invsinc_Ctrl13 {false} \
 CONFIG.DAC_NCO_RTS {false} \
 CONFIG.ADC_NCO_RTS {false} \
 CONFIG.ADC_RTS {false} \
 ] $RFDataConverter
create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 adc0_clk
hsb_connect adc0_clk RFDataConverter/adc0_clk
create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 adc1_clk
hsb_connect adc1_clk RFDataConverter/adc1_clk
create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 adc2_clk
hsb_connect adc2_clk RFDataConverter/adc2_clk
create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 adc3_clk
hsb_connect adc3_clk RFDataConverter/adc3_clk
create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vin0_01
hsb_connect vin0_01 RFDataConverter/vin0_01
create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vin0_23
hsb_connect vin0_23 RFDataConverter/vin0_23
create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vin1_01
hsb_connect vin1_01 RFDataConverter/vin1_01
create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vin1_23
hsb_connect vin1_23 RFDataConverter/vin1_23
create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vin2_01
hsb_connect vin2_01 RFDataConverter/vin2_01
create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vin2_23
hsb_connect vin2_23 RFDataConverter/vin2_23
create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vin3_01
hsb_connect vin3_01 RFDataConverter/vin3_01
create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vin3_23
hsb_connect vin3_23 RFDataConverter/vin3_23
create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 dac0_clk
hsb_connect dac0_clk RFDataConverter/dac0_clk
create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 dac1_clk
hsb_connect dac1_clk RFDataConverter/dac1_clk
create_bd_intf_port -mode Master -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vout00
hsb_connect vout00 RFDataConverter/vout00
create_bd_intf_port -mode Master -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vout01
hsb_connect vout01 RFDataConverter/vout01
create_bd_intf_port -mode Master -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vout02
hsb_connect vout02 RFDataConverter/vout02
create_bd_intf_port -mode Master -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vout03
hsb_connect vout03 RFDataConverter/vout03
create_bd_intf_port -mode Master -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vout10
hsb_connect vout10 RFDataConverter/vout10
create_bd_intf_port -mode Master -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vout11
hsb_connect vout11 RFDataConverter/vout11
create_bd_intf_port -mode Master -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vout12
hsb_connect vout12 RFDataConverter/vout12
create_bd_intf_port -mode Master -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vout13
hsb_connect vout13 RFDataConverter/vout13
set rfDCStreamClkGen [create_bd_cell -vlnv xilinx.com:ip:clk_wiz:6.0 rfDCStreamClkGen]
set_property -dict [list CONFIG.USE_LOCKED {false} CONFIG.USE_RESET {false} CONFIG.CLKOUT1_REQUESTED_OUT_FREQ 256] $rfDCStreamClkGen
hsb_connect RFDataConverter/clk_adc0 rfDCStreamClkGen/clk_in1
create_bd_cell -type ip -vlnv mathworks.com:user:DAC_Muxer:1.0 DAC_Muxer_0
set_property -dict [list CONFIG.SAMPLESPERCLOCK 1 CONFIG.IQMODE {true}] [get_bd_cells DAC_Muxer_0]
hsb_connect DAC_Muxer_0/DAC RFDataConverter/s00_axis_tdata
hsb_connect DAC_Muxer_0/ValidOut RFDataConverter/s00_axis_tvalid
create_bd_cell -type ip -vlnv mathworks.com:user:DAC_Muxer:1.0 DAC_Muxer_1
set_property -dict [list CONFIG.SAMPLESPERCLOCK 1 CONFIG.IQMODE {true}] [get_bd_cells DAC_Muxer_1]
hsb_connect DAC_Muxer_1/DAC RFDataConverter/s01_axis_tdata
hsb_connect DAC_Muxer_1/ValidOut RFDataConverter/s01_axis_tvalid
create_bd_cell -type ip -vlnv mathworks.com:user:DAC_Muxer:1.0 DAC_Muxer_2
set_property -dict [list CONFIG.SAMPLESPERCLOCK 1 CONFIG.IQMODE {true}] [get_bd_cells DAC_Muxer_2]
hsb_connect DAC_Muxer_2/DAC RFDataConverter/s02_axis_tdata
hsb_connect DAC_Muxer_2/ValidOut RFDataConverter/s02_axis_tvalid
create_bd_cell -type ip -vlnv mathworks.com:user:DAC_Muxer:1.0 DAC_Muxer_3
set_property -dict [list CONFIG.SAMPLESPERCLOCK 1 CONFIG.IQMODE {true}] [get_bd_cells DAC_Muxer_3]
hsb_connect DAC_Muxer_3/DAC RFDataConverter/s03_axis_tdata
hsb_connect DAC_Muxer_3/ValidOut RFDataConverter/s03_axis_tvalid
create_bd_cell -type ip -vlnv mathworks.com:user:DAC_Muxer:1.0 DAC_Muxer_4
set_property -dict [list CONFIG.SAMPLESPERCLOCK 1 CONFIG.IQMODE {true}] [get_bd_cells DAC_Muxer_4]
hsb_connect DAC_Muxer_4/DAC RFDataConverter/s10_axis_tdata
hsb_connect DAC_Muxer_4/ValidOut RFDataConverter/s10_axis_tvalid
create_bd_cell -type ip -vlnv mathworks.com:user:DAC_Muxer:1.0 DAC_Muxer_5
set_property -dict [list CONFIG.SAMPLESPERCLOCK 1 CONFIG.IQMODE {true}] [get_bd_cells DAC_Muxer_5]
hsb_connect DAC_Muxer_5/DAC RFDataConverter/s11_axis_tdata
hsb_connect DAC_Muxer_5/ValidOut RFDataConverter/s11_axis_tvalid
create_bd_cell -type ip -vlnv mathworks.com:user:DAC_Muxer:1.0 DAC_Muxer_6
set_property -dict [list CONFIG.SAMPLESPERCLOCK 1 CONFIG.IQMODE {true}] [get_bd_cells DAC_Muxer_6]
hsb_connect DAC_Muxer_6/DAC RFDataConverter/s12_axis_tdata
hsb_connect DAC_Muxer_6/ValidOut RFDataConverter/s12_axis_tvalid
create_bd_cell -type ip -vlnv mathworks.com:user:DAC_Muxer:1.0 DAC_Muxer_7
set_property -dict [list CONFIG.SAMPLESPERCLOCK 1 CONFIG.IQMODE {true}] [get_bd_cells DAC_Muxer_7]
hsb_connect DAC_Muxer_7/DAC RFDataConverter/s13_axis_tdata
hsb_connect DAC_Muxer_7/ValidOut RFDataConverter/s13_axis_tvalid
create_bd_cell -type ip -vlnv mathworks.com:user:ADC_Demuxer:1.0 ADC_Demuxer_0
set_property -dict [list CONFIG.SAMPLESPERCLOCK 1 CONFIG.IQMODE {true}] [get_bd_cells ADC_Demuxer_0]
hsb_connect RFDataConverter/m00_axis_tdata ADC_Demuxer_0/I_In
hsb_connect RFDataConverter/m00_axis_tvalid ADC_Demuxer_0/I_Valid
hsb_connect RFDataConverter/m01_axis_tdata ADC_Demuxer_0/Q_in
hsb_connect RFDataConverter/m01_axis_tvalid ADC_Demuxer_0/Q_Valid
create_bd_cell -type ip -vlnv mathworks.com:user:ADC_Demuxer:1.0 ADC_Demuxer_1
set_property -dict [list CONFIG.SAMPLESPERCLOCK 1 CONFIG.IQMODE {true}] [get_bd_cells ADC_Demuxer_1]
hsb_connect RFDataConverter/m02_axis_tdata ADC_Demuxer_1/I_In
hsb_connect RFDataConverter/m02_axis_tvalid ADC_Demuxer_1/I_Valid
hsb_connect RFDataConverter/m03_axis_tdata ADC_Demuxer_1/Q_in
hsb_connect RFDataConverter/m03_axis_tvalid ADC_Demuxer_1/Q_Valid
create_bd_cell -type ip -vlnv mathworks.com:user:ADC_Demuxer:1.0 ADC_Demuxer_2
set_property -dict [list CONFIG.SAMPLESPERCLOCK 1 CONFIG.IQMODE {true}] [get_bd_cells ADC_Demuxer_2]
hsb_connect RFDataConverter/m10_axis_tdata ADC_Demuxer_2/I_In
hsb_connect RFDataConverter/m10_axis_tvalid ADC_Demuxer_2/I_Valid
hsb_connect RFDataConverter/m11_axis_tdata ADC_Demuxer_2/Q_in
hsb_connect RFDataConverter/m11_axis_tvalid ADC_Demuxer_2/Q_Valid
create_bd_cell -type ip -vlnv mathworks.com:user:ADC_Demuxer:1.0 ADC_Demuxer_3
set_property -dict [list CONFIG.SAMPLESPERCLOCK 1 CONFIG.IQMODE {true}] [get_bd_cells ADC_Demuxer_3]
hsb_connect RFDataConverter/m12_axis_tdata ADC_Demuxer_3/I_In
hsb_connect RFDataConverter/m12_axis_tvalid ADC_Demuxer_3/I_Valid
hsb_connect RFDataConverter/m13_axis_tdata ADC_Demuxer_3/Q_in
hsb_connect RFDataConverter/m13_axis_tvalid ADC_Demuxer_3/Q_Valid
create_bd_cell -type ip -vlnv mathworks.com:user:ADC_Demuxer:1.0 ADC_Demuxer_4
set_property -dict [list CONFIG.SAMPLESPERCLOCK 1 CONFIG.IQMODE {true}] [get_bd_cells ADC_Demuxer_4]
hsb_connect RFDataConverter/m20_axis_tdata ADC_Demuxer_4/I_In
hsb_connect RFDataConverter/m20_axis_tvalid ADC_Demuxer_4/I_Valid
hsb_connect RFDataConverter/m21_axis_tdata ADC_Demuxer_4/Q_in
hsb_connect RFDataConverter/m21_axis_tvalid ADC_Demuxer_4/Q_Valid
create_bd_cell -type ip -vlnv mathworks.com:user:ADC_Demuxer:1.0 ADC_Demuxer_5
set_property -dict [list CONFIG.SAMPLESPERCLOCK 1 CONFIG.IQMODE {true}] [get_bd_cells ADC_Demuxer_5]
hsb_connect RFDataConverter/m22_axis_tdata ADC_Demuxer_5/I_In
hsb_connect RFDataConverter/m22_axis_tvalid ADC_Demuxer_5/I_Valid
hsb_connect RFDataConverter/m23_axis_tdata ADC_Demuxer_5/Q_in
hsb_connect RFDataConverter/m23_axis_tvalid ADC_Demuxer_5/Q_Valid
create_bd_cell -type ip -vlnv mathworks.com:user:ADC_Demuxer:1.0 ADC_Demuxer_6
set_property -dict [list CONFIG.SAMPLESPERCLOCK 1 CONFIG.IQMODE {true}] [get_bd_cells ADC_Demuxer_6]
hsb_connect RFDataConverter/m30_axis_tdata ADC_Demuxer_6/I_In
hsb_connect RFDataConverter/m30_axis_tvalid ADC_Demuxer_6/I_Valid
hsb_connect RFDataConverter/m31_axis_tdata ADC_Demuxer_6/Q_in
hsb_connect RFDataConverter/m31_axis_tvalid ADC_Demuxer_6/Q_Valid
create_bd_cell -type ip -vlnv mathworks.com:user:ADC_Demuxer:1.0 ADC_Demuxer_7
set_property -dict [list CONFIG.SAMPLESPERCLOCK 1 CONFIG.IQMODE {true}] [get_bd_cells ADC_Demuxer_7]
hsb_connect RFDataConverter/m32_axis_tdata ADC_Demuxer_7/I_In
hsb_connect RFDataConverter/m32_axis_tvalid ADC_Demuxer_7/I_Valid
hsb_connect RFDataConverter/m33_axis_tdata ADC_Demuxer_7/Q_in
hsb_connect RFDataConverter/m33_axis_tvalid ADC_Demuxer_7/Q_Valid
hsb_connect RFDataConverter/m0_axis_aclk rfDCStreamClkGen/clk_out1
hsb_connect RFDataConverter/m1_axis_aclk rfDCStreamClkGen/clk_out1
hsb_connect RFDataConverter/m2_axis_aclk rfDCStreamClkGen/clk_out1
hsb_connect RFDataConverter/m3_axis_aclk rfDCStreamClkGen/clk_out1
hsb_connect RFDataConverter/s0_axis_aclk rfDCStreamClkGen/clk_out1
hsb_connect RFDataConverter/s1_axis_aclk rfDCStreamClkGen/clk_out1
hsb_connect RFDataConverter/m0_axis_aresetn ipcore_rstgen/peripheral_aresetn
hsb_connect RFDataConverter/m1_axis_aresetn ipcore_rstgen/peripheral_aresetn
hsb_connect RFDataConverter/m2_axis_aresetn ipcore_rstgen/peripheral_aresetn
hsb_connect RFDataConverter/m3_axis_aresetn ipcore_rstgen/peripheral_aresetn
hsb_connect RFDataConverter/s0_axis_aresetn ipcore_rstgen/peripheral_aresetn
hsb_connect RFDataConverter/s1_axis_aresetn ipcore_rstgen/peripheral_aresetn

