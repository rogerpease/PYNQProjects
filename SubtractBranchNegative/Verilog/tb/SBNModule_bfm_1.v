//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
//Date        : Thu May  6 20:06:22 2021
//Host        : rpeaseryzen running 64-bit Ubuntu 20.04.2 LTS
//Command     : generate_target SBNModule_bfm_1.bd
//Design      : SBNModule_bfm_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "SBNModule_bfm_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=SBNModule_bfm_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=2,numReposBlks=2,numNonXlnxBlks=1,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "SBNModule_bfm_1.hwdef" *) 
module SBNModule_bfm_1
   (ACLK,
    ARESETN);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.ACLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.ACLK, ASSOCIATED_RESET ARESETN, CLK_DOMAIN SBNModule_bfm_1_ACLK, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000" *) input ACLK;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.ARESETN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.ARESETN, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input ARESETN;

  wire aclk_net;
  wire aresetn_net;
  wire [31:0]master_0_M_AXI_ARADDR;
  wire [2:0]master_0_M_AXI_ARPROT;
  wire master_0_M_AXI_ARREADY;
  wire master_0_M_AXI_ARVALID;
  wire [31:0]master_0_M_AXI_AWADDR;
  wire [2:0]master_0_M_AXI_AWPROT;
  wire master_0_M_AXI_AWREADY;
  wire master_0_M_AXI_AWVALID;
  wire master_0_M_AXI_BREADY;
  wire [1:0]master_0_M_AXI_BRESP;
  wire master_0_M_AXI_BVALID;
  wire [31:0]master_0_M_AXI_RDATA;
  wire master_0_M_AXI_RREADY;
  wire [1:0]master_0_M_AXI_RRESP;
  wire master_0_M_AXI_RVALID;
  wire [31:0]master_0_M_AXI_WDATA;
  wire master_0_M_AXI_WREADY;
  wire [3:0]master_0_M_AXI_WSTRB;
  wire master_0_M_AXI_WVALID;

  assign aclk_net = ACLK;
  assign aresetn_net = ARESETN;
  SBNModule_bfm_1_SBNModule_0_0 SBNModule_0
       (.sbndatapath_aclk(aclk_net),
        .sbndatapath_araddr(master_0_M_AXI_ARADDR[6:0]),
        .sbndatapath_aresetn(aresetn_net),
        .sbndatapath_arprot(master_0_M_AXI_ARPROT),
        .sbndatapath_arready(master_0_M_AXI_ARREADY),
        .sbndatapath_arvalid(master_0_M_AXI_ARVALID),
        .sbndatapath_awaddr(master_0_M_AXI_AWADDR[6:0]),
        .sbndatapath_awprot(master_0_M_AXI_AWPROT),
        .sbndatapath_awready(master_0_M_AXI_AWREADY),
        .sbndatapath_awvalid(master_0_M_AXI_AWVALID),
        .sbndatapath_bready(master_0_M_AXI_BREADY),
        .sbndatapath_bresp(master_0_M_AXI_BRESP),
        .sbndatapath_bvalid(master_0_M_AXI_BVALID),
        .sbndatapath_rdata(master_0_M_AXI_RDATA),
        .sbndatapath_rready(master_0_M_AXI_RREADY),
        .sbndatapath_rresp(master_0_M_AXI_RRESP),
        .sbndatapath_rvalid(master_0_M_AXI_RVALID),
        .sbndatapath_wdata(master_0_M_AXI_WDATA),
        .sbndatapath_wready(master_0_M_AXI_WREADY),
        .sbndatapath_wstrb(master_0_M_AXI_WSTRB),
        .sbndatapath_wvalid(master_0_M_AXI_WVALID));
  SBNModule_bfm_1_master_0_0 master_0
       (.aclk(aclk_net),
        .aresetn(aresetn_net),
        .m_axi_araddr(master_0_M_AXI_ARADDR),
        .m_axi_arprot(master_0_M_AXI_ARPROT),
        .m_axi_arready(master_0_M_AXI_ARREADY),
        .m_axi_arvalid(master_0_M_AXI_ARVALID),
        .m_axi_awaddr(master_0_M_AXI_AWADDR),
        .m_axi_awprot(master_0_M_AXI_AWPROT),
        .m_axi_awready(master_0_M_AXI_AWREADY),
        .m_axi_awvalid(master_0_M_AXI_AWVALID),
        .m_axi_bready(master_0_M_AXI_BREADY),
        .m_axi_bresp(master_0_M_AXI_BRESP),
        .m_axi_bvalid(master_0_M_AXI_BVALID),
        .m_axi_rdata(master_0_M_AXI_RDATA),
        .m_axi_rready(master_0_M_AXI_RREADY),
        .m_axi_rresp(master_0_M_AXI_RRESP),
        .m_axi_rvalid(master_0_M_AXI_RVALID),
        .m_axi_wdata(master_0_M_AXI_WDATA),
        .m_axi_wready(master_0_M_AXI_WREADY),
        .m_axi_wstrb(master_0_M_AXI_WSTRB),
        .m_axi_wvalid(master_0_M_AXI_WVALID));
endmodule
