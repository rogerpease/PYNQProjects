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


// IP VLNV: user.org:user:FrameCoprocessor:1.0
// IP Revision: 1

`timescale 1ns/1ps

(* DowngradeIPIdentifiedWarnings = "yes" *)
module FrameCoprocessor_v1_0_bfm_1_FrameCoprocessor_0_0 (
  streamdatain_tdata,
  streamdatain_tstrb,
  streamdatain_tlast,
  streamdatain_tvalid,
  streamdatain_tready,
  streamdatain_aclk,
  streamdatain_aresetn,
  streamdataout_tdata,
  streamdataout_tstrb,
  streamdataout_tlast,
  streamdataout_tvalid,
  streamdataout_tready,
  streamdataout_aclk,
  streamdataout_aresetn,
  control_awaddr,
  control_awprot,
  control_awvalid,
  control_awready,
  control_wdata,
  control_wstrb,
  control_wvalid,
  control_wready,
  control_bresp,
  control_bvalid,
  control_bready,
  control_araddr,
  control_arprot,
  control_arvalid,
  control_arready,
  control_rdata,
  control_rresp,
  control_rvalid,
  control_rready,
  control_aclk,
  control_aresetn
);

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 StreamDataIn TDATA" *)
input wire [31 : 0] streamdatain_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 StreamDataIn TSTRB" *)
input wire [3 : 0] streamdatain_tstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 StreamDataIn TLAST" *)
input wire streamdatain_tlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 StreamDataIn TVALID" *)
input wire streamdatain_tvalid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME StreamDataIn, WIZ_DATA_WIDTH 32, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN FrameCoprocessor_v1_0_bfm_1_ACLK, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 StreamDataIn TREADY" *)
output wire streamdatain_tready;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME StreamDataIn_CLK, ASSOCIATED_BUSIF StreamDataIn, ASSOCIATED_RESET streamdatain_aresetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN FrameCoprocessor_v1_0_bfm_1_ACLK, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 StreamDataIn_CLK CLK" *)
input wire streamdatain_aclk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME StreamDataIn_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 StreamDataIn_RST RST" *)
input wire streamdatain_aresetn;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 StreamDataOut TDATA" *)
output wire [31 : 0] streamdataout_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 StreamDataOut TSTRB" *)
output wire [3 : 0] streamdataout_tstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 StreamDataOut TLAST" *)
output wire streamdataout_tlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 StreamDataOut TVALID" *)
output wire streamdataout_tvalid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME StreamDataOut, WIZ_DATA_WIDTH 32, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN FrameCoprocessor_v1_0_bfm_1_ACLK, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 StreamDataOut TREADY" *)
input wire streamdataout_tready;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME StreamDataOut_CLK, ASSOCIATED_BUSIF StreamDataOut, ASSOCIATED_RESET streamdataout_aresetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN FrameCoprocessor_v1_0_bfm_1_ACLK, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 StreamDataOut_CLK CLK" *)
input wire streamdataout_aclk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME StreamDataOut_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 StreamDataOut_RST RST" *)
input wire streamdataout_aresetn;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 Control AWADDR" *)
input wire [6 : 0] control_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 Control AWPROT" *)
input wire [2 : 0] control_awprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 Control AWVALID" *)
input wire control_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 Control AWREADY" *)
output wire control_awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 Control WDATA" *)
input wire [31 : 0] control_wdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 Control WSTRB" *)
input wire [3 : 0] control_wstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 Control WVALID" *)
input wire control_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 Control WREADY" *)
output wire control_wready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 Control BRESP" *)
output wire [1 : 0] control_bresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 Control BVALID" *)
output wire control_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 Control BREADY" *)
input wire control_bready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 Control ARADDR" *)
input wire [6 : 0] control_araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 Control ARPROT" *)
input wire [2 : 0] control_arprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 Control ARVALID" *)
input wire control_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 Control ARREADY" *)
output wire control_arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 Control RDATA" *)
output wire [31 : 0] control_rdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 Control RRESP" *)
output wire [1 : 0] control_rresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 Control RVALID" *)
output wire control_rvalid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME Control, WIZ_DATA_WIDTH 32, WIZ_NUM_REG 32, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 7, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN FrameCoprocessor_v1_0_\
bfm_1_ACLK, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 Control RREADY" *)
input wire control_rready;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME Control_CLK, ASSOCIATED_BUSIF Control, ASSOCIATED_RESET control_aresetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN FrameCoprocessor_v1_0_bfm_1_ACLK, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 Control_CLK CLK" *)
input wire control_aclk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME Control_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 Control_RST RST" *)
input wire control_aresetn;

  FrameCoprocessor_v1_0 #(
    .C_StreamDataIn_TDATA_WIDTH(32),  // AXI4Stream sink: Data Width
    .C_StreamDataOut_TDATA_WIDTH(32),  // Width of S_AXIS address bus. The slave accepts the read and write addresses of width C_M_AXIS_TDATA_WIDTH.
    .C_StreamDataOut_START_COUNT(32),  // Start count is the number of clock cycles the master will wait before initiating/issuing any transaction.
    .C_Control_DATA_WIDTH(32),  // Width of S_AXI data bus
    .C_Control_ADDR_WIDTH(7)  // Width of S_AXI address bus
  ) inst (
    .streamdatain_tdata(streamdatain_tdata),
    .streamdatain_tstrb(streamdatain_tstrb),
    .streamdatain_tlast(streamdatain_tlast),
    .streamdatain_tvalid(streamdatain_tvalid),
    .streamdatain_tready(streamdatain_tready),
    .streamdatain_aclk(streamdatain_aclk),
    .streamdatain_aresetn(streamdatain_aresetn),
    .streamdataout_tdata(streamdataout_tdata),
    .streamdataout_tstrb(streamdataout_tstrb),
    .streamdataout_tlast(streamdataout_tlast),
    .streamdataout_tvalid(streamdataout_tvalid),
    .streamdataout_tready(streamdataout_tready),
    .streamdataout_aclk(streamdataout_aclk),
    .streamdataout_aresetn(streamdataout_aresetn),
    .control_awaddr(control_awaddr),
    .control_awprot(control_awprot),
    .control_awvalid(control_awvalid),
    .control_awready(control_awready),
    .control_wdata(control_wdata),
    .control_wstrb(control_wstrb),
    .control_wvalid(control_wvalid),
    .control_wready(control_wready),
    .control_bresp(control_bresp),
    .control_bvalid(control_bvalid),
    .control_bready(control_bready),
    .control_araddr(control_araddr),
    .control_arprot(control_arprot),
    .control_arvalid(control_arvalid),
    .control_arready(control_arready),
    .control_rdata(control_rdata),
    .control_rresp(control_rresp),
    .control_rvalid(control_rvalid),
    .control_rready(control_rready),
    .control_aclk(control_aclk),
    .control_aresetn(control_aresetn)
  );
endmodule
