//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
//Date        : Wed Apr 28 11:14:53 2021
//Host        : rpeaseryzen running 64-bit Ubuntu 20.04.2 LTS
//Command     : generate_target FrameCoprocessor_v1_0_bfm_1.bd
//Design      : FrameCoprocessor_v1_0_bfm_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "FrameCoprocessor_v1_0_bfm_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=FrameCoprocessor_v1_0_bfm_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=2,numReposBlks=2,numNonXlnxBlks=1,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "FrameCoprocessor_v1_0_bfm_1.hwdef" *) 
module FrameCoprocessor_v1_0_bfm_1
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
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.ACLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.ACLK, ASSOCIATED_BUSIF StreamDataIn_0:StreamDataOut_0, ASSOCIATED_RESET ARESETN, CLK_DOMAIN FrameCoprocessor_v1_0_bfm_1_ACLK, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000" *) input ACLK;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.ARESETN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.ARESETN, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input ARESETN;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 StreamDataIn_0 TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME StreamDataIn_0, CLK_DOMAIN FrameCoprocessor_v1_0_bfm_1_ACLK, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 1, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) input [31:0]StreamDataIn_0_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 StreamDataIn_0 TLAST" *) input StreamDataIn_0_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 StreamDataIn_0 TREADY" *) output StreamDataIn_0_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 StreamDataIn_0 TSTRB" *) input [3:0]StreamDataIn_0_tstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 StreamDataIn_0 TVALID" *) input StreamDataIn_0_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 StreamDataOut_0 TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME StreamDataOut_0, CLK_DOMAIN FrameCoprocessor_v1_0_bfm_1_ACLK, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 1, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) output [31:0]StreamDataOut_0_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 StreamDataOut_0 TLAST" *) output StreamDataOut_0_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 StreamDataOut_0 TREADY" *) input StreamDataOut_0_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 StreamDataOut_0 TSTRB" *) output [3:0]StreamDataOut_0_tstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 StreamDataOut_0 TVALID" *) output StreamDataOut_0_tvalid;

  wire [31:0]FrameCoprocessor_0_StreamDataOut_TDATA;
  wire FrameCoprocessor_0_StreamDataOut_TLAST;
  wire FrameCoprocessor_0_StreamDataOut_TREADY;
  wire [3:0]FrameCoprocessor_0_StreamDataOut_TSTRB;
  wire FrameCoprocessor_0_StreamDataOut_TVALID;
  wire [31:0]StreamDataIn_0_1_TDATA;
  wire StreamDataIn_0_1_TLAST;
  wire StreamDataIn_0_1_TREADY;
  wire [3:0]StreamDataIn_0_1_TSTRB;
  wire StreamDataIn_0_1_TVALID;
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

  assign FrameCoprocessor_0_StreamDataOut_TREADY = StreamDataOut_0_tready;
  assign StreamDataIn_0_1_TDATA = StreamDataIn_0_tdata[31:0];
  assign StreamDataIn_0_1_TLAST = StreamDataIn_0_tlast;
  assign StreamDataIn_0_1_TSTRB = StreamDataIn_0_tstrb[3:0];
  assign StreamDataIn_0_1_TVALID = StreamDataIn_0_tvalid;
  assign StreamDataIn_0_tready = StreamDataIn_0_1_TREADY;
  assign StreamDataOut_0_tdata[31:0] = FrameCoprocessor_0_StreamDataOut_TDATA;
  assign StreamDataOut_0_tlast = FrameCoprocessor_0_StreamDataOut_TLAST;
  assign StreamDataOut_0_tstrb[3:0] = FrameCoprocessor_0_StreamDataOut_TSTRB;
  assign StreamDataOut_0_tvalid = FrameCoprocessor_0_StreamDataOut_TVALID;
  assign aclk_net = ACLK;
  assign aresetn_net = ARESETN;
  FrameCoprocessor_v1_0_bfm_1_FrameCoprocessor_0_0 FrameCoprocessor_0
       (.control_aclk(aclk_net),
        .control_araddr(master_0_M_AXI_ARADDR[6:0]),
        .control_aresetn(aresetn_net),
        .control_arprot(master_0_M_AXI_ARPROT),
        .control_arready(master_0_M_AXI_ARREADY),
        .control_arvalid(master_0_M_AXI_ARVALID),
        .control_awaddr(master_0_M_AXI_AWADDR[6:0]),
        .control_awprot(master_0_M_AXI_AWPROT),
        .control_awready(master_0_M_AXI_AWREADY),
        .control_awvalid(master_0_M_AXI_AWVALID),
        .control_bready(master_0_M_AXI_BREADY),
        .control_bresp(master_0_M_AXI_BRESP),
        .control_bvalid(master_0_M_AXI_BVALID),
        .control_rdata(master_0_M_AXI_RDATA),
        .control_rready(master_0_M_AXI_RREADY),
        .control_rresp(master_0_M_AXI_RRESP),
        .control_rvalid(master_0_M_AXI_RVALID),
        .control_wdata(master_0_M_AXI_WDATA),
        .control_wready(master_0_M_AXI_WREADY),
        .control_wstrb(master_0_M_AXI_WSTRB),
        .control_wvalid(master_0_M_AXI_WVALID),
        .streamdatain_aclk(aclk_net),
        .streamdatain_aresetn(aresetn_net),
        .streamdatain_tdata(StreamDataIn_0_1_TDATA),
        .streamdatain_tlast(StreamDataIn_0_1_TLAST),
        .streamdatain_tready(StreamDataIn_0_1_TREADY),
        .streamdatain_tstrb(StreamDataIn_0_1_TSTRB),
        .streamdatain_tvalid(StreamDataIn_0_1_TVALID),
        .streamdataout_aclk(aclk_net),
        .streamdataout_aresetn(aresetn_net),
        .streamdataout_tdata(FrameCoprocessor_0_StreamDataOut_TDATA),
        .streamdataout_tlast(FrameCoprocessor_0_StreamDataOut_TLAST),
        .streamdataout_tready(FrameCoprocessor_0_StreamDataOut_TREADY),
        .streamdataout_tstrb(FrameCoprocessor_0_StreamDataOut_TSTRB),
        .streamdataout_tvalid(FrameCoprocessor_0_StreamDataOut_TVALID));
  FrameCoprocessor_v1_0_bfm_1_master_0_0 master_0
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
