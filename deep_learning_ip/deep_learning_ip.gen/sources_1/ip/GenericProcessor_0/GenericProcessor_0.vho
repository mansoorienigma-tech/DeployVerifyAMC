-- (c) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- (c) Copyright 2022-2026 Advanced Micro Devices, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of AMD and is protected under U.S. and international copyright
-- and other intellectual property laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- AMD, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) AMD shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or AMD had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- AMD products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of AMD products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.
-- IP VLNV: xilinx.com:ip:GenericProcessor:1.0
-- IP Revision: 2114846577

-- The following code must appear in the VHDL architecture header.

------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
COMPONENT GenericProcessor_0
  PORT (
    IPCORE_CLK : IN STD_LOGIC;
    IPCORE_RESETN : IN STD_LOGIC;
    AXI4_Master_Activation_Data_Rd_RDATA : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
    AXI4_Master_Activation_Data_Rd_RLAST : IN STD_LOGIC;
    AXI4_Master_Activation_Data_Rd_RVALID : IN STD_LOGIC;
    AXI4_Master_Activation_Data_Rd_RID : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    AXI4_Master_Activation_Data_Rd_RRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    AXI4_Master_Activation_Data_Rd_ARREADY : IN STD_LOGIC;
    AXI4_Master_Activation_Data_Wr_AWREADY : IN STD_LOGIC;
    AXI4_Master_Activation_Data_Wr_WREADY : IN STD_LOGIC;
    AXI4_Master_Activation_Data_Wr_BID : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    AXI4_Master_Activation_Data_Wr_BRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    AXI4_Master_Activation_Data_Wr_BVALID : IN STD_LOGIC;
    AXI4_Master_Weight_Data_Rd_RDATA : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
    AXI4_Master_Weight_Data_Rd_RLAST : IN STD_LOGIC;
    AXI4_Master_Weight_Data_Rd_RVALID : IN STD_LOGIC;
    AXI4_Master_Weight_Data_Rd_RID : IN STD_LOGIC;
    AXI4_Master_Weight_Data_Rd_RRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    AXI4_Master_Weight_Data_Rd_ARREADY : IN STD_LOGIC;
    AXI4_Master_Weight_Data_Wr_AWREADY : IN STD_LOGIC;
    AXI4_Master_Weight_Data_Wr_WREADY : IN STD_LOGIC;
    AXI4_Master_Weight_Data_Wr_BID : IN STD_LOGIC;
    AXI4_Master_Weight_Data_Wr_BRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    AXI4_Master_Weight_Data_Wr_BVALID : IN STD_LOGIC;
    AXI4_Master_Debug_Rd_RDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    AXI4_Master_Debug_Rd_RLAST : IN STD_LOGIC;
    AXI4_Master_Debug_Rd_RVALID : IN STD_LOGIC;
    AXI4_Master_Debug_Rd_RID : IN STD_LOGIC;
    AXI4_Master_Debug_Rd_RRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    AXI4_Master_Debug_Rd_ARREADY : IN STD_LOGIC;
    AXI4_Master_Debug_Wr_AWREADY : IN STD_LOGIC;
    AXI4_Master_Debug_Wr_WREADY : IN STD_LOGIC;
    AXI4_Master_Debug_Wr_BID : IN STD_LOGIC;
    AXI4_Master_Debug_Wr_BRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    AXI4_Master_Debug_Wr_BVALID : IN STD_LOGIC;
    AXI4_ACLK : IN STD_LOGIC;
    AXI4_ARESETN : IN STD_LOGIC;
    AXI4_AWID : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    AXI4_AWADDR : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    AXI4_AWLEN : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    AXI4_AWSIZE : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    AXI4_AWBURST : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    AXI4_AWLOCK : IN STD_LOGIC;
    AXI4_AWCACHE : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    AXI4_AWPROT : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    AXI4_AWVALID : IN STD_LOGIC;
    AXI4_WDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    AXI4_WSTRB : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    AXI4_WLAST : IN STD_LOGIC;
    AXI4_WVALID : IN STD_LOGIC;
    AXI4_BREADY : IN STD_LOGIC;
    AXI4_ARID : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    AXI4_ARADDR : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    AXI4_ARLEN : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    AXI4_ARSIZE : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    AXI4_ARBURST : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    AXI4_ARLOCK : IN STD_LOGIC;
    AXI4_ARCACHE : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    AXI4_ARPROT : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    AXI4_ARVALID : IN STD_LOGIC;
    AXI4_RREADY : IN STD_LOGIC;
    AXI4_Master_Activation_Data_Rd_ARID : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    AXI4_Master_Activation_Data_Rd_ARADDR : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    AXI4_Master_Activation_Data_Rd_ARLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    AXI4_Master_Activation_Data_Rd_ARSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    AXI4_Master_Activation_Data_Rd_ARBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    AXI4_Master_Activation_Data_Rd_ARLOCK : OUT STD_LOGIC;
    AXI4_Master_Activation_Data_Rd_ARCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    AXI4_Master_Activation_Data_Rd_ARPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    AXI4_Master_Activation_Data_Rd_ARVALID : OUT STD_LOGIC;
    AXI4_Master_Activation_Data_Rd_RREADY : OUT STD_LOGIC;
    AXI4_Master_Activation_Data_Wr_AWID : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    AXI4_Master_Activation_Data_Wr_AWADDR : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    AXI4_Master_Activation_Data_Wr_AWLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    AXI4_Master_Activation_Data_Wr_AWSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    AXI4_Master_Activation_Data_Wr_AWBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    AXI4_Master_Activation_Data_Wr_AWLOCK : OUT STD_LOGIC;
    AXI4_Master_Activation_Data_Wr_AWCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    AXI4_Master_Activation_Data_Wr_AWPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    AXI4_Master_Activation_Data_Wr_AWVALID : OUT STD_LOGIC;
    AXI4_Master_Activation_Data_Wr_WDATA : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
    AXI4_Master_Activation_Data_Wr_WSTRB : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    AXI4_Master_Activation_Data_Wr_WLAST : OUT STD_LOGIC;
    AXI4_Master_Activation_Data_Wr_WVALID : OUT STD_LOGIC;
    AXI4_Master_Activation_Data_Wr_BREADY : OUT STD_LOGIC;
    AXI4_Master_Weight_Data_Rd_ARID : OUT STD_LOGIC;
    AXI4_Master_Weight_Data_Rd_ARADDR : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    AXI4_Master_Weight_Data_Rd_ARLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    AXI4_Master_Weight_Data_Rd_ARSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    AXI4_Master_Weight_Data_Rd_ARBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    AXI4_Master_Weight_Data_Rd_ARLOCK : OUT STD_LOGIC;
    AXI4_Master_Weight_Data_Rd_ARCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    AXI4_Master_Weight_Data_Rd_ARPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    AXI4_Master_Weight_Data_Rd_ARVALID : OUT STD_LOGIC;
    AXI4_Master_Weight_Data_Rd_RREADY : OUT STD_LOGIC;
    AXI4_Master_Weight_Data_Wr_AWID : OUT STD_LOGIC;
    AXI4_Master_Weight_Data_Wr_AWADDR : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    AXI4_Master_Weight_Data_Wr_AWLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    AXI4_Master_Weight_Data_Wr_AWSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    AXI4_Master_Weight_Data_Wr_AWBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    AXI4_Master_Weight_Data_Wr_AWLOCK : OUT STD_LOGIC;
    AXI4_Master_Weight_Data_Wr_AWCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    AXI4_Master_Weight_Data_Wr_AWPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    AXI4_Master_Weight_Data_Wr_AWVALID : OUT STD_LOGIC;
    AXI4_Master_Weight_Data_Wr_WDATA : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
    AXI4_Master_Weight_Data_Wr_WSTRB : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    AXI4_Master_Weight_Data_Wr_WLAST : OUT STD_LOGIC;
    AXI4_Master_Weight_Data_Wr_WVALID : OUT STD_LOGIC;
    AXI4_Master_Weight_Data_Wr_BREADY : OUT STD_LOGIC;
    AXI4_Master_Debug_Rd_ARID : OUT STD_LOGIC;
    AXI4_Master_Debug_Rd_ARADDR : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    AXI4_Master_Debug_Rd_ARLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    AXI4_Master_Debug_Rd_ARSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    AXI4_Master_Debug_Rd_ARBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    AXI4_Master_Debug_Rd_ARLOCK : OUT STD_LOGIC;
    AXI4_Master_Debug_Rd_ARCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    AXI4_Master_Debug_Rd_ARPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    AXI4_Master_Debug_Rd_ARVALID : OUT STD_LOGIC;
    AXI4_Master_Debug_Rd_RREADY : OUT STD_LOGIC;
    AXI4_Master_Debug_Wr_AWID : OUT STD_LOGIC;
    AXI4_Master_Debug_Wr_AWADDR : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    AXI4_Master_Debug_Wr_AWLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    AXI4_Master_Debug_Wr_AWSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    AXI4_Master_Debug_Wr_AWBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    AXI4_Master_Debug_Wr_AWLOCK : OUT STD_LOGIC;
    AXI4_Master_Debug_Wr_AWCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    AXI4_Master_Debug_Wr_AWPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    AXI4_Master_Debug_Wr_AWVALID : OUT STD_LOGIC;
    AXI4_Master_Debug_Wr_WDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    AXI4_Master_Debug_Wr_WSTRB : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    AXI4_Master_Debug_Wr_WLAST : OUT STD_LOGIC;
    AXI4_Master_Debug_Wr_WVALID : OUT STD_LOGIC;
    AXI4_Master_Debug_Wr_BREADY : OUT STD_LOGIC;
    AXI4_AWREADY : OUT STD_LOGIC;
    AXI4_WREADY : OUT STD_LOGIC;
    AXI4_BID : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
    AXI4_BRESP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    AXI4_BVALID : OUT STD_LOGIC;
    AXI4_ARREADY : OUT STD_LOGIC;
    AXI4_RID : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
    AXI4_RDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    AXI4_RRESP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    AXI4_RLAST : OUT STD_LOGIC;
    AXI4_RVALID : OUT STD_LOGIC 
  );
