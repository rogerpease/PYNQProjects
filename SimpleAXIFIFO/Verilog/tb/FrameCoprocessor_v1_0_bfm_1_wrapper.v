//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
//Date        : Wed Apr 28 11:14:53 2021
//Host        : rpeaseryzen running 64-bit Ubuntu 20.04.2 LTS
//Command     : generate_target FrameCoprocessor_v1_0_bfm_1_wrapper.bd
//Design      : FrameCoprocessor_v1_0_bfm_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module FrameCoprocessor_v1_0_bfm_1_wrapper
   (ACLK,
    ARESETN,
    StreamDataIn_0_tdata,
    StreamDataIn_0_tlast,
    StreamDataIn_0_tready,
    StreamDataIn_0_tstrb,
    StreamDataIn_0_tvalid,
    StreamDataOut_0_tdata,
    StreamDataOut_0_tlast,
    StreamDataOut_0_tready,
    StreamDataOut_0_tstrb,
    StreamDataOut_0_tvalid);
  input ACLK;
  input ARESETN;
  input [31:0]StreamDataIn_0_tdata;
  input StreamDataIn_0_tlast;
  output StreamDataIn_0_tready;
  input [3:0]StreamDataIn_0_tstrb;
  input StreamDataIn_0_tvalid;
  output [31:0]StreamDataOut_0_tdata;
  output StreamDataOut_0_tlast;
  input StreamDataOut_0_tready;
  output [3:0]StreamDataOut_0_tstrb;
  output StreamDataOut_0_tvalid;

  wire ACLK;
  wire ARESETN;
  wire [31:0]StreamDataIn_0_tdata;
  wire StreamDataIn_0_tlast;
  wire StreamDataIn_0_tready;
  wire [3:0]StreamDataIn_0_tstrb;
  wire StreamDataIn_0_tvalid;
  wire [31:0]StreamDataOut_0_tdata;
  wire StreamDataOut_0_tlast;
  wire StreamDataOut_0_tready;
  wire [3:0]StreamDataOut_0_tstrb;
  wire StreamDataOut_0_tvalid;

  FrameCoprocessor_v1_0_bfm_1 FrameCoprocessor_v1_0_bfm_1_i
       (.ACLK(ACLK),
        .ARESETN(ARESETN),
        .StreamDataIn_0_tdata(StreamDataIn_0_tdata),
        .StreamDataIn_0_tlast(StreamDataIn_0_tlast),
        .StreamDataIn_0_tready(StreamDataIn_0_tready),
        .StreamDataIn_0_tstrb(StreamDataIn_0_tstrb),
        .StreamDataIn_0_tvalid(StreamDataIn_0_tvalid),
        .StreamDataOut_0_tdata(StreamDataOut_0_tdata),
        .StreamDataOut_0_tlast(StreamDataOut_0_tlast),
        .StreamDataOut_0_tready(StreamDataOut_0_tready),
        .StreamDataOut_0_tstrb(StreamDataOut_0_tstrb),
        .StreamDataOut_0_tvalid(StreamDataOut_0_tvalid));
endmodule
