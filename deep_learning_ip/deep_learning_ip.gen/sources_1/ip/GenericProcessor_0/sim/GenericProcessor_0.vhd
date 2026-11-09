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

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY GenericProcessor_0 IS
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
END GenericProcessor_0;

ARCHITECTURE GenericProcessor_0_arch OF GenericProcessor_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF GenericProcessor_0_arch: ARCHITECTURE IS "yes";
  COMPONENT GenericProcessor IS
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
  END COMPONENT GenericProcessor;
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER OF AXI4_ACLK: SIGNAL IS "XIL_INTERFACENAME AXI4_signal_clock, ASSOCIATED_BUSIF AXI4, ASSOCIATED_RESET AXI4_ARESETN, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_ACLK: SIGNAL IS "xilinx.com:signal:clock:1.0 AXI4_signal_clock CLK";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_ARADDR: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4 ARADDR";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_ARBURST: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4 ARBURST";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_ARCACHE: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4 ARCACHE";
  ATTRIBUTE X_INTERFACE_PARAMETER OF AXI4_ARESETN: SIGNAL IS "XIL_INTERFACENAME AXI4_signal_reset, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_ARESETN: SIGNAL IS "xilinx.com:signal:reset:1.0 AXI4_signal_reset RST";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_ARID: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4 ARID";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_ARLEN: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4 ARLEN";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_ARLOCK: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4 ARLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_ARPROT: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4 ARPROT";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_ARREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4 ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_ARSIZE: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4 ARSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_ARVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4 ARVALID";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_AWADDR: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4 AWADDR";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_AWBURST: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4 AWBURST";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_AWCACHE: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4 AWCACHE";
  ATTRIBUTE X_INTERFACE_PARAMETER OF AXI4_AWID: SIGNAL IS "XIL_INTERFACENAME AXI4, DATA_WIDTH 32, PROTOCOL AXI4, FREQ_HZ 100000000, ID_WIDTH 12, ADDR_WIDTH 16, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 256, PHASE 0.0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BIT" & 
"S_PER_BYTE 0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_AWID: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4 AWID";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_AWLEN: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4 AWLEN";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_AWLOCK: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4 AWLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_AWPROT: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4 AWPROT";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_AWREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4 AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_AWSIZE: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4 AWSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_AWVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4 AWVALID";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_BID: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4 BID";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_BREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4 BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_BRESP: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4 BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_BVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4 BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Activation_Data_Rd_ARADDR: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Activation_Data ARADDR";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Activation_Data_Rd_ARBURST: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Activation_Data ARBURST";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Activation_Data_Rd_ARCACHE: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Activation_Data ARCACHE";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Activation_Data_Rd_ARID: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Activation_Data ARID";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Activation_Data_Rd_ARLEN: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Activation_Data ARLEN";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Activation_Data_Rd_ARLOCK: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Activation_Data ARLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Activation_Data_Rd_ARPROT: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Activation_Data ARPROT";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Activation_Data_Rd_ARREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Activation_Data ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Activation_Data_Rd_ARSIZE: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Activation_Data ARSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Activation_Data_Rd_ARVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Activation_Data ARVALID";
  ATTRIBUTE X_INTERFACE_PARAMETER OF AXI4_Master_Activation_Data_Rd_RDATA: SIGNAL IS "XIL_INTERFACENAME AXI4_Master_Activation_Data, DATA_WIDTH 128, PROTOCOL AXI4, FREQ_HZ 100000000, ID_WIDTH 8, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 256, PHASE 0.0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BIT" & 
"S_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Activation_Data_Rd_RDATA: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Activation_Data RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Activation_Data_Rd_RID: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Activation_Data RID";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Activation_Data_Rd_RLAST: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Activation_Data RLAST";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Activation_Data_Rd_RREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Activation_Data RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Activation_Data_Rd_RRESP: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Activation_Data RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Activation_Data_Rd_RVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Activation_Data RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Activation_Data_Wr_AWADDR: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Activation_Data AWADDR";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Activation_Data_Wr_AWBURST: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Activation_Data AWBURST";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Activation_Data_Wr_AWCACHE: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Activation_Data AWCACHE";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Activation_Data_Wr_AWID: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Activation_Data AWID";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Activation_Data_Wr_AWLEN: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Activation_Data AWLEN";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Activation_Data_Wr_AWLOCK: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Activation_Data AWLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Activation_Data_Wr_AWPROT: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Activation_Data AWPROT";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Activation_Data_Wr_AWREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Activation_Data AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Activation_Data_Wr_AWSIZE: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Activation_Data AWSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Activation_Data_Wr_AWVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Activation_Data AWVALID";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Activation_Data_Wr_BID: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Activation_Data BID";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Activation_Data_Wr_BREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Activation_Data BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Activation_Data_Wr_BRESP: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Activation_Data BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Activation_Data_Wr_BVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Activation_Data BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Activation_Data_Wr_WDATA: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Activation_Data WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Activation_Data_Wr_WLAST: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Activation_Data WLAST";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Activation_Data_Wr_WREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Activation_Data WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Activation_Data_Wr_WSTRB: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Activation_Data WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Activation_Data_Wr_WVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Activation_Data WVALID";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Debug_Rd_ARADDR: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Debug ARADDR";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Debug_Rd_ARBURST: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Debug ARBURST";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Debug_Rd_ARCACHE: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Debug ARCACHE";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Debug_Rd_ARID: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Debug ARID";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Debug_Rd_ARLEN: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Debug ARLEN";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Debug_Rd_ARLOCK: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Debug ARLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Debug_Rd_ARPROT: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Debug ARPROT";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Debug_Rd_ARREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Debug ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Debug_Rd_ARSIZE: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Debug ARSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Debug_Rd_ARVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Debug ARVALID";
  ATTRIBUTE X_INTERFACE_PARAMETER OF AXI4_Master_Debug_Rd_RDATA: SIGNAL IS "XIL_INTERFACENAME AXI4_Master_Debug, DATA_WIDTH 32, PROTOCOL AXI4, FREQ_HZ 100000000, ID_WIDTH 1, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 256, PHASE 0.0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE " & 
