`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.03.2020 20:52:19
// Design Name: 
// Module Name: xmii_mac_hub
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ethernet_mac_hub_mii # (
	parameter [47:0] MACADDR = 48'h000A3502218A,
	parameter IPADDR1 = 192,
	parameter IPADDR2 = 168,
	parameter IPADDR3 = 0,
	parameter IPADDR4 = 2,
	parameter NUM_AXIS_CHANNELS = 8,
	parameter UDP_DSTPORT_FORCH1 = 50101,
	parameter UDP_DSTPORT_FORCH2 = 50102,
	parameter UDP_DSTPORT_FORCH3 = 50103,
	parameter UDP_DSTPORT_FORCH4 = 50104,
	parameter UDP_DSTPORT_FORCH5 = 50105,
	parameter UDP_DSTPORT_FORCH6 = 50106,
	parameter UDP_DSTPORT_FORCH7 = 50107,
	parameter UDP_DSTPORT_FORCH8 = 50108
)(
	input         	axis_aclk,
	output        	axis_aresetn,
	output   [7:0]	m0_axis_tdata,
	output        	m0_axis_tlast,
	input         	m0_axis_tready,
	output        	m0_axis_tvalid,
	output   [7:0]	m1_axis_tdata,
	output        	m1_axis_tlast,
	input         	m1_axis_tready,
	output        	m1_axis_tvalid,
	output   [7:0]	m2_axis_tdata,
	output        	m2_axis_tlast,
	input         	m2_axis_tready,
	output        	m2_axis_tvalid,
	output   [7:0]	m3_axis_tdata,
	output        	m3_axis_tlast,
	input         	m3_axis_tready,
	output        	m3_axis_tvalid,
	output   [7:0]	m4_axis_tdata,
	output        	m4_axis_tlast,
	input         	m4_axis_tready,
	output        	m4_axis_tvalid,
	output   [7:0]  m5_axis_tdata,
	output          m5_axis_tlast,
	input           m5_axis_tready,
	output          m5_axis_tvalid,
	output   [7:0]  m6_axis_tdata,
	output          m6_axis_tlast,
	input           m6_axis_tready,
	output          m6_axis_tvalid,
	output   [7:0]  m7_axis_tdata,
	output          m7_axis_tlast,
	input           m7_axis_tready,
	output          m7_axis_tvalid,
	input    [7:0]	s0_axis_tdata,
	input         	s0_axis_tlast,
	output        	s0_axis_tready,
	input         	s0_axis_tvalid,
	input    [7:0]	s1_axis_tdata,
	input         	s1_axis_tlast,
	output        	s1_axis_tready,
	input         	s1_axis_tvalid,
	input    [7:0]	s2_axis_tdata,
	input         	s2_axis_tlast,
	output        	s2_axis_tready,
	input         	s2_axis_tvalid,
	input    [7:0]	s3_axis_tdata,
	input         	s3_axis_tlast,
	output        	s3_axis_tready,
	input         	s3_axis_tvalid,
	input    [7:0]	s4_axis_tdata,
	input         	s4_axis_tlast,
	output        	s4_axis_tready,
	input         	s4_axis_tvalid,
	input    [7:0]	s5_axis_tdata,
	input         	s5_axis_tlast,
	output        	s5_axis_tready,
	input         	s5_axis_tvalid,
	input    [7:0]	s6_axis_tdata,
	input         	s6_axis_tlast,
	output        	s6_axis_tready,
	input         	s6_axis_tvalid,
	input    [7:0]	s7_axis_tdata,
	input         	s7_axis_tlast,
	output        	s7_axis_tready,
	input         	s7_axis_tvalid,

	//
	input 			reset,

	//MII Interface
	input         	mii_col,
	input         	mii_crs,
	input         	mii_rxclk,
	input    [3:0]	mii_rxd,
	input         	mii_rxdv,
	input         	mii_rxer,
	output   [3:0]	mii_txd,
	output         	mii_txen,
	output         	mii_txer,
	input         	mii_txclk,
	
	//MDIO Interface
	output			phy_mdc,
	inout 			phy_mdio,
	output 			phy_reset_n
  
    );
//local parameters
	localparam DATAWIDTH = 8;

//Internal signals
	wire 			mii2gmii_rxclk_en;
	wire 			mii2gmii_txclk_en;
	wire 	[7:0]	mii2gmii_rxd;
	wire 	[7:0]	mii2gmii_txd;
	wire 			mii2gmii_rxdv;
	wire 			mii2gmii_rxer;
	wire 			mii2gmii_txer;
	wire 			mii2gmii_txen;
	wire 			mii2gmii_col;
	wire 			mii2gmii_crs;
    wire            axis_aresetn;
    wire            dut_rst;
    
    assign axis_aresetn = ~dut_rst;
    
//MDIO
  MWMdioBasic MWMdioBasic_i (
    .RESET_IN(reset),
    .ETH_MDIO(phy_mdio),
    .ETH_MDC(phy_mdc),
    .ETH_RESET_n(phy_reset_n)
  );

//MII2GMII 
mwmii2gmii mwmii2gmii_i (
	.col(mii2gmii_col),
	.crs(mii2gmii_crs),
	.mii_col(mii_col),
	.mii_crs(mii_crs),
	.mii_rxd(mii_rxd),
	.mii_rxdv(mii_rxdv),
	.mii_rxer(mii_rxer),
	.mii_txd(mii_txd),
	.mii_txen(mii_txen),
	.mii_txer(mii_txer),
	.reset(reset),
	.rxclk(mii_rxclk),
	.rxclk_en(mii2gmii_rxclk_en),
	.rxd(mii2gmii_rxd),
	.rxdvld(mii2gmii_rxdv),
	.rxerror(mii2gmii_rxer),
	.txclk(mii_txclk),
	.txclk_en(mii2gmii_txclk_en),
	.txd(mii2gmii_txd),
	.txen(mii2gmii_txen),
	.txerror(mii2gmii_txer)
	);

//GMII AXIS MAC
mwmacaxis_top # (
  .MWMACADDR1 (MACADDR[47:40]),
  .MWMACADDR2 (MACADDR[39:32]),
  .MWMACADDR3 (MACADDR[31:24]),
  .MWMACADDR4 (MACADDR[23:16]),
  .MWMACADDR5 (MACADDR[15:8]),
  .MWMACADDR6 (MACADDR[7:0]),
  .MWIPADDR1 (IPADDR1),
  .MWIPADDR2 (IPADDR2),
  .MWIPADDR3 (IPADDR3),
  .MWIPADDR4 (IPADDR4),
  .NUM_AXIS_CHANNELS(NUM_AXIS_CHANNELS),
  .DSTPORT_0 (UDP_DSTPORT_FORCH1),
  .DSTPORT_1 (UDP_DSTPORT_FORCH2),
  .DSTPORT_2 (UDP_DSTPORT_FORCH3),
  .DSTPORT_3 (UDP_DSTPORT_FORCH4),
  .DSTPORT_4 (UDP_DSTPORT_FORCH5),
  .DSTPORT_5 (UDP_DSTPORT_FORCH6),
  .DSTPORT_6 (UDP_DSTPORT_FORCH7),
  .DSTPORT_7 (UDP_DSTPORT_FORCH8),
  .DATAWIDTH (DATAWIDTH)
  ) 
mwmacaxis_top_i (
  .rxclk(mii_rxclk),
  .rxclk_en(mii2gmii_rxclk_en),

  .txclk(mii_txclk),
  .txclk_en(mii2gmii_txclk_en),
  
  .reset(reset),
  
  .gmii_rxd(mii2gmii_rxd),
  .gmii_rx_dv(mii2gmii_rxdv),
  .gmii_rx_er(mii2gmii_rxer),
  .gmii_col(mii2gmii_col),
  .gmii_crs(mii2gmii_crs),
  
  .gmii_txd(mii2gmii_txd),
  .gmii_tx_en(mii2gmii_txen),
  .gmii_tx_er(mii2gmii_txer),
  
  .dutclk(axis_aclk),
  .dutrst(dut_rst),
  
  .ch0_m_axis_tdata(m0_axis_tdata),
  .ch0_m_axis_tvalid(m0_axis_tvalid),
  .ch0_m_axis_tlast(m0_axis_tlast),
  .ch0_m_axis_tready(m0_axis_tready),
  .ch0_s_axis_tdata(s0_axis_tdata),
  .ch0_s_axis_tvalid(s0_axis_tvalid),
  .ch0_s_axis_tlast(s0_axis_tlast),
  .ch0_s_axis_tready(s0_axis_tready),
  
  .ch1_m_axis_tdata(m1_axis_tdata),
  .ch1_m_axis_tvalid(m1_axis_tvalid),
  .ch1_m_axis_tlast(m1_axis_tlast),
  .ch1_m_axis_tready(m1_axis_tready),
  .ch1_s_axis_tdata(s1_axis_tdata),
  .ch1_s_axis_tvalid(s1_axis_tvalid),
  .ch1_s_axis_tlast(s1_axis_tlast),
  .ch1_s_axis_tready(s1_axis_tready),
  
  .ch2_m_axis_tdata(m2_axis_tdata),
  .ch2_m_axis_tvalid(m2_axis_tvalid),
  .ch2_m_axis_tlast(m2_axis_tlast),
  .ch2_m_axis_tready(m2_axis_tready),
  .ch2_s_axis_tdata(s2_axis_tdata),
  .ch2_s_axis_tvalid(s2_axis_tvalid),
  .ch2_s_axis_tlast(s2_axis_tlast),
  .ch2_s_axis_tready(s2_axis_tready),
  
  .ch3_m_axis_tdata(m3_axis_tdata),
  .ch3_m_axis_tvalid(m3_axis_tvalid),
  .ch3_m_axis_tlast(m3_axis_tlast),
  .ch3_m_axis_tready(m3_axis_tready),
  .ch3_s_axis_tdata(s3_axis_tdata),
  .ch3_s_axis_tvalid(s3_axis_tvalid),
  .ch3_s_axis_tlast(s3_axis_tlast),
  .ch3_s_axis_tready(s3_axis_tready),
  
  .ch4_m_axis_tdata(m4_axis_tdata),
  .ch4_m_axis_tvalid(m4_axis_tvalid),
  .ch4_m_axis_tlast(m4_axis_tlast),
  .ch4_m_axis_tready(m4_axis_tready),
  .ch4_s_axis_tdata(s4_axis_tdata),
  .ch4_s_axis_tvalid(s4_axis_tvalid),
  .ch4_s_axis_tlast(s4_axis_tlast),
  .ch4_s_axis_tready(s4_axis_tready),
  
  .ch5_m_axis_tdata(m5_axis_tdata),
  .ch5_m_axis_tvalid(m5_axis_tvalid),
  .ch5_m_axis_tlast(m5_axis_tlast),
  .ch5_m_axis_tready(m5_axis_tready),
  .ch5_s_axis_tdata(s5_axis_tdata),
  .ch5_s_axis_tvalid(s5_axis_tvalid),
  .ch5_s_axis_tlast(s5_axis_tlast),
  .ch5_s_axis_tready(s5_axis_tready),
  
  .ch6_m_axis_tdata(m6_axis_tdata),
  .ch6_m_axis_tvalid(m6_axis_tvalid),
  .ch6_m_axis_tlast(m6_axis_tlast),
  .ch6_m_axis_tready(m6_axis_tready),
  .ch6_s_axis_tdata(s6_axis_tdata),
  .ch6_s_axis_tvalid(s6_axis_tvalid),
  .ch6_s_axis_tlast(s6_axis_tlast),
  .ch6_s_axis_tready(s6_axis_tready),
  
  .ch7_m_axis_tdata(m7_axis_tdata),
  .ch7_m_axis_tvalid(m7_axis_tvalid),
  .ch7_m_axis_tlast(m7_axis_tlast),
  .ch7_m_axis_tready(m7_axis_tready),
  .ch7_s_axis_tdata(s7_axis_tdata),
  .ch7_s_axis_tvalid(s7_axis_tvalid),
  .ch7_s_axis_tlast(s7_axis_tlast),
  .ch7_s_axis_tready(s7_axis_tready)
);
  
endmodule
