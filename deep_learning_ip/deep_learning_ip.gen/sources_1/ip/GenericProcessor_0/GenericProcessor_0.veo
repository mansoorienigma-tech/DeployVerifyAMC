// (c) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// (c) Copyright 2022-2026 Advanced Micro Devices, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of AMD and is protected under U.S. and international copyright
// and other intellectual property laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// AMD, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) AMD shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or AMD had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// AMD products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of AMD products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.

// IP VLNV: xilinx.com:ip:GenericProcessor:1.0
// IP Revision: 2114846577

// The following must be inserted into your Verilog file for this
// core to be instantiated. Change the instance name and port connections
// (in parentheses) to your own signal names.

//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
GenericProcessor_0 your_instance_name (
  .IPCORE_CLK(IPCORE_CLK),                                                          // input wire IPCORE_CLK
  .IPCORE_RESETN(IPCORE_RESETN),                                                    // input wire IPCORE_RESETN
  .AXI4_Master_Activation_Data_Rd_RDATA(AXI4_Master_Activation_Data_Rd_RDATA),      // input wire [127 : 0] AXI4_Master_Activation_Data_Rd_RDATA
  .AXI4_Master_Activation_Data_Rd_RLAST(AXI4_Master_Activation_Data_Rd_RLAST),      // input wire AXI4_Master_Activation_Data_Rd_RLAST
  .AXI4_Master_Activation_Data_Rd_RVALID(AXI4_Master_Activation_Data_Rd_RVALID),    // input wire AXI4_Master_Activation_Data_Rd_RVALID
  .AXI4_Master_Activation_Data_Rd_RID(AXI4_Master_Activation_Data_Rd_RID),          // input wire [7 : 0] AXI4_Master_Activation_Data_Rd_RID
  .AXI4_Master_Activation_Data_Rd_RRESP(AXI4_Master_Activation_Data_Rd_RRESP),      // input wire [1 : 0] AXI4_Master_Activation_Data_Rd_RRESP
  .AXI4_Master_Activation_Data_Rd_ARREADY(AXI4_Master_Activation_Data_Rd_ARREADY),  // input wire AXI4_Master_Activation_Data_Rd_ARREADY
  .AXI4_Master_Activation_Data_Wr_AWREADY(AXI4_Master_Activation_Data_Wr_AWREADY),  // input wire AXI4_Master_Activation_Data_Wr_AWREADY
  .AXI4_Master_Activation_Data_Wr_WREADY(AXI4_Master_Activation_Data_Wr_WREADY),    // input wire AXI4_Master_Activation_Data_Wr_WREADY
  .AXI4_Master_Activation_Data_Wr_BID(AXI4_Master_Activation_Data_Wr_BID),          // input wire [7 : 0] AXI4_Master_Activation_Data_Wr_BID
  .AXI4_Master_Activation_Data_Wr_BRESP(AXI4_Master_Activation_Data_Wr_BRESP),      // input wire [1 : 0] AXI4_Master_Activation_Data_Wr_BRESP
  .AXI4_Master_Activation_Data_Wr_BVALID(AXI4_Master_Activation_Data_Wr_BVALID),    // input wire AXI4_Master_Activation_Data_Wr_BVALID
  .AXI4_Master_Weight_Data_Rd_RDATA(AXI4_Master_Weight_Data_Rd_RDATA),              // input wire [127 : 0] AXI4_Master_Weight_Data_Rd_RDATA
  .AXI4_Master_Weight_Data_Rd_RLAST(AXI4_Master_Weight_Data_Rd_RLAST),              // input wire AXI4_Master_Weight_Data_Rd_RLAST
  .AXI4_Master_Weight_Data_Rd_RVALID(AXI4_Master_Weight_Data_Rd_RVALID),            // input wire AXI4_Master_Weight_Data_Rd_RVALID
  .AXI4_Master_Weight_Data_Rd_RID(AXI4_Master_Weight_Data_Rd_RID),                  // input wire AXI4_Master_Weight_Data_Rd_RID
  .AXI4_Master_Weight_Data_Rd_RRESP(AXI4_Master_Weight_Data_Rd_RRESP),              // input wire [1 : 0] AXI4_Master_Weight_Data_Rd_RRESP
  .AXI4_Master_Weight_Data_Rd_ARREADY(AXI4_Master_Weight_Data_Rd_ARREADY),          // input wire AXI4_Master_Weight_Data_Rd_ARREADY
  .AXI4_Master_Weight_Data_Wr_AWREADY(AXI4_Master_Weight_Data_Wr_AWREADY),          // input wire AXI4_Master_Weight_Data_Wr_AWREADY
  .AXI4_Master_Weight_Data_Wr_WREADY(AXI4_Master_Weight_Data_Wr_WREADY),            // input wire AXI4_Master_Weight_Data_Wr_WREADY
  .AXI4_Master_Weight_Data_Wr_BID(AXI4_Master_Weight_Data_Wr_BID),                  // input wire AXI4_Master_Weight_Data_Wr_BID
  .AXI4_Master_Weight_Data_Wr_BRESP(AXI4_Master_Weight_Data_Wr_BRESP),              // input wire [1 : 0] AXI4_Master_Weight_Data_Wr_BRESP
  .AXI4_Master_Weight_Data_Wr_BVALID(AXI4_Master_Weight_Data_Wr_BVALID),            // input wire AXI4_Master_Weight_Data_Wr_BVALID
  .AXI4_Master_Debug_Rd_RDATA(AXI4_Master_Debug_Rd_RDATA),                          // input wire [31 : 0] AXI4_Master_Debug_Rd_RDATA
  .AXI4_Master_Debug_Rd_RLAST(AXI4_Master_Debug_Rd_RLAST),                          // input wire AXI4_Master_Debug_Rd_RLAST
  .AXI4_Master_Debug_Rd_RVALID(AXI4_Master_Debug_Rd_RVALID),                        // input wire AXI4_Master_Debug_Rd_RVALID
  .AXI4_Master_Debug_Rd_RID(AXI4_Master_Debug_Rd_RID),                              // input wire AXI4_Master_Debug_Rd_RID
  .AXI4_Master_Debug_Rd_RRESP(AXI4_Master_Debug_Rd_RRESP),                          // input wire [1 : 0] AXI4_Master_Debug_Rd_RRESP
  .AXI4_Master_Debug_Rd_ARREADY(AXI4_Master_Debug_Rd_ARREADY),                      // input wire AXI4_Master_Debug_Rd_ARREADY
  .AXI4_Master_Debug_Wr_AWREADY(AXI4_Master_Debug_Wr_AWREADY),                      // input wire AXI4_Master_Debug_Wr_AWREADY
  .AXI4_Master_Debug_Wr_WREADY(AXI4_Master_Debug_Wr_WREADY),                        // input wire AXI4_Master_Debug_Wr_WREADY
  .AXI4_Master_Debug_Wr_BID(AXI4_Master_Debug_Wr_BID),                              // input wire AXI4_Master_Debug_Wr_BID
  .AXI4_Master_Debug_Wr_BRESP(AXI4_Master_Debug_Wr_BRESP),                          // input wire [1 : 0] AXI4_Master_Debug_Wr_BRESP
  .AXI4_Master_Debug_Wr_BVALID(AXI4_Master_Debug_Wr_BVALID),                        // input wire AXI4_Master_Debug_Wr_BVALID
  .AXI4_ACLK(AXI4_ACLK),                                                            // input wire AXI4_ACLK
  .AXI4_ARESETN(AXI4_ARESETN),                                                      // input wire AXI4_ARESETN
  .AXI4_AWID(AXI4_AWID),                                                            // input wire [11 : 0] AXI4_AWID
  .AXI4_AWADDR(AXI4_AWADDR),                                                        // input wire [15 : 0] AXI4_AWADDR
  .AXI4_AWLEN(AXI4_AWLEN),                                                          // input wire [7 : 0] AXI4_AWLEN
  .AXI4_AWSIZE(AXI4_AWSIZE),                                                        // input wire [2 : 0] AXI4_AWSIZE
  .AXI4_AWBURST(AXI4_AWBURST),                                                      // input wire [1 : 0] AXI4_AWBURST
  .AXI4_AWLOCK(AXI4_AWLOCK),                                                        // input wire AXI4_AWLOCK
  .AXI4_AWCACHE(AXI4_AWCACHE),                                                      // input wire [3 : 0] AXI4_AWCACHE
  .AXI4_AWPROT(AXI4_AWPROT),                                                        // input wire [2 : 0] AXI4_AWPROT
  .AXI4_AWVALID(AXI4_AWVALID),                                                      // input wire AXI4_AWVALID
  .AXI4_WDATA(AXI4_WDATA),                                                          // input wire [31 : 0] AXI4_WDATA
  .AXI4_WSTRB(AXI4_WSTRB),                                                          // input wire [3 : 0] AXI4_WSTRB
  .AXI4_WLAST(AXI4_WLAST),                                                          // input wire AXI4_WLAST
  .AXI4_WVALID(AXI4_WVALID),                                                        // input wire AXI4_WVALID
  .AXI4_BREADY(AXI4_BREADY),                                                        // input wire AXI4_BREADY
  .AXI4_ARID(AXI4_ARID),                                                            // input wire [11 : 0] AXI4_ARID
  .AXI4_ARADDR(AXI4_ARADDR),                                                        // input wire [15 : 0] AXI4_ARADDR
  .AXI4_ARLEN(AXI4_ARLEN),                                                          // input wire [7 : 0] AXI4_ARLEN
  .AXI4_ARSIZE(AXI4_ARSIZE),                                                        // input wire [2 : 0] AXI4_ARSIZE
  .AXI4_ARBURST(AXI4_ARBURST),                                                      // input wire [1 : 0] AXI4_ARBURST
  .AXI4_ARLOCK(AXI4_ARLOCK),                                                        // input wire AXI4_ARLOCK
  .AXI4_ARCACHE(AXI4_ARCACHE),                                                      // input wire [3 : 0] AXI4_ARCACHE
  .AXI4_ARPROT(AXI4_ARPROT),                                                        // input wire [2 : 0] AXI4_ARPROT
  .AXI4_ARVALID(AXI4_ARVALID),                                                      // input wire AXI4_ARVALID
  .AXI4_RREADY(AXI4_RREADY),                                                        // input wire AXI4_RREADY
  .AXI4_Master_Activation_Data_Rd_ARID(AXI4_Master_Activation_Data_Rd_ARID),        // output wire [7 : 0] AXI4_Master_Activation_Data_Rd_ARID
  .AXI4_Master_Activation_Data_Rd_ARADDR(AXI4_Master_Activation_Data_Rd_ARADDR),    // output wire [31 : 0] AXI4_Master_Activation_Data_Rd_ARADDR
  .AXI4_Master_Activation_Data_Rd_ARLEN(AXI4_Master_Activation_Data_Rd_ARLEN),      // output wire [7 : 0] AXI4_Master_Activation_Data_Rd_ARLEN
  .AXI4_Master_Activation_Data_Rd_ARSIZE(AXI4_Master_Activation_Data_Rd_ARSIZE),    // output wire [2 : 0] AXI4_Master_Activation_Data_Rd_ARSIZE
  .AXI4_Master_Activation_Data_Rd_ARBURST(AXI4_Master_Activation_Data_Rd_ARBURST),  // output wire [1 : 0] AXI4_Master_Activation_Data_Rd_ARBURST
  .AXI4_Master_Activation_Data_Rd_ARLOCK(AXI4_Master_Activation_Data_Rd_ARLOCK),    // output wire AXI4_Master_Activation_Data_Rd_ARLOCK
  .AXI4_Master_Activation_Data_Rd_ARCACHE(AXI4_Master_Activation_Data_Rd_ARCACHE),  // output wire [3 : 0] AXI4_Master_Activation_Data_Rd_ARCACHE
  .AXI4_Master_Activation_Data_Rd_ARPROT(AXI4_Master_Activation_Data_Rd_ARPROT),    // output wire [2 : 0] AXI4_Master_Activation_Data_Rd_ARPROT
  .AXI4_Master_Activation_Data_Rd_ARVALID(AXI4_Master_Activation_Data_Rd_ARVALID),  // output wire AXI4_Master_Activation_Data_Rd_ARVALID
  .AXI4_Master_Activation_Data_Rd_RREADY(AXI4_Master_Activation_Data_Rd_RREADY),    // output wire AXI4_Master_Activation_Data_Rd_RREADY
  .AXI4_Master_Activation_Data_Wr_AWID(AXI4_Master_Activation_Data_Wr_AWID),        // output wire [7 : 0] AXI4_Master_Activation_Data_Wr_AWID
  .AXI4_Master_Activation_Data_Wr_AWADDR(AXI4_Master_Activation_Data_Wr_AWADDR),    // output wire [31 : 0] AXI4_Master_Activation_Data_Wr_AWADDR
  .AXI4_Master_Activation_Data_Wr_AWLEN(AXI4_Master_Activation_Data_Wr_AWLEN),      // output wire [7 : 0] AXI4_Master_Activation_Data_Wr_AWLEN
  .AXI4_Master_Activation_Data_Wr_AWSIZE(AXI4_Master_Activation_Data_Wr_AWSIZE),    // output wire [2 : 0] AXI4_Master_Activation_Data_Wr_AWSIZE
  .AXI4_Master_Activation_Data_Wr_AWBURST(AXI4_Master_Activation_Data_Wr_AWBURST),  // output wire [1 : 0] AXI4_Master_Activation_Data_Wr_AWBURST
  .AXI4_Master_Activation_Data_Wr_AWLOCK(AXI4_Master_Activation_Data_Wr_AWLOCK),    // output wire AXI4_Master_Activation_Data_Wr_AWLOCK
  .AXI4_Master_Activation_Data_Wr_AWCACHE(AXI4_Master_Activation_Data_Wr_AWCACHE),  // output wire [3 : 0] AXI4_Master_Activation_Data_Wr_AWCACHE
  .AXI4_Master_Activation_Data_Wr_AWPROT(AXI4_Master_Activation_Data_Wr_AWPROT),    // output wire [2 : 0] AXI4_Master_Activation_Data_Wr_AWPROT
  .AXI4_Master_Activation_Data_Wr_AWVALID(AXI4_Master_Activation_Data_Wr_AWVALID),  // output wire AXI4_Master_Activation_Data_Wr_AWVALID
  .AXI4_Master_Activation_Data_Wr_WDATA(AXI4_Master_Activation_Data_Wr_WDATA),      // output wire [127 : 0] AXI4_Master_Activation_Data_Wr_WDATA
  .AXI4_Master_Activation_Data_Wr_WSTRB(AXI4_Master_Activation_Data_Wr_WSTRB),      // output wire [15 : 0] AXI4_Master_Activation_Data_Wr_WSTRB
  .AXI4_Master_Activation_Data_Wr_WLAST(AXI4_Master_Activation_Data_Wr_WLAST),      // output wire AXI4_Master_Activation_Data_Wr_WLAST
  .AXI4_Master_Activation_Data_Wr_WVALID(AXI4_Master_Activation_Data_Wr_WVALID),    // output wire AXI4_Master_Activation_Data_Wr_WVALID
  .AXI4_Master_Activation_Data_Wr_BREADY(AXI4_Master_Activation_Data_Wr_BREADY),    // output wire AXI4_Master_Activation_Data_Wr_BREADY
  .AXI4_Master_Weight_Data_Rd_ARID(AXI4_Master_Weight_Data_Rd_ARID),                // output wire AXI4_Master_Weight_Data_Rd_ARID
  .AXI4_Master_Weight_Data_Rd_ARADDR(AXI4_Master_Weight_Data_Rd_ARADDR),            // output wire [31 : 0] AXI4_Master_Weight_Data_Rd_ARADDR
  .AXI4_Master_Weight_Data_Rd_ARLEN(AXI4_Master_Weight_Data_Rd_ARLEN),              // output wire [7 : 0] AXI4_Master_Weight_Data_Rd_ARLEN
  .AXI4_Master_Weight_Data_Rd_ARSIZE(AXI4_Master_Weight_Data_Rd_ARSIZE),            // output wire [2 : 0] AXI4_Master_Weight_Data_Rd_ARSIZE
  .AXI4_Master_Weight_Data_Rd_ARBURST(AXI4_Master_Weight_Data_Rd_ARBURST),          // output wire [1 : 0] AXI4_Master_Weight_Data_Rd_ARBURST
  .AXI4_Master_Weight_Data_Rd_ARLOCK(AXI4_Master_Weight_Data_Rd_ARLOCK),            // output wire AXI4_Master_Weight_Data_Rd_ARLOCK
  .AXI4_Master_Weight_Data_Rd_ARCACHE(AXI4_Master_Weight_Data_Rd_ARCACHE),          // output wire [3 : 0] AXI4_Master_Weight_Data_Rd_ARCACHE
  .AXI4_Master_Weight_Data_Rd_ARPROT(AXI4_Master_Weight_Data_Rd_ARPROT),            // output wire [2 : 0] AXI4_Master_Weight_Data_Rd_ARPROT
  .AXI4_Master_Weight_Data_Rd_ARVALID(AXI4_Master_Weight_Data_Rd_ARVALID),          // output wire AXI4_Master_Weight_Data_Rd_ARVALID
  .AXI4_Master_Weight_Data_Rd_RREADY(AXI4_Master_Weight_Data_Rd_RREADY),            // output wire AXI4_Master_Weight_Data_Rd_RREADY
  .AXI4_Master_Weight_Data_Wr_AWID(AXI4_Master_Weight_Data_Wr_AWID),                // output wire AXI4_Master_Weight_Data_Wr_AWID
  .AXI4_Master_Weight_Data_Wr_AWADDR(AXI4_Master_Weight_Data_Wr_AWADDR),            // output wire [31 : 0] AXI4_Master_Weight_Data_Wr_AWADDR
  .AXI4_Master_Weight_Data_Wr_AWLEN(AXI4_Master_Weight_Data_Wr_AWLEN),              // output wire [7 : 0] AXI4_Master_Weight_Data_Wr_AWLEN
  .AXI4_Master_Weight_Data_Wr_AWSIZE(AXI4_Master_Weight_Data_Wr_AWSIZE),            // output wire [2 : 0] AXI4_Master_Weight_Data_Wr_AWSIZE
  .AXI4_Master_Weight_Data_Wr_AWBURST(AXI4_Master_Weight_Data_Wr_AWBURST),          // output wire [1 : 0] AXI4_Master_Weight_Data_Wr_AWBURST
  .AXI4_Master_Weight_Data_Wr_AWLOCK(AXI4_Master_Weight_Data_Wr_AWLOCK),            // output wire AXI4_Master_Weight_Data_Wr_AWLOCK
  .AXI4_Master_Weight_Data_Wr_AWCACHE(AXI4_Master_Weight_Data_Wr_AWCACHE),          // output wire [3 : 0] AXI4_Master_Weight_Data_Wr_AWCACHE
  .AXI4_Master_Weight_Data_Wr_AWPROT(AXI4_Master_Weight_Data_Wr_AWPROT),            // output wire [2 : 0] AXI4_Master_Weight_Data_Wr_AWPROT
  .AXI4_Master_Weight_Data_Wr_AWVALID(AXI4_Master_Weight_Data_Wr_AWVALID),          // output wire AXI4_Master_Weight_Data_Wr_AWVALID
  .AXI4_Master_Weight_Data_Wr_WDATA(AXI4_Master_Weight_Data_Wr_WDATA),              // output wire [127 : 0] AXI4_Master_Weight_Data_Wr_WDATA
  .AXI4_Master_Weight_Data_Wr_WSTRB(AXI4_Master_Weight_Data_Wr_WSTRB),              // output wire [15 : 0] AXI4_Master_Weight_Data_Wr_WSTRB
  .AXI4_Master_Weight_Data_Wr_WLAST(AXI4_Master_Weight_Data_Wr_WLAST),              // output wire AXI4_Master_Weight_Data_Wr_WLAST
  .AXI4_Master_Weight_Data_Wr_WVALID(AXI4_Master_Weight_Data_Wr_WVALID),            // output wire AXI4_Master_Weight_Data_Wr_WVALID
  .AXI4_Master_Weight_Data_Wr_BREADY(AXI4_Master_Weight_Data_Wr_BREADY),            // output wire AXI4_Master_Weight_Data_Wr_BREADY
  .AXI4_Master_Debug_Rd_ARID(AXI4_Master_Debug_Rd_ARID),                            // output wire AXI4_Master_Debug_Rd_ARID
  .AXI4_Master_Debug_Rd_ARADDR(AXI4_Master_Debug_Rd_ARADDR),                        // output wire [31 : 0] AXI4_Master_Debug_Rd_ARADDR
  .AXI4_Master_Debug_Rd_ARLEN(AXI4_Master_Debug_Rd_ARLEN),                          // output wire [7 : 0] AXI4_Master_Debug_Rd_ARLEN
  .AXI4_Master_Debug_Rd_ARSIZE(AXI4_Master_Debug_Rd_ARSIZE),                        // output wire [2 : 0] AXI4_Master_Debug_Rd_ARSIZE
  .AXI4_Master_Debug_Rd_ARBURST(AXI4_Master_Debug_Rd_ARBURST),                      // output wire [1 : 0] AXI4_Master_Debug_Rd_ARBURST
  .AXI4_Master_Debug_Rd_ARLOCK(AXI4_Master_Debug_Rd_ARLOCK),                        // output wire AXI4_Master_Debug_Rd_ARLOCK
  .AXI4_Master_Debug_Rd_ARCACHE(AXI4_Master_Debug_Rd_ARCACHE),                      // output wire [3 : 0] AXI4_Master_Debug_Rd_ARCACHE
  .AXI4_Master_Debug_Rd_ARPROT(AXI4_Master_Debug_Rd_ARPROT),                        // output wire [2 : 0] AXI4_Master_Debug_Rd_ARPROT
  .AXI4_Master_Debug_Rd_ARVALID(AXI4_Master_Debug_Rd_ARVALID),                      // output wire AXI4_Master_Debug_Rd_ARVALID
  .AXI4_Master_Debug_Rd_RREADY(AXI4_Master_Debug_Rd_RREADY),                        // output wire AXI4_Master_Debug_Rd_RREADY
  .AXI4_Master_Debug_Wr_AWID(AXI4_Master_Debug_Wr_AWID),                            // output wire AXI4_Master_Debug_Wr_AWID
  .AXI4_Master_Debug_Wr_AWADDR(AXI4_Master_Debug_Wr_AWADDR),                        // output wire [31 : 0] AXI4_Master_Debug_Wr_AWADDR
  .AXI4_Master_Debug_Wr_AWLEN(AXI4_Master_Debug_Wr_AWLEN),                          // output wire [7 : 0] AXI4_Master_Debug_Wr_AWLEN
  .AXI4_Master_Debug_Wr_AWSIZE(AXI4_Master_Debug_Wr_AWSIZE),                        // output wire [2 : 0] AXI4_Master_Debug_Wr_AWSIZE
  .AXI4_Master_Debug_Wr_AWBURST(AXI4_Master_Debug_Wr_AWBURST),                      // output wire [1 : 0] AXI4_Master_Debug_Wr_AWBURST
  .AXI4_Master_Debug_Wr_AWLOCK(AXI4_Master_Debug_Wr_AWLOCK),                        // output wire AXI4_Master_Debug_Wr_AWLOCK
  .AXI4_Master_Debug_Wr_AWCACHE(AXI4_Master_Debug_Wr_AWCACHE),                      // output wire [3 : 0] AXI4_Master_Debug_Wr_AWCACHE
  .AXI4_Master_Debug_Wr_AWPROT(AXI4_Master_Debug_Wr_AWPROT),                        // output wire [2 : 0] AXI4_Master_Debug_Wr_AWPROT
  .AXI4_Master_Debug_Wr_AWVALID(AXI4_Master_Debug_Wr_AWVALID),                      // output wire AXI4_Master_Debug_Wr_AWVALID
  .AXI4_Master_Debug_Wr_WDATA(AXI4_Master_Debug_Wr_WDATA),                          // output wire [31 : 0] AXI4_Master_Debug_Wr_WDATA
  .AXI4_Master_Debug_Wr_WSTRB(AXI4_Master_Debug_Wr_WSTRB),                          // output wire [3 : 0] AXI4_Master_Debug_Wr_WSTRB
  .AXI4_Master_Debug_Wr_WLAST(AXI4_Master_Debug_Wr_WLAST),                          // output wire AXI4_Master_Debug_Wr_WLAST
  .AXI4_Master_Debug_Wr_WVALID(AXI4_Master_Debug_Wr_WVALID),                        // output wire AXI4_Master_Debug_Wr_WVALID
  .AXI4_Master_Debug_Wr_BREADY(AXI4_Master_Debug_Wr_BREADY),                        // output wire AXI4_Master_Debug_Wr_BREADY
  .AXI4_AWREADY(AXI4_AWREADY),                                                      // output wire AXI4_AWREADY
  .AXI4_WREADY(AXI4_WREADY),                                                        // output wire AXI4_WREADY
  .AXI4_BID(AXI4_BID),                                                              // output wire [11 : 0] AXI4_BID
  .AXI4_BRESP(AXI4_BRESP),                                                          // output wire [1 : 0] AXI4_BRESP
  .AXI4_BVALID(AXI4_BVALID),                                                        // output wire AXI4_BVALID
  .AXI4_ARREADY(AXI4_ARREADY),                                                      // output wire AXI4_ARREADY
  .AXI4_RID(AXI4_RID),                                                              // output wire [11 : 0] AXI4_RID
  .AXI4_RDATA(AXI4_RDATA),                                                          // output wire [31 : 0] AXI4_RDATA
  .AXI4_RRESP(AXI4_RRESP),                                                          // output wire [1 : 0] AXI4_RRESP
  .AXI4_RLAST(AXI4_RLAST),                                                          // output wire AXI4_RLAST
  .AXI4_RVALID(AXI4_RVALID)                                                        // output wire AXI4_RVALID
);
// INST_TAG_END ------ End INSTANTIATION Template ---------

// You must compile the wrapper file GenericProcessor_0.v when simulating
// the core, GenericProcessor_0. When compiling the wrapper file, be sure to
// reference the Verilog simulation library.

