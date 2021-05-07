// (c) Copyright 1995-2021 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: user.org:user:SBNModule:1.0
// IP Revision: 1

`timescale 1ns/1ps

(* DowngradeIPIdentifiedWarnings = "yes" *)
module SBNModule_bfm_1_SBNModule_0_0 (
  sbndatapath_awaddr,
  sbndatapath_awprot,
  sbndatapath_awvalid,
  sbndatapath_awready,
  sbndatapath_wdata,
  sbndatapath_wstrb,
  sbndatapath_wvalid,
  sbndatapath_wready,
  sbndatapath_bresp,
  sbndatapath_bvalid,
  sbndatapath_bready,
  sbndatapath_araddr,
  sbndatapath_arprot,
  sbndatapath_arvalid,
  sbndatapath_arready,
  sbndatapath_rdata,
  sbndatapath_rresp,
  sbndatapath_rvalid,
  sbndatapath_rready,
  sbndatapath_aclk,
  sbndatapath_aresetn
);

(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 sbndatapath AWADDR" *)
input wire [6 : 0] sbndatapath_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 sbndatapath AWPROT" *)
input wire [2 : 0] sbndatapath_awprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 sbndatapath AWVALID" *)
input wire sbndatapath_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 sbndatapath AWREADY" *)
output wire sbndatapath_awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 sbndatapath WDATA" *)
input wire [31 : 0] sbndatapath_wdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 sbndatapath WSTRB" *)
input wire [3 : 0] sbndatapath_wstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 sbndatapath WVALID" *)
input wire sbndatapath_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 sbndatapath WREADY" *)
output wire sbndatapath_wready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 sbndatapath BRESP" *)
output wire [1 : 0] sbndatapath_bresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 sbndatapath BVALID" *)
output wire sbndatapath_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 sbndatapath BREADY" *)
input wire sbndatapath_bready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 sbndatapath ARADDR" *)
input wire [6 : 0] sbndatapath_araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 sbndatapath ARPROT" *)
input wire [2 : 0] sbndatapath_arprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 sbndatapath ARVALID" *)
input wire sbndatapath_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 sbndatapath ARREADY" *)
output wire sbndatapath_arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 sbndatapath RDATA" *)
output wire [31 : 0] sbndatapath_rdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 sbndatapath RRESP" *)
output wire [1 : 0] sbndatapath_rresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 sbndatapath RVALID" *)
output wire sbndatapath_rvalid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME sbndatapath, WIZ_DATA_WIDTH 32, WIZ_NUM_REG 32, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 7, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN SBNModule_bfm\
_1_ACLK, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 sbndatapath RREADY" *)
input wire sbndatapath_rready;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME sbndatapath_CLK, ASSOCIATED_BUSIF sbndatapath, ASSOCIATED_RESET sbndatapath_aresetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN SBNModule_bfm_1_ACLK, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 sbndatapath_CLK CLK" *)
input wire sbndatapath_aclk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME sbndatapath_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 sbndatapath_RST RST" *)
input wire sbndatapath_aresetn;

  SBNModule #(
    .C_sbndatapath_DATA_WIDTH(32),  // Width of S_AXI data bus
    .C_sbndatapath_ADDR_WIDTH(7)  // Width of S_AXI address bus
  ) inst (
    .sbndatapath_awaddr(sbndatapath_awaddr),
    .sbndatapath_awprot(sbndatapath_awprot),
    .sbndatapath_awvalid(sbndatapath_awvalid),
    .sbndatapath_awready(sbndatapath_awready),
    .sbndatapath_wdata(sbndatapath_wdata),
    .sbndatapath_wstrb(sbndatapath_wstrb),
    .sbndatapath_wvalid(sbndatapath_wvalid),
    .sbndatapath_wready(sbndatapath_wready),
    .sbndatapath_bresp(sbndatapath_bresp),
    .sbndatapath_bvalid(sbndatapath_bvalid),
    .sbndatapath_bready(sbndatapath_bready),
    .sbndatapath_araddr(sbndatapath_araddr),
    .sbndatapath_arprot(sbndatapath_arprot),
    .sbndatapath_arvalid(sbndatapath_arvalid),
    .sbndatapath_arready(sbndatapath_arready),
    .sbndatapath_rdata(sbndatapath_rdata),
    .sbndatapath_rresp(sbndatapath_rresp),
    .sbndatapath_rvalid(sbndatapath_rvalid),
    .sbndatapath_rready(sbndatapath_rready),
    .sbndatapath_aclk(sbndatapath_aclk),
    .sbndatapath_aresetn(sbndatapath_aresetn)
  );
endmodule
