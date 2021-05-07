//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
//Date        : Thu May  6 20:06:22 2021
//Host        : rpeaseryzen running 64-bit Ubuntu 20.04.2 LTS
//Command     : generate_target SBNModule_bfm_1_wrapper.bd
//Design      : SBNModule_bfm_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module SBNModule_bfm_1_wrapper
   (ACLK,
    ARESETN);
  input ACLK;
  input ARESETN;

  wire ACLK;
  wire ARESETN;

  SBNModule_bfm_1 SBNModule_bfm_1_i
       (.ACLK(ACLK),
        .ARESETN(ARESETN));
endmodule
