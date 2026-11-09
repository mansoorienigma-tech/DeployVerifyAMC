
`timescale 1 ps / 1 ps

module sgmii_core #
(
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
)
   (ETH_GTREFCLK_N,
    ETH_GTREFCLK_P,
    ETH_MDC,
    ETH_MDIO,
    ETH_RESET_n,
    ETH_RXN,
    ETH_RXP,
    ETH_TXN,
    ETH_TXP,
    axis_aclk,
    m0_axis_tdata,
    m0_axis_tlast,
    m0_axis_tready,
    m0_axis_tvalid,
    m1_axis_tdata,
    m1_axis_tlast,
    m1_axis_tready,
    m1_axis_tvalid,
    m2_axis_tdata,
    m2_axis_tlast,
    m2_axis_tready,
    m2_axis_tvalid,
    m3_axis_tdata,
    m3_axis_tlast,
    m3_axis_tready,
    m3_axis_tvalid,
    m4_axis_tdata,
    m4_axis_tlast,
    m4_axis_tready,
    m4_axis_tvalid,
    m5_axis_tdata,
    m5_axis_tlast,
    m5_axis_tready,
    m5_axis_tvalid,
    m6_axis_tdata,
    m6_axis_tlast,
    m6_axis_tready,
    m6_axis_tvalid,
    m7_axis_tdata,
    m7_axis_tlast,
    m7_axis_tready,
    m7_axis_tvalid,
    reset,
    s0_axis_tdata,
    s0_axis_tlast,
    s0_axis_tready,
    s0_axis_tvalid,
    s1_axis_tdata,
    s1_axis_tlast,
    s1_axis_tready,
    s1_axis_tvalid,
    s2_axis_tdata,
    s2_axis_tlast,
    s2_axis_tready,
    s2_axis_tvalid,
    s3_axis_tdata,
    s3_axis_tlast,
    s3_axis_tready,
    s3_axis_tvalid,
    s4_axis_tdata,
    s4_axis_tlast,
    s4_axis_tready,
    s4_axis_tvalid,
    s5_axis_tdata,
    s5_axis_tlast,
    s5_axis_tready,
    s5_axis_tvalid,
    s6_axis_tdata,
    s6_axis_tlast,
    s6_axis_tready,
    s6_axis_tvalid,
    s7_axis_tdata,
    s7_axis_tlast,
    s7_axis_tready,
    s7_axis_tvalid,
    sgmii_clk);
  input ETH_GTREFCLK_N;
  input ETH_GTREFCLK_P;
  output ETH_MDC;
  inout ETH_MDIO;
  output ETH_RESET_n;
  input ETH_RXN;
  input ETH_RXP;
  output ETH_TXN;
  output ETH_TXP;
  input axis_aclk;
  output [7:0]m0_axis_tdata;
  output m0_axis_tlast;
  input m0_axis_tready;
  output m0_axis_tvalid;
  output [7:0]m1_axis_tdata;
  output m1_axis_tlast;
  input m1_axis_tready;
  output m1_axis_tvalid;
  output [7:0]m2_axis_tdata;
  output m2_axis_tlast;
  input m2_axis_tready;
  output m2_axis_tvalid;
  output [7:0]m3_axis_tdata;
  output m3_axis_tlast;
  input m3_axis_tready;
  output m3_axis_tvalid;
  output [7:0]m4_axis_tdata;
  output m4_axis_tlast;
  input m4_axis_tready;
  output m4_axis_tvalid;
  output [7:0]m5_axis_tdata;
  output m5_axis_tlast;
  input m5_axis_tready;
  output m5_axis_tvalid;
  output [7:0]m6_axis_tdata;
  output m6_axis_tlast;
  input m6_axis_tready;
  output m6_axis_tvalid;
  output [7:0]m7_axis_tdata;
  output m7_axis_tlast;
  input m7_axis_tready;
  output m7_axis_tvalid;
  input reset;
  input [7:0]s0_axis_tdata;
  input s0_axis_tlast;
  output s0_axis_tready;
  input s0_axis_tvalid;
  input [7:0]s1_axis_tdata;
  input s1_axis_tlast;
  output s1_axis_tready;
  input s1_axis_tvalid;
  input [7:0]s2_axis_tdata;
  input s2_axis_tlast;
  output s2_axis_tready;
  input s2_axis_tvalid;
  input [7:0]s3_axis_tdata;
  input s3_axis_tlast;
  output s3_axis_tready;
  input s3_axis_tvalid;
  input [7:0]s4_axis_tdata;
  input s4_axis_tlast;
  output s4_axis_tready;
  input s4_axis_tvalid;
  input [7:0]s5_axis_tdata;
  input s5_axis_tlast;
  output s5_axis_tready;
  input s5_axis_tvalid;
  input [7:0]s6_axis_tdata;
  input s6_axis_tlast;
  output s6_axis_tready;
  input s6_axis_tvalid;
  input [7:0]s7_axis_tdata;
  input s7_axis_tlast;
  output s7_axis_tready;
  input s7_axis_tvalid;
  input sgmii_clk;

  wire ETH_GTREFCLK_N_1;
  wire ETH_GTREFCLK_P_1;
  wire ETH_RXN_1;
  wire ETH_RXP_1;
  wire MWMdioBasic_0_ETH_MDC;
  wire MWMdioBasic_0_ETH_RESET_n;
  wire Net1;
  wire axis_aclk_0_1;
  wire [7:0]m0_axis_TDATA;
  wire m0_axis_TLAST;
  wire m0_axis_TREADY;
  wire m0_axis_TVALID;
  wire [7:0]m1_axis_TDATA;
  wire m1_axis_TLAST;
  wire m1_axis_TREADY;
  wire m1_axis_TVALID;
  wire [7:0]m2_axis_TDATA;
  wire m2_axis_TLAST;
  wire m2_axis_TREADY;
  wire m2_axis_TVALID;
  wire [7:0]m3_axis_TDATA;
  wire m3_axis_TLAST;
  wire m3_axis_TREADY;
  wire m3_axis_TVALID;
  wire [7:0]m4_axis_TDATA;
  wire m4_axis_TLAST;
  wire m4_axis_TREADY;
  wire m4_axis_TVALID;
  wire [7:0]m5_axis_TDATA;
  wire m5_axis_TLAST;
  wire m5_axis_TREADY;
  wire m5_axis_TVALID;
  wire [7:0]m6_axis_TDATA;
  wire m6_axis_TLAST;
  wire m6_axis_TREADY;
  wire m6_axis_TVALID;
  wire [7:0]m7_axis_TDATA;
  wire m7_axis_TLAST;
  wire m7_axis_TREADY;
  wire m7_axis_TVALID;
  wire [7:0]ethernet_mac_hub_1_phy_txd;
  wire ethernet_mac_hub_1_phy_txen;
  wire ethernet_mac_hub_1_phy_txer;
  wire gig_ethernet_pcs_pma_0_gmii_rx_dv;
  wire gig_ethernet_pcs_pma_0_gmii_rx_er;
  wire [7:0]gig_ethernet_pcs_pma_0_gmii_rxd;
  wire gig_ethernet_pcs_pma_0_txn;
  wire gig_ethernet_pcs_pma_0_txp;
  wire gig_ethernet_pcs_pma_0_userclk2_out;
  wire independent_clock_bufg_0_1;
  wire [7:0]s0_axis_1_TDATA;
  wire s0_axis_1_TLAST;
  wire s0_axis_1_TREADY;
  wire s0_axis_1_TVALID;
  wire [7:0]s1_axis_1_TDATA;
  wire s1_axis_1_TLAST;
  wire s1_axis_1_TREADY;
  wire s1_axis_1_TVALID;
  wire [7:0]s2_axis_1_TDATA;
  wire s2_axis_1_TLAST;
  wire s2_axis_1_TREADY;
  wire s2_axis_1_TVALID;
  wire [7:0]s3_axis_1_TDATA;
  wire s3_axis_1_TLAST;
  wire s3_axis_1_TREADY;
  wire s3_axis_1_TVALID;
  wire [7:0]s4_axis_1_TDATA;
  wire s4_axis_1_TLAST;
  wire s4_axis_1_TREADY;
  wire s4_axis_1_TVALID;
  wire [7:0]s5_axis_1_TDATA;
  wire s5_axis_1_TLAST;
  wire s5_axis_1_TREADY;
  wire s5_axis_1_TVALID;
  wire [7:0]s6_axis_1_TDATA;
  wire s6_axis_1_TLAST;
  wire s6_axis_1_TREADY;
  wire s6_axis_1_TVALID;
  wire [7:0]s7_axis_1_TDATA;
  wire s7_axis_1_TLAST;
  wire s7_axis_1_TREADY;
  wire s7_axis_1_TVALID;
  wire xlconstant_0_dout;
  wire [15:0]xlconstant_1_dout;
  wire [4:0]xlconstant_2_dout;
  wire [0:0]xlconstant_3_dout;
  wire [0:0]xlconstant_4_dout;

  assign ETH_GTREFCLK_N_1 = ETH_GTREFCLK_N;
  assign ETH_GTREFCLK_P_1 = ETH_GTREFCLK_P;
  assign ETH_MDC = MWMdioBasic_0_ETH_MDC;
  assign ETH_RESET_n = MWMdioBasic_0_ETH_RESET_n;
  assign ETH_RXN_1 = ETH_RXN;
  assign ETH_RXP_1 = ETH_RXP;
  assign ETH_TXN = gig_ethernet_pcs_pma_0_txn;
  assign ETH_TXP = gig_ethernet_pcs_pma_0_txp;
  assign axis_aclk_0_1 = axis_aclk;
  assign m0_axis_TREADY = m0_axis_tready;
  assign m1_axis_TREADY = m1_axis_tready;
  assign m2_axis_TREADY = m2_axis_tready;
  assign m3_axis_TREADY = m3_axis_tready;
  assign m4_axis_TREADY = m4_axis_tready;
  assign m5_axis_TREADY = m5_axis_tready;
  assign m6_axis_TREADY = m6_axis_tready;
  assign m7_axis_TREADY = m7_axis_tready;
  assign independent_clock_bufg_0_1 = sgmii_clk;
  assign m0_axis_tdata[7:0] = m0_axis_TDATA;
  assign m0_axis_tlast = m0_axis_TLAST;
  assign m0_axis_tvalid = m0_axis_TVALID;
  assign m1_axis_tdata[7:0] = m1_axis_TDATA;
  assign m1_axis_tlast = m1_axis_TLAST;
  assign m1_axis_tvalid = m1_axis_TVALID;
  assign m2_axis_tdata[7:0] = m2_axis_TDATA;
  assign m2_axis_tlast = m2_axis_TLAST;
  assign m2_axis_tvalid = m2_axis_TVALID;
  assign m3_axis_tdata[7:0] = m3_axis_TDATA;
  assign m3_axis_tlast = m3_axis_TLAST;
  assign m3_axis_tvalid = m3_axis_TVALID;
  assign m4_axis_tdata[7:0] = m4_axis_TDATA;
  assign m4_axis_tlast = m4_axis_TLAST;
  assign m4_axis_tvalid = m4_axis_TVALID;
  assign m5_axis_tdata[7:0] = m5_axis_TDATA;
  assign m5_axis_tlast = m5_axis_TLAST;
  assign m5_axis_tvalid = m5_axis_TVALID;
  assign m6_axis_tdata[7:0] = m6_axis_TDATA;
  assign m6_axis_tlast = m6_axis_TLAST;
  assign m6_axis_tvalid = m6_axis_TVALID;
  assign m7_axis_tdata[7:0] = m7_axis_TDATA;
  assign m7_axis_tlast = m7_axis_TLAST;
  assign m7_axis_tvalid = m7_axis_TVALID;
  assign s0_axis_1_TDATA = s0_axis_tdata[7:0];
  assign s0_axis_1_TLAST = s0_axis_tlast;
  assign s0_axis_1_TVALID = s0_axis_tvalid;
  assign s0_axis_tready = s0_axis_1_TREADY;
  assign s1_axis_1_TDATA = s1_axis_tdata[7:0];
  assign s1_axis_1_TLAST = s1_axis_tlast;
  assign s1_axis_1_TVALID = s1_axis_tvalid;
  assign s1_axis_tready = s1_axis_1_TREADY;
  assign s2_axis_1_TDATA = s2_axis_tdata[7:0];
  assign s2_axis_1_TLAST = s2_axis_tlast;
  assign s2_axis_1_TVALID = s2_axis_tvalid;
  assign s2_axis_tready = s2_axis_1_TREADY;
  assign s3_axis_1_TDATA = s3_axis_tdata[7:0];
  assign s3_axis_1_TLAST = s3_axis_tlast;
  assign s3_axis_1_TVALID = s3_axis_tvalid;
  assign s3_axis_tready = s3_axis_1_TREADY;
  assign s4_axis_1_TDATA = s4_axis_tdata[7:0];
  assign s4_axis_1_TLAST = s4_axis_tlast;
  assign s4_axis_1_TVALID = s4_axis_tvalid;
  assign s4_axis_tready = s4_axis_1_TREADY;
  assign s5_axis_1_TDATA = s5_axis_tdata[7:0];
  assign s5_axis_1_TLAST = s5_axis_tlast;
  assign s5_axis_1_TVALID = s5_axis_tvalid;
  assign s5_axis_tready = s5_axis_1_TREADY;
  assign s6_axis_1_TDATA = s6_axis_tdata[7:0];
  assign s6_axis_1_TLAST = s6_axis_tlast;
  assign s6_axis_1_TVALID = s6_axis_tvalid;
  assign s6_axis_tready = s6_axis_1_TREADY;
  assign s7_axis_1_TDATA = s7_axis_tdata[7:0];
  assign s7_axis_1_TLAST = s7_axis_tlast;
  assign s7_axis_1_TVALID = s7_axis_tvalid;
  assign s7_axis_tready = s7_axis_1_TREADY;
  assign xlconstant_0_dout = reset;
  
  MWMdioBasic MWMdioBasic_0
       (.ETH_MDC(MWMdioBasic_0_ETH_MDC),
        .ETH_MDIO(ETH_MDIO),
        .ETH_RESET_n(MWMdioBasic_0_ETH_RESET_n),
        .RESET_IN(xlconstant_0_dout));
		
  ethernet_mac_hub_gmii #(
.MACADDR           (MACADDR           ),
.IPADDR1           (IPADDR1           ),
.IPADDR2           (IPADDR2           ), 
.IPADDR3           (IPADDR3           ), 
.IPADDR4           (IPADDR4           ), 
.NUM_AXIS_CHANNELS (NUM_AXIS_CHANNELS ), 
.UDP_DSTPORT_FORCH1(UDP_DSTPORT_FORCH1), 
.UDP_DSTPORT_FORCH2(UDP_DSTPORT_FORCH2), 
.UDP_DSTPORT_FORCH3(UDP_DSTPORT_FORCH3), 
.UDP_DSTPORT_FORCH4(UDP_DSTPORT_FORCH4), 
.UDP_DSTPORT_FORCH5(UDP_DSTPORT_FORCH5), 
.UDP_DSTPORT_FORCH6(UDP_DSTPORT_FORCH6), 
.UDP_DSTPORT_FORCH7(UDP_DSTPORT_FORCH7), 
.UDP_DSTPORT_FORCH8(UDP_DSTPORT_FORCH8) )
  ethernet_mac_hub_gmii_0
       (.axis_aclk(axis_aclk_0_1),
        .m0_axis_tdata(m0_axis_TDATA),
        .m0_axis_tlast(m0_axis_TLAST),
        .m0_axis_tready(m0_axis_TREADY),
        .m0_axis_tvalid(m0_axis_TVALID),
        .m1_axis_tdata(m1_axis_TDATA),
        .m1_axis_tlast(m1_axis_TLAST),
        .m1_axis_tready(m1_axis_TREADY),
        .m1_axis_tvalid(m1_axis_TVALID),
        .m2_axis_tdata(m2_axis_TDATA),
        .m2_axis_tlast(m2_axis_TLAST),
        .m2_axis_tready(m2_axis_TREADY),
        .m2_axis_tvalid(m2_axis_TVALID),
        .m3_axis_tdata(m3_axis_TDATA),
        .m3_axis_tlast(m3_axis_TLAST),
        .m3_axis_tready(m3_axis_TREADY),
        .m3_axis_tvalid(m3_axis_TVALID),
        .m4_axis_tdata(m4_axis_TDATA),
        .m4_axis_tlast(m4_axis_TLAST),
        .m4_axis_tready(m4_axis_TREADY),
        .m4_axis_tvalid(m4_axis_TVALID),
        .m5_axis_tdata(m5_axis_TDATA),
        .m5_axis_tlast(m5_axis_TLAST),
        .m5_axis_tready(m5_axis_TREADY),
        .m5_axis_tvalid(m5_axis_TVALID),
        .m6_axis_tdata(m6_axis_TDATA),
        .m6_axis_tlast(m6_axis_TLAST),
        .m6_axis_tready(m6_axis_TREADY),
        .m6_axis_tvalid(m6_axis_TVALID),
        .m7_axis_tdata(m7_axis_TDATA),
        .m7_axis_tlast(m7_axis_TLAST),
        .m7_axis_tready(m7_axis_TREADY),
        .m7_axis_tvalid(m7_axis_TVALID),
        .phy_col(1'b0),
        .phy_crs(1'b0),
        .phy_rxclk(gig_ethernet_pcs_pma_0_userclk2_out),
        .phy_rxd(gig_ethernet_pcs_pma_0_gmii_rxd),
        .phy_rxdv(gig_ethernet_pcs_pma_0_gmii_rx_dv),
        .phy_rxer(gig_ethernet_pcs_pma_0_gmii_rx_er),
        .phy_txd(ethernet_mac_hub_1_phy_txd),
        .phy_txen(ethernet_mac_hub_1_phy_txen),
        .phy_txer(ethernet_mac_hub_1_phy_txer),
        .ref_clk(gig_ethernet_pcs_pma_0_userclk2_out),
        .ref_reset(xlconstant_0_dout),
        .rxclk_en(MWMdioBasic_0_ETH_MDC),
        .s0_axis_tdata(s0_axis_1_TDATA),
        .s0_axis_tlast(s0_axis_1_TLAST),
        .s0_axis_tready(s0_axis_1_TREADY),
        .s0_axis_tvalid(s0_axis_1_TVALID),
        .s1_axis_tdata(s1_axis_1_TDATA),
        .s1_axis_tlast(s1_axis_1_TLAST),
        .s1_axis_tready(s1_axis_1_TREADY),
        .s1_axis_tvalid(s1_axis_1_TVALID),
        .s2_axis_tdata(s2_axis_1_TDATA),
        .s2_axis_tlast(s2_axis_1_TLAST),
        .s2_axis_tready(s2_axis_1_TREADY),
        .s2_axis_tvalid(s2_axis_1_TVALID),
        .s3_axis_tdata(s3_axis_1_TDATA),
        .s3_axis_tlast(s3_axis_1_TLAST),
        .s3_axis_tready(s3_axis_1_TREADY),
        .s3_axis_tvalid(s3_axis_1_TVALID),
        .s4_axis_tdata(s4_axis_1_TDATA),
        .s4_axis_tlast(s4_axis_1_TLAST),
        .s4_axis_tready(s4_axis_1_TREADY),
        .s4_axis_tvalid(s4_axis_1_TVALID),
        .s5_axis_tdata(s5_axis_1_TDATA),
        .s5_axis_tlast(s5_axis_1_TLAST),
        .s5_axis_tready(s5_axis_1_TREADY),
        .s5_axis_tvalid(s5_axis_1_TVALID),
        .s6_axis_tdata(s6_axis_1_TDATA),
        .s6_axis_tlast(s6_axis_1_TLAST),
        .s6_axis_tready(s6_axis_1_TREADY),
        .s6_axis_tvalid(s6_axis_1_TVALID),
        .s7_axis_tdata(s7_axis_1_TDATA),
        .s7_axis_tlast(s7_axis_1_TLAST),
        .s7_axis_tready(s7_axis_1_TREADY),
        .s7_axis_tvalid(s7_axis_1_TVALID),
        .txclk_en(MWMdioBasic_0_ETH_MDC));
		
  gig_ethernet_pcs_pma_0 gig_ethernet_pcs_pma_i
       (.an_adv_config_vector(16'd33),
        .an_restart_config(xlconstant_0_dout),
        .configuration_vector(5'd16),
        .gmii_rx_dv(gig_ethernet_pcs_pma_0_gmii_rx_dv),
        .gmii_rx_er(gig_ethernet_pcs_pma_0_gmii_rx_er),
        .gmii_rxd(gig_ethernet_pcs_pma_0_gmii_rxd),
        .gmii_tx_en(ethernet_mac_hub_1_phy_txen),
        .gmii_tx_er(ethernet_mac_hub_1_phy_txer),
        .gmii_txd(ethernet_mac_hub_1_phy_txd),
        .gtrefclk_n(ETH_GTREFCLK_N_1),
        .gtrefclk_p(ETH_GTREFCLK_P_1),
        .independent_clock_bufg(independent_clock_bufg_0_1),
        .reset(xlconstant_0_dout),
        .rxn(ETH_RXN_1),
        .rxp(ETH_RXP_1),
        .signal_detect(1'b1),
        .speed_is_100(xlconstant_0_dout),
        .speed_is_10_100(xlconstant_0_dout),
        .txn(gig_ethernet_pcs_pma_0_txn),
        .txp(gig_ethernet_pcs_pma_0_txp),
        .userclk2_out(gig_ethernet_pcs_pma_0_userclk2_out));
       
endmodule