"0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Debug_Rd_RDATA: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Debug RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Debug_Rd_RID: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Debug RID";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Debug_Rd_RLAST: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Debug RLAST";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Debug_Rd_RREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Debug RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Debug_Rd_RRESP: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Debug RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Debug_Rd_RVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Debug RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Debug_Wr_AWADDR: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Debug AWADDR";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Debug_Wr_AWBURST: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Debug AWBURST";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Debug_Wr_AWCACHE: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Debug AWCACHE";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Debug_Wr_AWID: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Debug AWID";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Debug_Wr_AWLEN: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Debug AWLEN";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Debug_Wr_AWLOCK: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Debug AWLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Debug_Wr_AWPROT: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Debug AWPROT";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Debug_Wr_AWREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Debug AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Debug_Wr_AWSIZE: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Debug AWSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Debug_Wr_AWVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Debug AWVALID";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Debug_Wr_BID: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Debug BID";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Debug_Wr_BREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Debug BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Debug_Wr_BRESP: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Debug BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Debug_Wr_BVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Debug BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Debug_Wr_WDATA: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Debug WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Debug_Wr_WLAST: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Debug WLAST";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Debug_Wr_WREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Debug WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Debug_Wr_WSTRB: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Debug WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Debug_Wr_WVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Debug WVALID";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Weight_Data_Rd_ARADDR: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Weight_Data ARADDR";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Weight_Data_Rd_ARBURST: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Weight_Data ARBURST";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Weight_Data_Rd_ARCACHE: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Weight_Data ARCACHE";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Weight_Data_Rd_ARID: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Weight_Data ARID";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Weight_Data_Rd_ARLEN: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Weight_Data ARLEN";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Weight_Data_Rd_ARLOCK: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Weight_Data ARLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Weight_Data_Rd_ARPROT: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Weight_Data ARPROT";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Weight_Data_Rd_ARREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Weight_Data ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Weight_Data_Rd_ARSIZE: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Weight_Data ARSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Weight_Data_Rd_ARVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Weight_Data ARVALID";
  ATTRIBUTE X_INTERFACE_PARAMETER OF AXI4_Master_Weight_Data_Rd_RDATA: SIGNAL IS "XIL_INTERFACENAME AXI4_Master_Weight_Data, DATA_WIDTH 128, PROTOCOL AXI4, FREQ_HZ 100000000, ID_WIDTH 1, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 256, PHASE 0.0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PE" & 
"R_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Weight_Data_Rd_RDATA: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Weight_Data RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Weight_Data_Rd_RID: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Weight_Data RID";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Weight_Data_Rd_RLAST: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Weight_Data RLAST";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Weight_Data_Rd_RREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Weight_Data RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Weight_Data_Rd_RRESP: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Weight_Data RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Weight_Data_Rd_RVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Weight_Data RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Weight_Data_Wr_AWADDR: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Weight_Data AWADDR";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Weight_Data_Wr_AWBURST: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Weight_Data AWBURST";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Weight_Data_Wr_AWCACHE: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Weight_Data AWCACHE";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Weight_Data_Wr_AWID: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Weight_Data AWID";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Weight_Data_Wr_AWLEN: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Weight_Data AWLEN";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Weight_Data_Wr_AWLOCK: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Weight_Data AWLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Weight_Data_Wr_AWPROT: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Weight_Data AWPROT";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Weight_Data_Wr_AWREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Weight_Data AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Weight_Data_Wr_AWSIZE: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Weight_Data AWSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Weight_Data_Wr_AWVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Weight_Data AWVALID";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Weight_Data_Wr_BID: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Weight_Data BID";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Weight_Data_Wr_BREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Weight_Data BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Weight_Data_Wr_BRESP: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Weight_Data BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Weight_Data_Wr_BVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Weight_Data BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Weight_Data_Wr_WDATA: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Weight_Data WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Weight_Data_Wr_WLAST: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Weight_Data WLAST";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Weight_Data_Wr_WREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Weight_Data WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Weight_Data_Wr_WSTRB: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Weight_Data WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_Master_Weight_Data_Wr_WVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4_Master_Weight_Data WVALID";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_RDATA: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4 RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_RID: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4 RID";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_RLAST: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4 RLAST";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_RREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4 RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_RRESP: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4 RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_RVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4 RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_WDATA: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4 WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_WLAST: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4 WLAST";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_WREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4 WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_WSTRB: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4 WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF AXI4_WVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI4 WVALID";
  ATTRIBUTE X_INTERFACE_PARAMETER OF IPCORE_CLK: SIGNAL IS "XIL_INTERFACENAME IPCORE_CLK, ASSOCIATED_RESET IPCORE_RESETN, ASSOCIATED_BUSIF AXI4_Master_Activation_Data:AXI4_Master_Weight_Data:AXI4_Master_Debug, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF IPCORE_CLK: SIGNAL IS "xilinx.com:signal:clock:1.0 IPCORE_CLK CLK";
  ATTRIBUTE X_INTERFACE_PARAMETER OF IPCORE_RESETN: SIGNAL IS "XIL_INTERFACENAME IPCORE_RESETN, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF IPCORE_RESETN: SIGNAL IS "xilinx.com:signal:reset:1.0 IPCORE_RESETN RST";
BEGIN
  U0 : GenericProcessor
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
END GenericProcessor_0_arch;