END COMPONENT;
-- COMP_TAG_END ------ End COMPONENT Declaration ------------

-- The following code must appear in the VHDL architecture
-- body. Substitute your own instance name and net names.

------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
your_instance_name : GenericProcessor_0
  PORT MAP (
    IPCORE_CLK => IPCORE_CLK,
    IPCORE_RESETN => IPCORE_RESETN,
    AXI4_Master_Activation_Data_Rd_RDATA => AXI4_Master_Activation_Data_Rd_RDATA,
    AXI4_Master_Activation_Data_Rd_RLAST => AXI4_Master_Activation_Data_Rd_RLAST,
    AXI4_Master_Activation_Data_Rd_RVALID => AXI4_Master_Activation_Data_Rd_RVALID,
    AXI4_Master_Activation_Data_Rd_RID => AXI4_Master_Activation_Data_Rd_RID,
    AXI4_Master_Activation_Data_Rd_RRESP => AXI4_Master_Activation_Data_Rd_RRESP,
    AXI4_Master_Activation_Data_Rd_ARREADY => AXI4_Master_Activation_Data_Rd_ARREADY,
    AXI4_Master_Activation_Data_Wr_AWREADY => AXI4_Master_Activation_Data_Wr_AWREADY,
    AXI4_Master_Activation_Data_Wr_WREADY => AXI4_Master_Activation_Data_Wr_WREADY,
    AXI4_Master_Activation_Data_Wr_BID => AXI4_Master_Activation_Data_Wr_BID,
    AXI4_Master_Activation_Data_Wr_BRESP => AXI4_Master_Activation_Data_Wr_BRESP,
    AXI4_Master_Activation_Data_Wr_BVALID => AXI4_Master_Activation_Data_Wr_BVALID,
    AXI4_Master_Weight_Data_Rd_RDATA => AXI4_Master_Weight_Data_Rd_RDATA,
    AXI4_Master_Weight_Data_Rd_RLAST => AXI4_Master_Weight_Data_Rd_RLAST,
    AXI4_Master_Weight_Data_Rd_RVALID => AXI4_Master_Weight_Data_Rd_RVALID,
    AXI4_Master_Weight_Data_Rd_RID => AXI4_Master_Weight_Data_Rd_RID,
    AXI4_Master_Weight_Data_Rd_RRESP => AXI4_Master_Weight_Data_Rd_RRESP,
    AXI4_Master_Weight_Data_Rd_ARREADY => AXI4_Master_Weight_Data_Rd_ARREADY,
    AXI4_Master_Weight_Data_Wr_AWREADY => AXI4_Master_Weight_Data_Wr_AWREADY,
    AXI4_Master_Weight_Data_Wr_WREADY => AXI4_Master_Weight_Data_Wr_WREADY,
    AXI4_Master_Weight_Data_Wr_BID => AXI4_Master_Weight_Data_Wr_BID,
    AXI4_Master_Weight_Data_Wr_BRESP => AXI4_Master_Weight_Data_Wr_BRESP,
    AXI4_Master_Weight_Data_Wr_BVALID => AXI4_Master_Weight_Data_Wr_BVALID,
    AXI4_Master_Debug_Rd_RDATA => AXI4_Master_Debug_Rd_RDATA,
    AXI4_Master_Debug_Rd_RLAST => AXI4_Master_Debug_Rd_RLAST,
    AXI4_Master_Debug_Rd_RVALID => AXI4_Master_Debug_Rd_RVALID,
    AXI4_Master_Debug_Rd_RID => AXI4_Master_Debug_Rd_RID,
    AXI4_Master_Debug_Rd_RRESP => AXI4_Master_Debug_Rd_RRESP,
    AXI4_Master_Debug_Rd_ARREADY => AXI4_Master_Debug_Rd_ARREADY,
    AXI4_Master_Debug_Wr_AWREADY => AXI4_Master_Debug_Wr_AWREADY,
    AXI4_Master_Debug_Wr_WREADY => AXI4_Master_Debug_Wr_WREADY,
    AXI4_Master_Debug_Wr_BID => AXI4_Master_Debug_Wr_BID,
    AXI4_Master_Debug_Wr_BRESP => AXI4_Master_Debug_Wr_BRESP,
    AXI4_Master_Debug_Wr_BVALID => AXI4_Master_Debug_Wr_BVALID,
    AXI4_ACLK => AXI4_ACLK,
    AXI4_ARESETN => AXI4_ARESETN,
    AXI4_AWID => AXI4_AWID,
    AXI4_AWADDR => AXI4_AWADDR,
    AXI4_AWLEN => AXI4_AWLEN,
    AXI4_AWSIZE => AXI4_AWSIZE,
    AXI4_AWBURST => AXI4_AWBURST,
    AXI4_AWLOCK => AXI4_AWLOCK,
    AXI4_AWCACHE => AXI4_AWCACHE,
    AXI4_AWPROT => AXI4_AWPROT,
    AXI4_AWVALID => AXI4_AWVALID,
    AXI4_WDATA => AXI4_WDATA,
    AXI4_WSTRB => AXI4_WSTRB,
    AXI4_WLAST => AXI4_WLAST,
    AXI4_WVALID => AXI4_WVALID,
    AXI4_BREADY => AXI4_BREADY,
    AXI4_ARID => AXI4_ARID,
    AXI4_ARADDR => AXI4_ARADDR,
    AXI4_ARLEN => AXI4_ARLEN,
    AXI4_ARSIZE => AXI4_ARSIZE,
    AXI4_ARBURST => AXI4_ARBURST,
    AXI4_ARLOCK => AXI4_ARLOCK,
    AXI4_ARCACHE => AXI4_ARCACHE,
    AXI4_ARPROT => AXI4_ARPROT,
    AXI4_ARVALID => AXI4_ARVALID,
    AXI4_RREADY => AXI4_RREADY,
    AXI4_Master_Activation_Data_Rd_ARID => AXI4_Master_Activation_Data_Rd_ARID,
    AXI4_Master_Activation_Data_Rd_ARADDR => AXI4_Master_Activation_Data_Rd_ARADDR,
    AXI4_Master_Activation_Data_Rd_ARLEN => AXI4_Master_Activation_Data_Rd_ARLEN,
    AXI4_Master_Activation_Data_Rd_ARSIZE => AXI4_Master_Activation_Data_Rd_ARSIZE,
    AXI4_Master_Activation_Data_Rd_ARBURST => AXI4_Master_Activation_Data_Rd_ARBURST,
    AXI4_Master_Activation_Data_Rd_ARLOCK => AXI4_Master_Activation_Data_Rd_ARLOCK,
    AXI4_Master_Activation_Data_Rd_ARCACHE => AXI4_Master_Activation_Data_Rd_ARCACHE,
    AXI4_Master_Activation_Data_Rd_ARPROT => AXI4_Master_Activation_Data_Rd_ARPROT,
    AXI4_Master_Activation_Data_Rd_ARVALID => AXI4_Master_Activation_Data_Rd_ARVALID,
    AXI4_Master_Activation_Data_Rd_RREADY => AXI4_Master_Activation_Data_Rd_RREADY,
    AXI4_Master_Activation_Data_Wr_AWID => AXI4_Master_Activation_Data_Wr_AWID,
    AXI4_Master_Activation_Data_Wr_AWADDR => AXI4_Master_Activation_Data_Wr_AWADDR,
    AXI4_Master_Activation_Data_Wr_AWLEN => AXI4_Master_Activation_Data_Wr_AWLEN,
    AXI4_Master_Activation_Data_Wr_AWSIZE => AXI4_Master_Activation_Data_Wr_AWSIZE,
    AXI4_Master_Activation_Data_Wr_AWBURST => AXI4_Master_Activation_Data_Wr_AWBURST,
    AXI4_Master_Activation_Data_Wr_AWLOCK => AXI4_Master_Activation_Data_Wr_AWLOCK,
    AXI4_Master_Activation_Data_Wr_AWCACHE => AXI4_Master_Activation_Data_Wr_AWCACHE,
    AXI4_Master_Activation_Data_Wr_AWPROT => AXI4_Master_Activation_Data_Wr_AWPROT,
    AXI4_Master_Activation_Data_Wr_AWVALID => AXI4_Master_Activation_Data_Wr_AWVALID,
    AXI4_Master_Activation_Data_Wr_WDATA => AXI4_Master_Activation_Data_Wr_WDATA,
    AXI4_Master_Activation_Data_Wr_WSTRB => AXI4_Master_Activation_Data_Wr_WSTRB,
    AXI4_Master_Activation_Data_Wr_WLAST => AXI4_Master_Activation_Data_Wr_WLAST,
    AXI4_Master_Activation_Data_Wr_WVALID => AXI4_Master_Activation_Data_Wr_WVALID,
    AXI4_Master_Activation_Data_Wr_BREADY => AXI4_Master_Activation_Data_Wr_BREADY,
    AXI4_Master_Weight_Data_Rd_ARID => AXI4_Master_Weight_Data_Rd_ARID,
    AXI4_Master_Weight_Data_Rd_ARADDR => AXI4_Master_Weight_Data_Rd_ARADDR,
    AXI4_Master_Weight_Data_Rd_ARLEN => AXI4_Master_Weight_Data_Rd_ARLEN,
    AXI4_Master_Weight_Data_Rd_ARSIZE => AXI4_Master_Weight_Data_Rd_ARSIZE,
    AXI4_Master_Weight_Data_Rd_ARBURST => AXI4_Master_Weight_Data_Rd_ARBURST,
    AXI4_Master_Weight_Data_Rd_ARLOCK => AXI4_Master_Weight_Data_Rd_ARLOCK,
    AXI4_Master_Weight_Data_Rd_ARCACHE => AXI4_Master_Weight_Data_Rd_ARCACHE,
    AXI4_Master_Weight_Data_Rd_ARPROT => AXI4_Master_Weight_Data_Rd_ARPROT,
    AXI4_Master_Weight_Data_Rd_ARVALID => AXI4_Master_Weight_Data_Rd_ARVALID,
    AXI4_Master_Weight_Data_Rd_RREADY => AXI4_Master_Weight_Data_Rd_RREADY,
    AXI4_Master_Weight_Data_Wr_AWID => AXI4_Master_Weight_Data_Wr_AWID,
    AXI4_Master_Weight_Data_Wr_AWADDR => AXI4_Master_Weight_Data_Wr_AWADDR,
    AXI4_Master_Weight_Data_Wr_AWLEN => AXI4_Master_Weight_Data_Wr_AWLEN,
    AXI4_Master_Weight_Data_Wr_AWSIZE => AXI4_Master_Weight_Data_Wr_AWSIZE,
    AXI4_Master_Weight_Data_Wr_AWBURST => AXI4_Master_Weight_Data_Wr_AWBURST,
    AXI4_Master_Weight_Data_Wr_AWLOCK => AXI4_Master_Weight_Data_Wr_AWLOCK,
    AXI4_Master_Weight_Data_Wr_AWCACHE => AXI4_Master_Weight_Data_Wr_AWCACHE,
    AXI4_Master_Weight_Data_Wr_AWPROT => AXI4_Master_Weight_Data_Wr_AWPROT,
    AXI4_Master_Weight_Data_Wr_AWVALID => AXI4_Master_Weight_Data_Wr_AWVALID,
    AXI4_Master_Weight_Data_Wr_WDATA => AXI4_Master_Weight_Data_Wr_WDATA,
    AXI4_Master_Weight_Data_Wr_WSTRB => AXI4_Master_Weight_Data_Wr_WSTRB,
    AXI4_Master_Weight_Data_Wr_WLAST => AXI4_Master_Weight_Data_Wr_WLAST,
    AXI4_Master_Weight_Data_Wr_WVALID => AXI4_Master_Weight_Data_Wr_WVALID,
    AXI4_Master_Weight_Data_Wr_BREADY => AXI4_Master_Weight_Data_Wr_BREADY,
    AXI4_Master_Debug_Rd_ARID => AXI4_Master_Debug_Rd_ARID,
    AXI4_Master_Debug_Rd_ARADDR => AXI4_Master_Debug_Rd_ARADDR,
    AXI4_Master_Debug_Rd_ARLEN => AXI4_Master_Debug_Rd_ARLEN,
    AXI4_Master_Debug_Rd_ARSIZE => AXI4_Master_Debug_Rd_ARSIZE,
    AXI4_Master_Debug_Rd_ARBURST => AXI4_Master_Debug_Rd_ARBURST,
    AXI4_Master_Debug_Rd_ARLOCK => AXI4_Master_Debug_Rd_ARLOCK,
    AXI4_Master_Debug_Rd_ARCACHE => AXI4_Master_Debug_Rd_ARCACHE,
    AXI4_Master_Debug_Rd_ARPROT => AXI4_Master_Debug_Rd_ARPROT,
    AXI4_Master_Debug_Rd_ARVALID => AXI4_Master_Debug_Rd_ARVALID,
    AXI4_Master_Debug_Rd_RREADY => AXI4_Master_Debug_Rd_RREADY,
    AXI4_Master_Debug_Wr_AWID => AXI4_Master_Debug_Wr_AWID,
    AXI4_Master_Debug_Wr_AWADDR => AXI4_Master_Debug_Wr_AWADDR,
    AXI4_Master_Debug_Wr_AWLEN => AXI4_Master_Debug_Wr_AWLEN,
    AXI4_Master_Debug_Wr_AWSIZE => AXI4_Master_Debug_Wr_AWSIZE,
    AXI4_Master_Debug_Wr_AWBURST => AXI4_Master_Debug_Wr_AWBURST,
    AXI4_Master_Debug_Wr_AWLOCK => AXI4_Master_Debug_Wr_AWLOCK,
    AXI4_Master_Debug_Wr_AWCACHE => AXI4_Master_Debug_Wr_AWCACHE,
    AXI4_Master_Debug_Wr_AWPROT => AXI4_Master_Debug_Wr_AWPROT,
    AXI4_Master_Debug_Wr_AWVALID => AXI4_Master_Debug_Wr_AWVALID,
    AXI4_Master_Debug_Wr_WDATA => AXI4_Master_Debug_Wr_WDATA,
    AXI4_Master_Debug_Wr_WSTRB => AXI4_Master_Debug_Wr_WSTRB,
    AXI4_Master_Debug_Wr_WLAST => AXI4_Master_Debug_Wr_WLAST,
    AXI4_Master_Debug_Wr_WVALID => AXI4_Master_Debug_Wr_WVALID,
    AXI4_Master_Debug_Wr_BREADY => AXI4_Master_Debug_Wr_BREADY,
    AXI4_AWREADY => AXI4_AWREADY,
    AXI4_WREADY => AXI4_WREADY,
    AXI4_BID => AXI4_BID,
    AXI4_BRESP => AXI4_BRESP,
    AXI4_BVALID => AXI4_BVALID,
    AXI4_ARREADY => AXI4_ARREADY,
    AXI4_RID => AXI4_RID,
    AXI4_RDATA => AXI4_RDATA,
    AXI4_RRESP => AXI4_RRESP,
    AXI4_RLAST => AXI4_RLAST,
    AXI4_RVALID => AXI4_RVALID
  );
-- INST_TAG_END ------ End INSTANTIATION Template ---------

-- You must compile the wrapper file GenericProcessor_0.vhd when simulating
-- the core, GenericProcessor_0. When compiling the wrapper file, be sure to
-- reference the VHDL simulation library.



