// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (lin64) Build 2708876 Wed Nov  6 21:39:14 MST 2019
// Date        : Mon Jun 15 20:20:18 2020
// Host        : ubuntu running 64-bit Ubuntu 18.04.4 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/rpease/PYNQProjects/SimpleLogicModule/SimpleLogicModuleFPGAImplementation/SimpleLogicModuleFPGAImplementation.srcs/sources_1/bd/SimpleLogicModuleFPGAImplementationDesign/ip/SimpleLogicModuleFPGAImplementationDesign_SimpleLogicModuleAXI_0_0/SimpleLogicModuleFPGAImplementationDesign_SimpleLogicModuleAXI_0_0_sim_netlist.v
// Design      : SimpleLogicModuleFPGAImplementationDesign_SimpleLogicModuleAXI_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "SimpleLogicModuleFPGAImplementationDesign_SimpleLogicModuleAXI_0_0,SimpleLogicModuleAXIIP_v1_0,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "SimpleLogicModuleAXIIP_v1_0,Vivado 2019.2" *) 
(* NotValidForBitStream *)
module SimpleLogicModuleFPGAImplementationDesign_SimpleLogicModuleAXI_0_0
   (s00_axi_awaddr,
    s00_axi_awprot,
    s00_axi_awvalid,
    s00_axi_awready,
    s00_axi_wdata,
    s00_axi_wstrb,
    s00_axi_wvalid,
    s00_axi_wready,
    s00_axi_bresp,
    s00_axi_bvalid,
    s00_axi_bready,
    s00_axi_araddr,
    s00_axi_arprot,
    s00_axi_arvalid,
    s00_axi_arready,
    s00_axi_rdata,
    s00_axi_rresp,
    s00_axi_rvalid,
    s00_axi_rready,
    s00_axi_aclk,
    s00_axi_aresetn);
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWADDR" *) input [4:0]s00_axi_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWPROT" *) input [2:0]s00_axi_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWVALID" *) input s00_axi_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWREADY" *) output s00_axi_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WDATA" *) input [31:0]s00_axi_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WSTRB" *) input [3:0]s00_axi_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WVALID" *) input s00_axi_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WREADY" *) output s00_axi_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI BRESP" *) output [1:0]s00_axi_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI BVALID" *) output s00_axi_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI BREADY" *) input s00_axi_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARADDR" *) input [4:0]s00_axi_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARPROT" *) input [2:0]s00_axi_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARVALID" *) input s00_axi_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARREADY" *) output s00_axi_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RDATA" *) output [31:0]s00_axi_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RRESP" *) output [1:0]s00_axi_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RVALID" *) output s00_axi_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RREADY" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXI, WIZ_DATA_WIDTH 32, WIZ_NUM_REG 8, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 5, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, NUM_READ_OUTSTANDING 8, NUM_WRITE_OUTSTANDING 8, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN SimpleLogicModuleFPGAImplementationDesign_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 4, NUM_WRITE_THREADS 4, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input s00_axi_rready;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 S00_AXI_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXI_CLK, ASSOCIATED_BUSIF S00_AXI, ASSOCIATED_RESET s00_axi_aresetn, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN SimpleLogicModuleFPGAImplementationDesign_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input s00_axi_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 S00_AXI_RST RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXI_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input s00_axi_aresetn;

  wire \<const0> ;
  wire s00_axi_aclk;
  wire [4:0]s00_axi_araddr;
  wire s00_axi_aresetn;
  wire s00_axi_arready;
  wire s00_axi_arvalid;
  wire [4:0]s00_axi_awaddr;
  wire s00_axi_awready;
  wire s00_axi_awvalid;
  wire s00_axi_bready;
  wire s00_axi_bvalid;
  wire [31:0]s00_axi_rdata;
  wire s00_axi_rready;
  wire s00_axi_rvalid;
  wire [31:0]s00_axi_wdata;
  wire s00_axi_wready;
  wire [3:0]s00_axi_wstrb;
  wire s00_axi_wvalid;

  assign s00_axi_bresp[1] = \<const0> ;
  assign s00_axi_bresp[0] = \<const0> ;
  assign s00_axi_rresp[1] = \<const0> ;
  assign s00_axi_rresp[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  SimpleLogicModuleFPGAImplementationDesign_SimpleLogicModuleAXI_0_0_SimpleLogicModuleAXIIP_v1_0 inst
       (.S_AXI_ARREADY(s00_axi_arready),
        .S_AXI_AWREADY(s00_axi_awready),
        .S_AXI_WREADY(s00_axi_wready),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_araddr(s00_axi_araddr[4:2]),
        .s00_axi_aresetn(s00_axi_aresetn),
        .s00_axi_arvalid(s00_axi_arvalid),
        .s00_axi_awaddr(s00_axi_awaddr[4:2]),
        .s00_axi_awvalid(s00_axi_awvalid),
        .s00_axi_bready(s00_axi_bready),
        .s00_axi_bvalid(s00_axi_bvalid),
        .s00_axi_rdata(s00_axi_rdata),
        .s00_axi_rready(s00_axi_rready),
        .s00_axi_rvalid(s00_axi_rvalid),
        .s00_axi_wdata(s00_axi_wdata),
        .s00_axi_wstrb(s00_axi_wstrb),
        .s00_axi_wvalid(s00_axi_wvalid));
endmodule

(* ORIG_REF_NAME = "SimpleLogicModule" *) 
module SimpleLogicModuleFPGAImplementationDesign_SimpleLogicModuleAXI_0_0_SimpleLogicModule
   (D,
    \slv_reg0_reg[30] ,
    Q,
    S,
    \slv_reg3_reg[31] ,
    \slv_reg2_reg[27] );
  output [31:0]D;
  output [31:0]\slv_reg0_reg[30] ;
  input [30:0]Q;
  input [3:0]S;
  input [3:0]\slv_reg3_reg[31] ;
  input [27:0]\slv_reg2_reg[27] ;

  wire [31:0]D;
  wire [30:0]Q;
  wire [3:0]S;
  wire difference_carry__0_i_1_n_0;
  wire difference_carry__0_i_2_n_0;
  wire difference_carry__0_i_3_n_0;
  wire difference_carry__0_i_4_n_0;
  wire difference_carry__0_n_0;
  wire difference_carry__0_n_1;
  wire difference_carry__0_n_2;
  wire difference_carry__0_n_3;
  wire difference_carry__1_i_1_n_0;
  wire difference_carry__1_i_2_n_0;
  wire difference_carry__1_i_3_n_0;
  wire difference_carry__1_i_4_n_0;
  wire difference_carry__1_n_0;
  wire difference_carry__1_n_1;
  wire difference_carry__1_n_2;
  wire difference_carry__1_n_3;
  wire difference_carry__2_i_1_n_0;
  wire difference_carry__2_i_2_n_0;
  wire difference_carry__2_i_3_n_0;
  wire difference_carry__2_i_4_n_0;
  wire difference_carry__2_n_0;
  wire difference_carry__2_n_1;
  wire difference_carry__2_n_2;
  wire difference_carry__2_n_3;
  wire difference_carry__3_i_1_n_0;
  wire difference_carry__3_i_2_n_0;
  wire difference_carry__3_i_3_n_0;
  wire difference_carry__3_i_4_n_0;
  wire difference_carry__3_n_0;
  wire difference_carry__3_n_1;
  wire difference_carry__3_n_2;
  wire difference_carry__3_n_3;
  wire difference_carry__4_i_1_n_0;
  wire difference_carry__4_i_2_n_0;
  wire difference_carry__4_i_3_n_0;
  wire difference_carry__4_i_4_n_0;
  wire difference_carry__4_n_0;
  wire difference_carry__4_n_1;
  wire difference_carry__4_n_2;
  wire difference_carry__4_n_3;
  wire difference_carry__5_i_1_n_0;
  wire difference_carry__5_i_2_n_0;
  wire difference_carry__5_i_3_n_0;
  wire difference_carry__5_i_4_n_0;
  wire difference_carry__5_n_0;
  wire difference_carry__5_n_1;
  wire difference_carry__5_n_2;
  wire difference_carry__5_n_3;
  wire difference_carry__6_n_1;
  wire difference_carry__6_n_2;
  wire difference_carry__6_n_3;
  wire difference_carry_i_1_n_0;
  wire difference_carry_i_2_n_0;
  wire difference_carry_i_3_n_0;
  wire difference_carry_i_4_n_0;
  wire difference_carry_n_0;
  wire difference_carry_n_1;
  wire difference_carry_n_2;
  wire difference_carry_n_3;
  wire [31:0]\slv_reg0_reg[30] ;
  wire [27:0]\slv_reg2_reg[27] ;
  wire [3:0]\slv_reg3_reg[31] ;
  wire sum_carry__0_i_1_n_0;
  wire sum_carry__0_i_2_n_0;
  wire sum_carry__0_i_3_n_0;
  wire sum_carry__0_i_4_n_0;
  wire sum_carry__0_n_0;
  wire sum_carry__0_n_1;
  wire sum_carry__0_n_2;
  wire sum_carry__0_n_3;
  wire sum_carry__1_i_1_n_0;
  wire sum_carry__1_i_2_n_0;
  wire sum_carry__1_i_3_n_0;
  wire sum_carry__1_i_4_n_0;
  wire sum_carry__1_n_0;
  wire sum_carry__1_n_1;
  wire sum_carry__1_n_2;
  wire sum_carry__1_n_3;
  wire sum_carry__2_i_1_n_0;
  wire sum_carry__2_i_2_n_0;
  wire sum_carry__2_i_3_n_0;
  wire sum_carry__2_i_4_n_0;
  wire sum_carry__2_n_0;
  wire sum_carry__2_n_1;
  wire sum_carry__2_n_2;
  wire sum_carry__2_n_3;
  wire sum_carry__3_i_1_n_0;
  wire sum_carry__3_i_2_n_0;
  wire sum_carry__3_i_3_n_0;
  wire sum_carry__3_i_4_n_0;
  wire sum_carry__3_n_0;
  wire sum_carry__3_n_1;
  wire sum_carry__3_n_2;
  wire sum_carry__3_n_3;
  wire sum_carry__4_i_1_n_0;
  wire sum_carry__4_i_2_n_0;
  wire sum_carry__4_i_3_n_0;
  wire sum_carry__4_i_4_n_0;
  wire sum_carry__4_n_0;
  wire sum_carry__4_n_1;
  wire sum_carry__4_n_2;
  wire sum_carry__4_n_3;
  wire sum_carry__5_i_1_n_0;
  wire sum_carry__5_i_2_n_0;
  wire sum_carry__5_i_3_n_0;
  wire sum_carry__5_i_4_n_0;
  wire sum_carry__5_n_0;
  wire sum_carry__5_n_1;
  wire sum_carry__5_n_2;
  wire sum_carry__5_n_3;
  wire sum_carry__6_n_1;
  wire sum_carry__6_n_2;
  wire sum_carry__6_n_3;
  wire sum_carry_i_1_n_0;
  wire sum_carry_i_2_n_0;
  wire sum_carry_i_3_n_0;
  wire sum_carry_i_4_n_0;
  wire sum_carry_n_0;
  wire sum_carry_n_1;
  wire sum_carry_n_2;
  wire sum_carry_n_3;
  wire [3:3]NLW_difference_carry__6_CO_UNCONNECTED;
  wire [3:3]NLW_sum_carry__6_CO_UNCONNECTED;

  CARRY4 difference_carry
       (.CI(1'b0),
        .CO({difference_carry_n_0,difference_carry_n_1,difference_carry_n_2,difference_carry_n_3}),
        .CYINIT(1'b1),
        .DI(Q[3:0]),
        .O(\slv_reg0_reg[30] [3:0]),
        .S({difference_carry_i_1_n_0,difference_carry_i_2_n_0,difference_carry_i_3_n_0,difference_carry_i_4_n_0}));
  CARRY4 difference_carry__0
       (.CI(difference_carry_n_0),
        .CO({difference_carry__0_n_0,difference_carry__0_n_1,difference_carry__0_n_2,difference_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI(Q[7:4]),
        .O(\slv_reg0_reg[30] [7:4]),
        .S({difference_carry__0_i_1_n_0,difference_carry__0_i_2_n_0,difference_carry__0_i_3_n_0,difference_carry__0_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    difference_carry__0_i_1
       (.I0(Q[7]),
        .I1(\slv_reg2_reg[27] [7]),
        .O(difference_carry__0_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    difference_carry__0_i_2
       (.I0(Q[6]),
        .I1(\slv_reg2_reg[27] [6]),
        .O(difference_carry__0_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    difference_carry__0_i_3
       (.I0(Q[5]),
        .I1(\slv_reg2_reg[27] [5]),
        .O(difference_carry__0_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    difference_carry__0_i_4
       (.I0(Q[4]),
        .I1(\slv_reg2_reg[27] [4]),
        .O(difference_carry__0_i_4_n_0));
  CARRY4 difference_carry__1
       (.CI(difference_carry__0_n_0),
        .CO({difference_carry__1_n_0,difference_carry__1_n_1,difference_carry__1_n_2,difference_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI(Q[11:8]),
        .O(\slv_reg0_reg[30] [11:8]),
        .S({difference_carry__1_i_1_n_0,difference_carry__1_i_2_n_0,difference_carry__1_i_3_n_0,difference_carry__1_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    difference_carry__1_i_1
       (.I0(Q[11]),
        .I1(\slv_reg2_reg[27] [11]),
        .O(difference_carry__1_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    difference_carry__1_i_2
       (.I0(Q[10]),
        .I1(\slv_reg2_reg[27] [10]),
        .O(difference_carry__1_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    difference_carry__1_i_3
       (.I0(Q[9]),
        .I1(\slv_reg2_reg[27] [9]),
        .O(difference_carry__1_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    difference_carry__1_i_4
       (.I0(Q[8]),
        .I1(\slv_reg2_reg[27] [8]),
        .O(difference_carry__1_i_4_n_0));
  CARRY4 difference_carry__2
       (.CI(difference_carry__1_n_0),
        .CO({difference_carry__2_n_0,difference_carry__2_n_1,difference_carry__2_n_2,difference_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI(Q[15:12]),
        .O(\slv_reg0_reg[30] [15:12]),
        .S({difference_carry__2_i_1_n_0,difference_carry__2_i_2_n_0,difference_carry__2_i_3_n_0,difference_carry__2_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    difference_carry__2_i_1
       (.I0(Q[15]),
        .I1(\slv_reg2_reg[27] [15]),
        .O(difference_carry__2_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    difference_carry__2_i_2
       (.I0(Q[14]),
        .I1(\slv_reg2_reg[27] [14]),
        .O(difference_carry__2_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    difference_carry__2_i_3
       (.I0(Q[13]),
        .I1(\slv_reg2_reg[27] [13]),
        .O(difference_carry__2_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    difference_carry__2_i_4
       (.I0(Q[12]),
        .I1(\slv_reg2_reg[27] [12]),
        .O(difference_carry__2_i_4_n_0));
  CARRY4 difference_carry__3
       (.CI(difference_carry__2_n_0),
        .CO({difference_carry__3_n_0,difference_carry__3_n_1,difference_carry__3_n_2,difference_carry__3_n_3}),
        .CYINIT(1'b0),
        .DI(Q[19:16]),
        .O(\slv_reg0_reg[30] [19:16]),
        .S({difference_carry__3_i_1_n_0,difference_carry__3_i_2_n_0,difference_carry__3_i_3_n_0,difference_carry__3_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    difference_carry__3_i_1
       (.I0(Q[19]),
        .I1(\slv_reg2_reg[27] [19]),
        .O(difference_carry__3_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    difference_carry__3_i_2
       (.I0(Q[18]),
        .I1(\slv_reg2_reg[27] [18]),
        .O(difference_carry__3_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    difference_carry__3_i_3
       (.I0(Q[17]),
        .I1(\slv_reg2_reg[27] [17]),
        .O(difference_carry__3_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    difference_carry__3_i_4
       (.I0(Q[16]),
        .I1(\slv_reg2_reg[27] [16]),
        .O(difference_carry__3_i_4_n_0));
  CARRY4 difference_carry__4
       (.CI(difference_carry__3_n_0),
        .CO({difference_carry__4_n_0,difference_carry__4_n_1,difference_carry__4_n_2,difference_carry__4_n_3}),
        .CYINIT(1'b0),
        .DI(Q[23:20]),
        .O(\slv_reg0_reg[30] [23:20]),
        .S({difference_carry__4_i_1_n_0,difference_carry__4_i_2_n_0,difference_carry__4_i_3_n_0,difference_carry__4_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    difference_carry__4_i_1
       (.I0(Q[23]),
        .I1(\slv_reg2_reg[27] [23]),
        .O(difference_carry__4_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    difference_carry__4_i_2
       (.I0(Q[22]),
        .I1(\slv_reg2_reg[27] [22]),
        .O(difference_carry__4_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    difference_carry__4_i_3
       (.I0(Q[21]),
        .I1(\slv_reg2_reg[27] [21]),
        .O(difference_carry__4_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    difference_carry__4_i_4
       (.I0(Q[20]),
        .I1(\slv_reg2_reg[27] [20]),
        .O(difference_carry__4_i_4_n_0));
  CARRY4 difference_carry__5
       (.CI(difference_carry__4_n_0),
        .CO({difference_carry__5_n_0,difference_carry__5_n_1,difference_carry__5_n_2,difference_carry__5_n_3}),
        .CYINIT(1'b0),
        .DI(Q[27:24]),
        .O(\slv_reg0_reg[30] [27:24]),
        .S({difference_carry__5_i_1_n_0,difference_carry__5_i_2_n_0,difference_carry__5_i_3_n_0,difference_carry__5_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    difference_carry__5_i_1
       (.I0(Q[27]),
        .I1(\slv_reg2_reg[27] [27]),
        .O(difference_carry__5_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    difference_carry__5_i_2
       (.I0(Q[26]),
        .I1(\slv_reg2_reg[27] [26]),
        .O(difference_carry__5_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    difference_carry__5_i_3
       (.I0(Q[25]),
        .I1(\slv_reg2_reg[27] [25]),
        .O(difference_carry__5_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    difference_carry__5_i_4
       (.I0(Q[24]),
        .I1(\slv_reg2_reg[27] [24]),
        .O(difference_carry__5_i_4_n_0));
  CARRY4 difference_carry__6
       (.CI(difference_carry__5_n_0),
        .CO({NLW_difference_carry__6_CO_UNCONNECTED[3],difference_carry__6_n_1,difference_carry__6_n_2,difference_carry__6_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,Q[30:28]}),
        .O(\slv_reg0_reg[30] [31:28]),
        .S(\slv_reg3_reg[31] ));
  LUT2 #(
    .INIT(4'h9)) 
    difference_carry_i_1
       (.I0(Q[3]),
        .I1(\slv_reg2_reg[27] [3]),
        .O(difference_carry_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    difference_carry_i_2
       (.I0(Q[2]),
        .I1(\slv_reg2_reg[27] [2]),
        .O(difference_carry_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    difference_carry_i_3
       (.I0(Q[1]),
        .I1(\slv_reg2_reg[27] [1]),
        .O(difference_carry_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    difference_carry_i_4
       (.I0(Q[0]),
        .I1(\slv_reg2_reg[27] [0]),
        .O(difference_carry_i_4_n_0));
  CARRY4 sum_carry
       (.CI(1'b0),
        .CO({sum_carry_n_0,sum_carry_n_1,sum_carry_n_2,sum_carry_n_3}),
        .CYINIT(1'b0),
        .DI(Q[3:0]),
        .O(D[3:0]),
        .S({sum_carry_i_1_n_0,sum_carry_i_2_n_0,sum_carry_i_3_n_0,sum_carry_i_4_n_0}));
  CARRY4 sum_carry__0
       (.CI(sum_carry_n_0),
        .CO({sum_carry__0_n_0,sum_carry__0_n_1,sum_carry__0_n_2,sum_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI(Q[7:4]),
        .O(D[7:4]),
        .S({sum_carry__0_i_1_n_0,sum_carry__0_i_2_n_0,sum_carry__0_i_3_n_0,sum_carry__0_i_4_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    sum_carry__0_i_1
       (.I0(Q[7]),
        .I1(\slv_reg2_reg[27] [7]),
        .O(sum_carry__0_i_1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sum_carry__0_i_2
       (.I0(Q[6]),
        .I1(\slv_reg2_reg[27] [6]),
        .O(sum_carry__0_i_2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sum_carry__0_i_3
       (.I0(Q[5]),
        .I1(\slv_reg2_reg[27] [5]),
        .O(sum_carry__0_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sum_carry__0_i_4
       (.I0(Q[4]),
        .I1(\slv_reg2_reg[27] [4]),
        .O(sum_carry__0_i_4_n_0));
  CARRY4 sum_carry__1
       (.CI(sum_carry__0_n_0),
        .CO({sum_carry__1_n_0,sum_carry__1_n_1,sum_carry__1_n_2,sum_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI(Q[11:8]),
        .O(D[11:8]),
        .S({sum_carry__1_i_1_n_0,sum_carry__1_i_2_n_0,sum_carry__1_i_3_n_0,sum_carry__1_i_4_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    sum_carry__1_i_1
       (.I0(Q[11]),
        .I1(\slv_reg2_reg[27] [11]),
        .O(sum_carry__1_i_1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sum_carry__1_i_2
       (.I0(Q[10]),
        .I1(\slv_reg2_reg[27] [10]),
        .O(sum_carry__1_i_2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sum_carry__1_i_3
       (.I0(Q[9]),
        .I1(\slv_reg2_reg[27] [9]),
        .O(sum_carry__1_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sum_carry__1_i_4
       (.I0(Q[8]),
        .I1(\slv_reg2_reg[27] [8]),
        .O(sum_carry__1_i_4_n_0));
  CARRY4 sum_carry__2
       (.CI(sum_carry__1_n_0),
        .CO({sum_carry__2_n_0,sum_carry__2_n_1,sum_carry__2_n_2,sum_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI(Q[15:12]),
        .O(D[15:12]),
        .S({sum_carry__2_i_1_n_0,sum_carry__2_i_2_n_0,sum_carry__2_i_3_n_0,sum_carry__2_i_4_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    sum_carry__2_i_1
       (.I0(Q[15]),
        .I1(\slv_reg2_reg[27] [15]),
        .O(sum_carry__2_i_1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sum_carry__2_i_2
       (.I0(Q[14]),
        .I1(\slv_reg2_reg[27] [14]),
        .O(sum_carry__2_i_2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sum_carry__2_i_3
       (.I0(Q[13]),
        .I1(\slv_reg2_reg[27] [13]),
        .O(sum_carry__2_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sum_carry__2_i_4
       (.I0(Q[12]),
        .I1(\slv_reg2_reg[27] [12]),
        .O(sum_carry__2_i_4_n_0));
  CARRY4 sum_carry__3
       (.CI(sum_carry__2_n_0),
        .CO({sum_carry__3_n_0,sum_carry__3_n_1,sum_carry__3_n_2,sum_carry__3_n_3}),
        .CYINIT(1'b0),
        .DI(Q[19:16]),
        .O(D[19:16]),
        .S({sum_carry__3_i_1_n_0,sum_carry__3_i_2_n_0,sum_carry__3_i_3_n_0,sum_carry__3_i_4_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    sum_carry__3_i_1
       (.I0(Q[19]),
        .I1(\slv_reg2_reg[27] [19]),
        .O(sum_carry__3_i_1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sum_carry__3_i_2
       (.I0(Q[18]),
        .I1(\slv_reg2_reg[27] [18]),
        .O(sum_carry__3_i_2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sum_carry__3_i_3
       (.I0(Q[17]),
        .I1(\slv_reg2_reg[27] [17]),
        .O(sum_carry__3_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sum_carry__3_i_4
       (.I0(Q[16]),
        .I1(\slv_reg2_reg[27] [16]),
        .O(sum_carry__3_i_4_n_0));
  CARRY4 sum_carry__4
       (.CI(sum_carry__3_n_0),
        .CO({sum_carry__4_n_0,sum_carry__4_n_1,sum_carry__4_n_2,sum_carry__4_n_3}),
        .CYINIT(1'b0),
        .DI(Q[23:20]),
        .O(D[23:20]),
        .S({sum_carry__4_i_1_n_0,sum_carry__4_i_2_n_0,sum_carry__4_i_3_n_0,sum_carry__4_i_4_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    sum_carry__4_i_1
       (.I0(Q[23]),
        .I1(\slv_reg2_reg[27] [23]),
        .O(sum_carry__4_i_1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sum_carry__4_i_2
       (.I0(Q[22]),
        .I1(\slv_reg2_reg[27] [22]),
        .O(sum_carry__4_i_2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sum_carry__4_i_3
       (.I0(Q[21]),
        .I1(\slv_reg2_reg[27] [21]),
        .O(sum_carry__4_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sum_carry__4_i_4
       (.I0(Q[20]),
        .I1(\slv_reg2_reg[27] [20]),
        .O(sum_carry__4_i_4_n_0));
  CARRY4 sum_carry__5
       (.CI(sum_carry__4_n_0),
        .CO({sum_carry__5_n_0,sum_carry__5_n_1,sum_carry__5_n_2,sum_carry__5_n_3}),
        .CYINIT(1'b0),
        .DI(Q[27:24]),
        .O(D[27:24]),
        .S({sum_carry__5_i_1_n_0,sum_carry__5_i_2_n_0,sum_carry__5_i_3_n_0,sum_carry__5_i_4_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    sum_carry__5_i_1
       (.I0(Q[27]),
        .I1(\slv_reg2_reg[27] [27]),
        .O(sum_carry__5_i_1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sum_carry__5_i_2
       (.I0(Q[26]),
        .I1(\slv_reg2_reg[27] [26]),
        .O(sum_carry__5_i_2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sum_carry__5_i_3
       (.I0(Q[25]),
        .I1(\slv_reg2_reg[27] [25]),
        .O(sum_carry__5_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sum_carry__5_i_4
       (.I0(Q[24]),
        .I1(\slv_reg2_reg[27] [24]),
        .O(sum_carry__5_i_4_n_0));
  CARRY4 sum_carry__6
       (.CI(sum_carry__5_n_0),
        .CO({NLW_sum_carry__6_CO_UNCONNECTED[3],sum_carry__6_n_1,sum_carry__6_n_2,sum_carry__6_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,Q[30:28]}),
        .O(D[31:28]),
        .S(S));
  LUT2 #(
    .INIT(4'h6)) 
    sum_carry_i_1
       (.I0(Q[3]),
        .I1(\slv_reg2_reg[27] [3]),
        .O(sum_carry_i_1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sum_carry_i_2
       (.I0(Q[2]),
        .I1(\slv_reg2_reg[27] [2]),
        .O(sum_carry_i_2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sum_carry_i_3
       (.I0(Q[1]),
        .I1(\slv_reg2_reg[27] [1]),
        .O(sum_carry_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sum_carry_i_4
       (.I0(Q[0]),
        .I1(\slv_reg2_reg[27] [0]),
        .O(sum_carry_i_4_n_0));
endmodule

(* ORIG_REF_NAME = "SimpleLogicModuleAXIIP_v1_0" *) 
module SimpleLogicModuleFPGAImplementationDesign_SimpleLogicModuleAXI_0_0_SimpleLogicModuleAXIIP_v1_0
   (S_AXI_AWREADY,
    S_AXI_WREADY,
    S_AXI_ARREADY,
    s00_axi_rdata,
    s00_axi_rvalid,
    s00_axi_bvalid,
    s00_axi_awaddr,
    s00_axi_wvalid,
    s00_axi_awvalid,
    s00_axi_aclk,
    s00_axi_wdata,
    s00_axi_araddr,
    s00_axi_arvalid,
    s00_axi_wstrb,
    s00_axi_aresetn,
    s00_axi_bready,
    s00_axi_rready);
  output S_AXI_AWREADY;
  output S_AXI_WREADY;
  output S_AXI_ARREADY;
  output [31:0]s00_axi_rdata;
  output s00_axi_rvalid;
  output s00_axi_bvalid;
  input [2:0]s00_axi_awaddr;
  input s00_axi_wvalid;
  input s00_axi_awvalid;
  input s00_axi_aclk;
  input [31:0]s00_axi_wdata;
  input [2:0]s00_axi_araddr;
  input s00_axi_arvalid;
  input [3:0]s00_axi_wstrb;
  input s00_axi_aresetn;
  input s00_axi_bready;
  input s00_axi_rready;

  wire S_AXI_ARREADY;
  wire S_AXI_AWREADY;
  wire S_AXI_WREADY;
  wire s00_axi_aclk;
  wire [2:0]s00_axi_araddr;
  wire s00_axi_aresetn;
  wire s00_axi_arvalid;
  wire [2:0]s00_axi_awaddr;
  wire s00_axi_awvalid;
  wire s00_axi_bready;
  wire s00_axi_bvalid;
  wire [31:0]s00_axi_rdata;
  wire s00_axi_rready;
  wire s00_axi_rvalid;
  wire [31:0]s00_axi_wdata;
  wire [3:0]s00_axi_wstrb;
  wire s00_axi_wvalid;

  SimpleLogicModuleFPGAImplementationDesign_SimpleLogicModuleAXI_0_0_SimpleLogicModuleAXIIP_v1_0_S00_AXI SimpleLogicModuleAXIIP_v1_0_S00_AXI_inst
       (.S_AXI_ARREADY(S_AXI_ARREADY),
        .S_AXI_AWREADY(S_AXI_AWREADY),
        .S_AXI_WREADY(S_AXI_WREADY),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_araddr(s00_axi_araddr),
        .s00_axi_aresetn(s00_axi_aresetn),
        .s00_axi_arvalid(s00_axi_arvalid),
        .s00_axi_awaddr(s00_axi_awaddr),
        .s00_axi_awvalid(s00_axi_awvalid),
        .s00_axi_bready(s00_axi_bready),
        .s00_axi_bvalid(s00_axi_bvalid),
        .s00_axi_rdata(s00_axi_rdata),
        .s00_axi_rready(s00_axi_rready),
        .s00_axi_rvalid(s00_axi_rvalid),
        .s00_axi_wdata(s00_axi_wdata),
        .s00_axi_wstrb(s00_axi_wstrb),
        .s00_axi_wvalid(s00_axi_wvalid));
endmodule

(* ORIG_REF_NAME = "SimpleLogicModuleAXIIP_v1_0_S00_AXI" *) 
module SimpleLogicModuleFPGAImplementationDesign_SimpleLogicModuleAXI_0_0_SimpleLogicModuleAXIIP_v1_0_S00_AXI
   (S_AXI_AWREADY,
    S_AXI_WREADY,
    S_AXI_ARREADY,
    s00_axi_rdata,
    s00_axi_rvalid,
    s00_axi_bvalid,
    s00_axi_awaddr,
    s00_axi_wvalid,
    s00_axi_awvalid,
    s00_axi_aclk,
    s00_axi_wdata,
    s00_axi_araddr,
    s00_axi_arvalid,
    s00_axi_wstrb,
    s00_axi_aresetn,
    s00_axi_bready,
    s00_axi_rready);
  output S_AXI_AWREADY;
  output S_AXI_WREADY;
  output S_AXI_ARREADY;
  output [31:0]s00_axi_rdata;
  output s00_axi_rvalid;
  output s00_axi_bvalid;
  input [2:0]s00_axi_awaddr;
  input s00_axi_wvalid;
  input s00_axi_awvalid;
  input s00_axi_aclk;
  input [31:0]s00_axi_wdata;
  input [2:0]s00_axi_araddr;
  input s00_axi_arvalid;
  input [3:0]s00_axi_wstrb;
  input s00_axi_aresetn;
  input s00_axi_bready;
  input s00_axi_rready;

  wire S_AXI_ARREADY;
  wire S_AXI_AWREADY;
  wire S_AXI_WREADY;
  wire aw_en_i_1_n_0;
  wire aw_en_reg_n_0;
  wire \axi_araddr[2]_i_1_n_0 ;
  wire \axi_araddr[3]_i_1_n_0 ;
  wire \axi_araddr[4]_i_1_n_0 ;
  wire axi_arready0;
  wire \axi_awaddr[2]_i_1_n_0 ;
  wire \axi_awaddr[3]_i_1_n_0 ;
  wire \axi_awaddr[4]_i_1_n_0 ;
  wire \axi_awaddr_reg_n_0_[4] ;
  wire axi_awready0;
  wire axi_awready_i_1_n_0;
  wire axi_bvalid_i_1_n_0;
  wire \axi_rdata[0]_i_2_n_0 ;
  wire \axi_rdata[0]_i_3_n_0 ;
  wire \axi_rdata[10]_i_2_n_0 ;
  wire \axi_rdata[10]_i_3_n_0 ;
  wire \axi_rdata[11]_i_2_n_0 ;
  wire \axi_rdata[11]_i_3_n_0 ;
  wire \axi_rdata[12]_i_2_n_0 ;
  wire \axi_rdata[12]_i_3_n_0 ;
  wire \axi_rdata[13]_i_2_n_0 ;
  wire \axi_rdata[13]_i_3_n_0 ;
  wire \axi_rdata[14]_i_2_n_0 ;
  wire \axi_rdata[14]_i_3_n_0 ;
  wire \axi_rdata[15]_i_2_n_0 ;
  wire \axi_rdata[15]_i_3_n_0 ;
  wire \axi_rdata[16]_i_2_n_0 ;
  wire \axi_rdata[16]_i_3_n_0 ;
  wire \axi_rdata[17]_i_2_n_0 ;
  wire \axi_rdata[17]_i_3_n_0 ;
  wire \axi_rdata[18]_i_2_n_0 ;
  wire \axi_rdata[18]_i_3_n_0 ;
  wire \axi_rdata[19]_i_2_n_0 ;
  wire \axi_rdata[19]_i_3_n_0 ;
  wire \axi_rdata[1]_i_2_n_0 ;
  wire \axi_rdata[1]_i_3_n_0 ;
  wire \axi_rdata[20]_i_2_n_0 ;
  wire \axi_rdata[20]_i_3_n_0 ;
  wire \axi_rdata[21]_i_2_n_0 ;
  wire \axi_rdata[21]_i_3_n_0 ;
  wire \axi_rdata[22]_i_2_n_0 ;
  wire \axi_rdata[22]_i_3_n_0 ;
  wire \axi_rdata[23]_i_2_n_0 ;
  wire \axi_rdata[23]_i_3_n_0 ;
  wire \axi_rdata[24]_i_2_n_0 ;
  wire \axi_rdata[24]_i_3_n_0 ;
  wire \axi_rdata[25]_i_2_n_0 ;
  wire \axi_rdata[25]_i_3_n_0 ;
  wire \axi_rdata[26]_i_2_n_0 ;
  wire \axi_rdata[26]_i_3_n_0 ;
  wire \axi_rdata[27]_i_2_n_0 ;
  wire \axi_rdata[27]_i_3_n_0 ;
  wire \axi_rdata[28]_i_2_n_0 ;
  wire \axi_rdata[28]_i_3_n_0 ;
  wire \axi_rdata[29]_i_2_n_0 ;
  wire \axi_rdata[29]_i_3_n_0 ;
  wire \axi_rdata[2]_i_2_n_0 ;
  wire \axi_rdata[2]_i_3_n_0 ;
  wire \axi_rdata[30]_i_2_n_0 ;
  wire \axi_rdata[30]_i_3_n_0 ;
  wire \axi_rdata[31]_i_2_n_0 ;
  wire \axi_rdata[31]_i_3_n_0 ;
  wire \axi_rdata[3]_i_2_n_0 ;
  wire \axi_rdata[3]_i_3_n_0 ;
  wire \axi_rdata[4]_i_2_n_0 ;
  wire \axi_rdata[4]_i_3_n_0 ;
  wire \axi_rdata[5]_i_2_n_0 ;
  wire \axi_rdata[5]_i_3_n_0 ;
  wire \axi_rdata[6]_i_2_n_0 ;
  wire \axi_rdata[6]_i_3_n_0 ;
  wire \axi_rdata[7]_i_2_n_0 ;
  wire \axi_rdata[7]_i_3_n_0 ;
  wire \axi_rdata[8]_i_2_n_0 ;
  wire \axi_rdata[8]_i_3_n_0 ;
  wire \axi_rdata[9]_i_2_n_0 ;
  wire \axi_rdata[9]_i_3_n_0 ;
  wire axi_rvalid_i_1_n_0;
  wire axi_wready0;
  wire [31:0]bitwiseAnd;
  wire [31:0]bitwiseOr;
  wire [31:0]bitwiseXNor;
  wire [31:0]bitwiseXor;
  wire [31:0]difference;
  wire difference_carry__6_i_1_n_0;
  wire difference_carry__6_i_2_n_0;
  wire difference_carry__6_i_3_n_0;
  wire difference_carry__6_i_4_n_0;
  wire p_0_in;
  wire p_0_in0;
  wire [31:7]p_1_in;
  wire [31:0]reg_data_out;
  wire s00_axi_aclk;
  wire [2:0]s00_axi_araddr;
  wire s00_axi_aresetn;
  wire s00_axi_arvalid;
  wire [2:0]s00_axi_awaddr;
  wire s00_axi_awvalid;
  wire s00_axi_bready;
  wire s00_axi_bvalid;
  wire [31:0]s00_axi_rdata;
  wire s00_axi_rready;
  wire s00_axi_rvalid;
  wire [31:0]s00_axi_wdata;
  wire [3:0]s00_axi_wstrb;
  wire s00_axi_wvalid;
  wire [2:0]sel0;
  wire [31:0]slv_reg0;
  wire [31:0]slv_reg1;
  wire \slv_reg1[15]_i_1_n_0 ;
  wire \slv_reg1[23]_i_1_n_0 ;
  wire \slv_reg1[31]_i_1_n_0 ;
  wire \slv_reg1[7]_i_1_n_0 ;
  wire [31:0]slv_reg2;
  wire [31:0]slv_reg3;
  wire [31:0]slv_reg4;
  wire [31:0]slv_reg5;
  wire [31:0]slv_reg6;
  wire [31:0]slv_reg7;
  wire slv_reg_rden__0;
  wire slv_reg_wren__0;
  wire [31:0]sum;
  wire sum_carry__6_i_1_n_0;
  wire sum_carry__6_i_2_n_0;
  wire sum_carry__6_i_3_n_0;
  wire sum_carry__6_i_4_n_0;

  SimpleLogicModuleFPGAImplementationDesign_SimpleLogicModuleAXI_0_0_SimpleLogicModule SimpleLogicModule_inst
       (.D(sum),
        .Q(slv_reg0[30:0]),
        .S({sum_carry__6_i_1_n_0,sum_carry__6_i_2_n_0,sum_carry__6_i_3_n_0,sum_carry__6_i_4_n_0}),
        .\slv_reg0_reg[30] (difference),
        .\slv_reg2_reg[27] (slv_reg1[27:0]),
        .\slv_reg3_reg[31] ({difference_carry__6_i_1_n_0,difference_carry__6_i_2_n_0,difference_carry__6_i_3_n_0,difference_carry__6_i_4_n_0}));
  LUT6 #(
    .INIT(64'hF7FFC4CCC4CCC4CC)) 
    aw_en_i_1
       (.I0(s00_axi_awvalid),
        .I1(aw_en_reg_n_0),
        .I2(S_AXI_AWREADY),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_bready),
        .I5(s00_axi_bvalid),
        .O(aw_en_i_1_n_0));
  FDSE aw_en_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(aw_en_i_1_n_0),
        .Q(aw_en_reg_n_0),
        .S(axi_awready_i_1_n_0));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_araddr[2]_i_1 
       (.I0(s00_axi_araddr[0]),
        .I1(s00_axi_arvalid),
        .I2(S_AXI_ARREADY),
        .I3(sel0[0]),
        .O(\axi_araddr[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_araddr[3]_i_1 
       (.I0(s00_axi_araddr[1]),
        .I1(s00_axi_arvalid),
        .I2(S_AXI_ARREADY),
        .I3(sel0[1]),
        .O(\axi_araddr[3]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_araddr[4]_i_1 
       (.I0(s00_axi_araddr[2]),
        .I1(s00_axi_arvalid),
        .I2(S_AXI_ARREADY),
        .I3(sel0[2]),
        .O(\axi_araddr[4]_i_1_n_0 ));
  FDRE \axi_araddr_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\axi_araddr[2]_i_1_n_0 ),
        .Q(sel0[0]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_araddr_reg[3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\axi_araddr[3]_i_1_n_0 ),
        .Q(sel0[1]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_araddr_reg[4] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\axi_araddr[4]_i_1_n_0 ),
        .Q(sel0[2]),
        .R(axi_awready_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h2)) 
    axi_arready_i_1
       (.I0(s00_axi_arvalid),
        .I1(S_AXI_ARREADY),
        .O(axi_arready0));
  FDRE axi_arready_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_arready0),
        .Q(S_AXI_ARREADY),
        .R(axi_awready_i_1_n_0));
  LUT6 #(
    .INIT(64'hFBFFFFFF08000000)) 
    \axi_awaddr[2]_i_1 
       (.I0(s00_axi_awaddr[0]),
        .I1(s00_axi_wvalid),
        .I2(S_AXI_AWREADY),
        .I3(aw_en_reg_n_0),
        .I4(s00_axi_awvalid),
        .I5(p_0_in),
        .O(\axi_awaddr[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFBFFFFFF08000000)) 
    \axi_awaddr[3]_i_1 
       (.I0(s00_axi_awaddr[1]),
        .I1(s00_axi_wvalid),
        .I2(S_AXI_AWREADY),
        .I3(aw_en_reg_n_0),
        .I4(s00_axi_awvalid),
        .I5(p_0_in0),
        .O(\axi_awaddr[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFBFFFFFF08000000)) 
    \axi_awaddr[4]_i_1 
       (.I0(s00_axi_awaddr[2]),
        .I1(s00_axi_wvalid),
        .I2(S_AXI_AWREADY),
        .I3(aw_en_reg_n_0),
        .I4(s00_axi_awvalid),
        .I5(\axi_awaddr_reg_n_0_[4] ),
        .O(\axi_awaddr[4]_i_1_n_0 ));
  FDRE \axi_awaddr_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\axi_awaddr[2]_i_1_n_0 ),
        .Q(p_0_in),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_awaddr_reg[3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\axi_awaddr[3]_i_1_n_0 ),
        .Q(p_0_in0),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_awaddr_reg[4] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\axi_awaddr[4]_i_1_n_0 ),
        .Q(\axi_awaddr_reg_n_0_[4] ),
        .R(axi_awready_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    axi_awready_i_1
       (.I0(s00_axi_aresetn),
        .O(axi_awready_i_1_n_0));
  LUT4 #(
    .INIT(16'h2000)) 
    axi_awready_i_2
       (.I0(s00_axi_wvalid),
        .I1(S_AXI_AWREADY),
        .I2(aw_en_reg_n_0),
        .I3(s00_axi_awvalid),
        .O(axi_awready0));
  FDRE axi_awready_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_awready0),
        .Q(S_AXI_AWREADY),
        .R(axi_awready_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000FFFF80008000)) 
    axi_bvalid_i_1
       (.I0(s00_axi_awvalid),
        .I1(s00_axi_wvalid),
        .I2(S_AXI_AWREADY),
        .I3(S_AXI_WREADY),
        .I4(s00_axi_bready),
        .I5(s00_axi_bvalid),
        .O(axi_bvalid_i_1_n_0));
  FDRE axi_bvalid_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_bvalid_i_1_n_0),
        .Q(s00_axi_bvalid),
        .R(axi_awready_i_1_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[0]_i_2 
       (.I0(slv_reg3[0]),
        .I1(slv_reg2[0]),
        .I2(sel0[1]),
        .I3(slv_reg1[0]),
        .I4(sel0[0]),
        .I5(slv_reg0[0]),
        .O(\axi_rdata[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[0]_i_3 
       (.I0(slv_reg7[0]),
        .I1(slv_reg6[0]),
        .I2(sel0[1]),
        .I3(slv_reg5[0]),
        .I4(sel0[0]),
        .I5(slv_reg4[0]),
        .O(\axi_rdata[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[10]_i_2 
       (.I0(slv_reg3[10]),
        .I1(slv_reg2[10]),
        .I2(sel0[1]),
        .I3(slv_reg1[10]),
        .I4(sel0[0]),
        .I5(slv_reg0[10]),
        .O(\axi_rdata[10]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[10]_i_3 
       (.I0(slv_reg7[10]),
        .I1(slv_reg6[10]),
        .I2(sel0[1]),
        .I3(slv_reg5[10]),
        .I4(sel0[0]),
        .I5(slv_reg4[10]),
        .O(\axi_rdata[10]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[11]_i_2 
       (.I0(slv_reg3[11]),
        .I1(slv_reg2[11]),
        .I2(sel0[1]),
        .I3(slv_reg1[11]),
        .I4(sel0[0]),
        .I5(slv_reg0[11]),
        .O(\axi_rdata[11]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[11]_i_3 
       (.I0(slv_reg7[11]),
        .I1(slv_reg6[11]),
        .I2(sel0[1]),
        .I3(slv_reg5[11]),
        .I4(sel0[0]),
        .I5(slv_reg4[11]),
        .O(\axi_rdata[11]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[12]_i_2 
       (.I0(slv_reg3[12]),
        .I1(slv_reg2[12]),
        .I2(sel0[1]),
        .I3(slv_reg1[12]),
        .I4(sel0[0]),
        .I5(slv_reg0[12]),
        .O(\axi_rdata[12]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[12]_i_3 
       (.I0(slv_reg7[12]),
        .I1(slv_reg6[12]),
        .I2(sel0[1]),
        .I3(slv_reg5[12]),
        .I4(sel0[0]),
        .I5(slv_reg4[12]),
        .O(\axi_rdata[12]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[13]_i_2 
       (.I0(slv_reg3[13]),
        .I1(slv_reg2[13]),
        .I2(sel0[1]),
        .I3(slv_reg1[13]),
        .I4(sel0[0]),
        .I5(slv_reg0[13]),
        .O(\axi_rdata[13]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[13]_i_3 
       (.I0(slv_reg7[13]),
        .I1(slv_reg6[13]),
        .I2(sel0[1]),
        .I3(slv_reg5[13]),
        .I4(sel0[0]),
        .I5(slv_reg4[13]),
        .O(\axi_rdata[13]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[14]_i_2 
       (.I0(slv_reg3[14]),
        .I1(slv_reg2[14]),
        .I2(sel0[1]),
        .I3(slv_reg1[14]),
        .I4(sel0[0]),
        .I5(slv_reg0[14]),
        .O(\axi_rdata[14]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[14]_i_3 
       (.I0(slv_reg7[14]),
        .I1(slv_reg6[14]),
        .I2(sel0[1]),
        .I3(slv_reg5[14]),
        .I4(sel0[0]),
        .I5(slv_reg4[14]),
        .O(\axi_rdata[14]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[15]_i_2 
       (.I0(slv_reg3[15]),
        .I1(slv_reg2[15]),
        .I2(sel0[1]),
        .I3(slv_reg1[15]),
        .I4(sel0[0]),
        .I5(slv_reg0[15]),
        .O(\axi_rdata[15]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[15]_i_3 
       (.I0(slv_reg7[15]),
        .I1(slv_reg6[15]),
        .I2(sel0[1]),
        .I3(slv_reg5[15]),
        .I4(sel0[0]),
        .I5(slv_reg4[15]),
        .O(\axi_rdata[15]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[16]_i_2 
       (.I0(slv_reg3[16]),
        .I1(slv_reg2[16]),
        .I2(sel0[1]),
        .I3(slv_reg1[16]),
        .I4(sel0[0]),
        .I5(slv_reg0[16]),
        .O(\axi_rdata[16]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[16]_i_3 
       (.I0(slv_reg7[16]),
        .I1(slv_reg6[16]),
        .I2(sel0[1]),
        .I3(slv_reg5[16]),
        .I4(sel0[0]),
        .I5(slv_reg4[16]),
        .O(\axi_rdata[16]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[17]_i_2 
       (.I0(slv_reg3[17]),
        .I1(slv_reg2[17]),
        .I2(sel0[1]),
        .I3(slv_reg1[17]),
        .I4(sel0[0]),
        .I5(slv_reg0[17]),
        .O(\axi_rdata[17]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[17]_i_3 
       (.I0(slv_reg7[17]),
        .I1(slv_reg6[17]),
        .I2(sel0[1]),
        .I3(slv_reg5[17]),
        .I4(sel0[0]),
        .I5(slv_reg4[17]),
        .O(\axi_rdata[17]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[18]_i_2 
       (.I0(slv_reg3[18]),
        .I1(slv_reg2[18]),
        .I2(sel0[1]),
        .I3(slv_reg1[18]),
        .I4(sel0[0]),
        .I5(slv_reg0[18]),
        .O(\axi_rdata[18]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[18]_i_3 
       (.I0(slv_reg7[18]),
        .I1(slv_reg6[18]),
        .I2(sel0[1]),
        .I3(slv_reg5[18]),
        .I4(sel0[0]),
        .I5(slv_reg4[18]),
        .O(\axi_rdata[18]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[19]_i_2 
       (.I0(slv_reg3[19]),
        .I1(slv_reg2[19]),
        .I2(sel0[1]),
        .I3(slv_reg1[19]),
        .I4(sel0[0]),
        .I5(slv_reg0[19]),
        .O(\axi_rdata[19]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[19]_i_3 
       (.I0(slv_reg7[19]),
        .I1(slv_reg6[19]),
        .I2(sel0[1]),
        .I3(slv_reg5[19]),
        .I4(sel0[0]),
        .I5(slv_reg4[19]),
        .O(\axi_rdata[19]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[1]_i_2 
       (.I0(slv_reg3[1]),
        .I1(slv_reg2[1]),
        .I2(sel0[1]),
        .I3(slv_reg1[1]),
        .I4(sel0[0]),
        .I5(slv_reg0[1]),
        .O(\axi_rdata[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[1]_i_3 
       (.I0(slv_reg7[1]),
        .I1(slv_reg6[1]),
        .I2(sel0[1]),
        .I3(slv_reg5[1]),
        .I4(sel0[0]),
        .I5(slv_reg4[1]),
        .O(\axi_rdata[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[20]_i_2 
       (.I0(slv_reg3[20]),
        .I1(slv_reg2[20]),
        .I2(sel0[1]),
        .I3(slv_reg1[20]),
        .I4(sel0[0]),
        .I5(slv_reg0[20]),
        .O(\axi_rdata[20]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[20]_i_3 
       (.I0(slv_reg7[20]),
        .I1(slv_reg6[20]),
        .I2(sel0[1]),
        .I3(slv_reg5[20]),
        .I4(sel0[0]),
        .I5(slv_reg4[20]),
        .O(\axi_rdata[20]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[21]_i_2 
       (.I0(slv_reg3[21]),
        .I1(slv_reg2[21]),
        .I2(sel0[1]),
        .I3(slv_reg1[21]),
        .I4(sel0[0]),
        .I5(slv_reg0[21]),
        .O(\axi_rdata[21]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[21]_i_3 
       (.I0(slv_reg7[21]),
        .I1(slv_reg6[21]),
        .I2(sel0[1]),
        .I3(slv_reg5[21]),
        .I4(sel0[0]),
        .I5(slv_reg4[21]),
        .O(\axi_rdata[21]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[22]_i_2 
       (.I0(slv_reg3[22]),
        .I1(slv_reg2[22]),
        .I2(sel0[1]),
        .I3(slv_reg1[22]),
        .I4(sel0[0]),
        .I5(slv_reg0[22]),
        .O(\axi_rdata[22]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[22]_i_3 
       (.I0(slv_reg7[22]),
        .I1(slv_reg6[22]),
        .I2(sel0[1]),
        .I3(slv_reg5[22]),
        .I4(sel0[0]),
        .I5(slv_reg4[22]),
        .O(\axi_rdata[22]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[23]_i_2 
       (.I0(slv_reg3[23]),
        .I1(slv_reg2[23]),
        .I2(sel0[1]),
        .I3(slv_reg1[23]),
        .I4(sel0[0]),
        .I5(slv_reg0[23]),
        .O(\axi_rdata[23]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[23]_i_3 
       (.I0(slv_reg7[23]),
        .I1(slv_reg6[23]),
        .I2(sel0[1]),
        .I3(slv_reg5[23]),
        .I4(sel0[0]),
        .I5(slv_reg4[23]),
        .O(\axi_rdata[23]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[24]_i_2 
       (.I0(slv_reg3[24]),
        .I1(slv_reg2[24]),
        .I2(sel0[1]),
        .I3(slv_reg1[24]),
        .I4(sel0[0]),
        .I5(slv_reg0[24]),
        .O(\axi_rdata[24]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[24]_i_3 
       (.I0(slv_reg7[24]),
        .I1(slv_reg6[24]),
        .I2(sel0[1]),
        .I3(slv_reg5[24]),
        .I4(sel0[0]),
        .I5(slv_reg4[24]),
        .O(\axi_rdata[24]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[25]_i_2 
       (.I0(slv_reg3[25]),
        .I1(slv_reg2[25]),
        .I2(sel0[1]),
        .I3(slv_reg1[25]),
        .I4(sel0[0]),
        .I5(slv_reg0[25]),
        .O(\axi_rdata[25]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[25]_i_3 
       (.I0(slv_reg7[25]),
        .I1(slv_reg6[25]),
        .I2(sel0[1]),
        .I3(slv_reg5[25]),
        .I4(sel0[0]),
        .I5(slv_reg4[25]),
        .O(\axi_rdata[25]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[26]_i_2 
       (.I0(slv_reg3[26]),
        .I1(slv_reg2[26]),
        .I2(sel0[1]),
        .I3(slv_reg1[26]),
        .I4(sel0[0]),
        .I5(slv_reg0[26]),
        .O(\axi_rdata[26]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[26]_i_3 
       (.I0(slv_reg7[26]),
        .I1(slv_reg6[26]),
        .I2(sel0[1]),
        .I3(slv_reg5[26]),
        .I4(sel0[0]),
        .I5(slv_reg4[26]),
        .O(\axi_rdata[26]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[27]_i_2 
       (.I0(slv_reg3[27]),
        .I1(slv_reg2[27]),
        .I2(sel0[1]),
        .I3(slv_reg1[27]),
        .I4(sel0[0]),
        .I5(slv_reg0[27]),
        .O(\axi_rdata[27]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[27]_i_3 
       (.I0(slv_reg7[27]),
        .I1(slv_reg6[27]),
        .I2(sel0[1]),
        .I3(slv_reg5[27]),
        .I4(sel0[0]),
        .I5(slv_reg4[27]),
        .O(\axi_rdata[27]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[28]_i_2 
       (.I0(slv_reg3[28]),
        .I1(slv_reg2[28]),
        .I2(sel0[1]),
        .I3(slv_reg1[28]),
        .I4(sel0[0]),
        .I5(slv_reg0[28]),
        .O(\axi_rdata[28]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[28]_i_3 
       (.I0(slv_reg7[28]),
        .I1(slv_reg6[28]),
        .I2(sel0[1]),
        .I3(slv_reg5[28]),
        .I4(sel0[0]),
        .I5(slv_reg4[28]),
        .O(\axi_rdata[28]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[29]_i_2 
       (.I0(slv_reg3[29]),
        .I1(slv_reg2[29]),
        .I2(sel0[1]),
        .I3(slv_reg1[29]),
        .I4(sel0[0]),
        .I5(slv_reg0[29]),
        .O(\axi_rdata[29]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[29]_i_3 
       (.I0(slv_reg7[29]),
        .I1(slv_reg6[29]),
        .I2(sel0[1]),
        .I3(slv_reg5[29]),
        .I4(sel0[0]),
        .I5(slv_reg4[29]),
        .O(\axi_rdata[29]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[2]_i_2 
       (.I0(slv_reg3[2]),
        .I1(slv_reg2[2]),
        .I2(sel0[1]),
        .I3(slv_reg1[2]),
        .I4(sel0[0]),
        .I5(slv_reg0[2]),
        .O(\axi_rdata[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[2]_i_3 
       (.I0(slv_reg7[2]),
        .I1(slv_reg6[2]),
        .I2(sel0[1]),
        .I3(slv_reg5[2]),
        .I4(sel0[0]),
        .I5(slv_reg4[2]),
        .O(\axi_rdata[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[30]_i_2 
       (.I0(slv_reg3[30]),
        .I1(slv_reg2[30]),
        .I2(sel0[1]),
        .I3(slv_reg1[30]),
        .I4(sel0[0]),
        .I5(slv_reg0[30]),
        .O(\axi_rdata[30]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[30]_i_3 
       (.I0(slv_reg7[30]),
        .I1(slv_reg6[30]),
        .I2(sel0[1]),
        .I3(slv_reg5[30]),
        .I4(sel0[0]),
        .I5(slv_reg4[30]),
        .O(\axi_rdata[30]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[31]_i_2 
       (.I0(slv_reg3[31]),
        .I1(slv_reg2[31]),
        .I2(sel0[1]),
        .I3(slv_reg1[31]),
        .I4(sel0[0]),
        .I5(slv_reg0[31]),
        .O(\axi_rdata[31]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[31]_i_3 
       (.I0(slv_reg7[31]),
        .I1(slv_reg6[31]),
        .I2(sel0[1]),
        .I3(slv_reg5[31]),
        .I4(sel0[0]),
        .I5(slv_reg4[31]),
        .O(\axi_rdata[31]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[3]_i_2 
       (.I0(slv_reg3[3]),
        .I1(slv_reg2[3]),
        .I2(sel0[1]),
        .I3(slv_reg1[3]),
        .I4(sel0[0]),
        .I5(slv_reg0[3]),
        .O(\axi_rdata[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[3]_i_3 
       (.I0(slv_reg7[3]),
        .I1(slv_reg6[3]),
        .I2(sel0[1]),
        .I3(slv_reg5[3]),
        .I4(sel0[0]),
        .I5(slv_reg4[3]),
        .O(\axi_rdata[3]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[4]_i_2 
       (.I0(slv_reg3[4]),
        .I1(slv_reg2[4]),
        .I2(sel0[1]),
        .I3(slv_reg1[4]),
        .I4(sel0[0]),
        .I5(slv_reg0[4]),
        .O(\axi_rdata[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[4]_i_3 
       (.I0(slv_reg7[4]),
        .I1(slv_reg6[4]),
        .I2(sel0[1]),
        .I3(slv_reg5[4]),
        .I4(sel0[0]),
        .I5(slv_reg4[4]),
        .O(\axi_rdata[4]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[5]_i_2 
       (.I0(slv_reg3[5]),
        .I1(slv_reg2[5]),
        .I2(sel0[1]),
        .I3(slv_reg1[5]),
        .I4(sel0[0]),
        .I5(slv_reg0[5]),
        .O(\axi_rdata[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[5]_i_3 
       (.I0(slv_reg7[5]),
        .I1(slv_reg6[5]),
        .I2(sel0[1]),
        .I3(slv_reg5[5]),
        .I4(sel0[0]),
        .I5(slv_reg4[5]),
        .O(\axi_rdata[5]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[6]_i_2 
       (.I0(slv_reg3[6]),
        .I1(slv_reg2[6]),
        .I2(sel0[1]),
        .I3(slv_reg1[6]),
        .I4(sel0[0]),
        .I5(slv_reg0[6]),
        .O(\axi_rdata[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[6]_i_3 
       (.I0(slv_reg7[6]),
        .I1(slv_reg6[6]),
        .I2(sel0[1]),
        .I3(slv_reg5[6]),
        .I4(sel0[0]),
        .I5(slv_reg4[6]),
        .O(\axi_rdata[6]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[7]_i_2 
       (.I0(slv_reg3[7]),
        .I1(slv_reg2[7]),
        .I2(sel0[1]),
        .I3(slv_reg1[7]),
        .I4(sel0[0]),
        .I5(slv_reg0[7]),
        .O(\axi_rdata[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[7]_i_3 
       (.I0(slv_reg7[7]),
        .I1(slv_reg6[7]),
        .I2(sel0[1]),
        .I3(slv_reg5[7]),
        .I4(sel0[0]),
        .I5(slv_reg4[7]),
        .O(\axi_rdata[7]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[8]_i_2 
       (.I0(slv_reg3[8]),
        .I1(slv_reg2[8]),
        .I2(sel0[1]),
        .I3(slv_reg1[8]),
        .I4(sel0[0]),
        .I5(slv_reg0[8]),
        .O(\axi_rdata[8]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[8]_i_3 
       (.I0(slv_reg7[8]),
        .I1(slv_reg6[8]),
        .I2(sel0[1]),
        .I3(slv_reg5[8]),
        .I4(sel0[0]),
        .I5(slv_reg4[8]),
        .O(\axi_rdata[8]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[9]_i_2 
       (.I0(slv_reg3[9]),
        .I1(slv_reg2[9]),
        .I2(sel0[1]),
        .I3(slv_reg1[9]),
        .I4(sel0[0]),
        .I5(slv_reg0[9]),
        .O(\axi_rdata[9]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[9]_i_3 
       (.I0(slv_reg7[9]),
        .I1(slv_reg6[9]),
        .I2(sel0[1]),
        .I3(slv_reg5[9]),
        .I4(sel0[0]),
        .I5(slv_reg4[9]),
        .O(\axi_rdata[9]_i_3_n_0 ));
  FDRE \axi_rdata_reg[0] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[0]),
        .Q(s00_axi_rdata[0]),
        .R(axi_awready_i_1_n_0));
  MUXF7 \axi_rdata_reg[0]_i_1 
       (.I0(\axi_rdata[0]_i_2_n_0 ),
        .I1(\axi_rdata[0]_i_3_n_0 ),
        .O(reg_data_out[0]),
        .S(sel0[2]));
  FDRE \axi_rdata_reg[10] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[10]),
        .Q(s00_axi_rdata[10]),
        .R(axi_awready_i_1_n_0));
  MUXF7 \axi_rdata_reg[10]_i_1 
       (.I0(\axi_rdata[10]_i_2_n_0 ),
        .I1(\axi_rdata[10]_i_3_n_0 ),
        .O(reg_data_out[10]),
        .S(sel0[2]));
  FDRE \axi_rdata_reg[11] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[11]),
        .Q(s00_axi_rdata[11]),
        .R(axi_awready_i_1_n_0));
  MUXF7 \axi_rdata_reg[11]_i_1 
       (.I0(\axi_rdata[11]_i_2_n_0 ),
        .I1(\axi_rdata[11]_i_3_n_0 ),
        .O(reg_data_out[11]),
        .S(sel0[2]));
  FDRE \axi_rdata_reg[12] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[12]),
        .Q(s00_axi_rdata[12]),
        .R(axi_awready_i_1_n_0));
  MUXF7 \axi_rdata_reg[12]_i_1 
       (.I0(\axi_rdata[12]_i_2_n_0 ),
        .I1(\axi_rdata[12]_i_3_n_0 ),
        .O(reg_data_out[12]),
        .S(sel0[2]));
  FDRE \axi_rdata_reg[13] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[13]),
        .Q(s00_axi_rdata[13]),
        .R(axi_awready_i_1_n_0));
  MUXF7 \axi_rdata_reg[13]_i_1 
       (.I0(\axi_rdata[13]_i_2_n_0 ),
        .I1(\axi_rdata[13]_i_3_n_0 ),
        .O(reg_data_out[13]),
        .S(sel0[2]));
  FDRE \axi_rdata_reg[14] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[14]),
        .Q(s00_axi_rdata[14]),
        .R(axi_awready_i_1_n_0));
  MUXF7 \axi_rdata_reg[14]_i_1 
       (.I0(\axi_rdata[14]_i_2_n_0 ),
        .I1(\axi_rdata[14]_i_3_n_0 ),
        .O(reg_data_out[14]),
        .S(sel0[2]));
  FDRE \axi_rdata_reg[15] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[15]),
        .Q(s00_axi_rdata[15]),
        .R(axi_awready_i_1_n_0));
  MUXF7 \axi_rdata_reg[15]_i_1 
       (.I0(\axi_rdata[15]_i_2_n_0 ),
        .I1(\axi_rdata[15]_i_3_n_0 ),
        .O(reg_data_out[15]),
        .S(sel0[2]));
  FDRE \axi_rdata_reg[16] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[16]),
        .Q(s00_axi_rdata[16]),
        .R(axi_awready_i_1_n_0));
  MUXF7 \axi_rdata_reg[16]_i_1 
       (.I0(\axi_rdata[16]_i_2_n_0 ),
        .I1(\axi_rdata[16]_i_3_n_0 ),
        .O(reg_data_out[16]),
        .S(sel0[2]));
  FDRE \axi_rdata_reg[17] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[17]),
        .Q(s00_axi_rdata[17]),
        .R(axi_awready_i_1_n_0));
  MUXF7 \axi_rdata_reg[17]_i_1 
       (.I0(\axi_rdata[17]_i_2_n_0 ),
        .I1(\axi_rdata[17]_i_3_n_0 ),
        .O(reg_data_out[17]),
        .S(sel0[2]));
  FDRE \axi_rdata_reg[18] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[18]),
        .Q(s00_axi_rdata[18]),
        .R(axi_awready_i_1_n_0));
  MUXF7 \axi_rdata_reg[18]_i_1 
       (.I0(\axi_rdata[18]_i_2_n_0 ),
        .I1(\axi_rdata[18]_i_3_n_0 ),
        .O(reg_data_out[18]),
        .S(sel0[2]));
  FDRE \axi_rdata_reg[19] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[19]),
        .Q(s00_axi_rdata[19]),
        .R(axi_awready_i_1_n_0));
  MUXF7 \axi_rdata_reg[19]_i_1 
       (.I0(\axi_rdata[19]_i_2_n_0 ),
        .I1(\axi_rdata[19]_i_3_n_0 ),
        .O(reg_data_out[19]),
        .S(sel0[2]));
  FDRE \axi_rdata_reg[1] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[1]),
        .Q(s00_axi_rdata[1]),
        .R(axi_awready_i_1_n_0));
  MUXF7 \axi_rdata_reg[1]_i_1 
       (.I0(\axi_rdata[1]_i_2_n_0 ),
        .I1(\axi_rdata[1]_i_3_n_0 ),
        .O(reg_data_out[1]),
        .S(sel0[2]));
  FDRE \axi_rdata_reg[20] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[20]),
        .Q(s00_axi_rdata[20]),
        .R(axi_awready_i_1_n_0));
  MUXF7 \axi_rdata_reg[20]_i_1 
       (.I0(\axi_rdata[20]_i_2_n_0 ),
        .I1(\axi_rdata[20]_i_3_n_0 ),
        .O(reg_data_out[20]),
        .S(sel0[2]));
  FDRE \axi_rdata_reg[21] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[21]),
        .Q(s00_axi_rdata[21]),
        .R(axi_awready_i_1_n_0));
  MUXF7 \axi_rdata_reg[21]_i_1 
       (.I0(\axi_rdata[21]_i_2_n_0 ),
        .I1(\axi_rdata[21]_i_3_n_0 ),
        .O(reg_data_out[21]),
        .S(sel0[2]));
  FDRE \axi_rdata_reg[22] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[22]),
        .Q(s00_axi_rdata[22]),
        .R(axi_awready_i_1_n_0));
  MUXF7 \axi_rdata_reg[22]_i_1 
       (.I0(\axi_rdata[22]_i_2_n_0 ),
        .I1(\axi_rdata[22]_i_3_n_0 ),
        .O(reg_data_out[22]),
        .S(sel0[2]));
  FDRE \axi_rdata_reg[23] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[23]),
        .Q(s00_axi_rdata[23]),
        .R(axi_awready_i_1_n_0));
  MUXF7 \axi_rdata_reg[23]_i_1 
       (.I0(\axi_rdata[23]_i_2_n_0 ),
        .I1(\axi_rdata[23]_i_3_n_0 ),
        .O(reg_data_out[23]),
        .S(sel0[2]));
  FDRE \axi_rdata_reg[24] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[24]),
        .Q(s00_axi_rdata[24]),
        .R(axi_awready_i_1_n_0));
  MUXF7 \axi_rdata_reg[24]_i_1 
       (.I0(\axi_rdata[24]_i_2_n_0 ),
        .I1(\axi_rdata[24]_i_3_n_0 ),
        .O(reg_data_out[24]),
        .S(sel0[2]));
  FDRE \axi_rdata_reg[25] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[25]),
        .Q(s00_axi_rdata[25]),
        .R(axi_awready_i_1_n_0));
  MUXF7 \axi_rdata_reg[25]_i_1 
       (.I0(\axi_rdata[25]_i_2_n_0 ),
        .I1(\axi_rdata[25]_i_3_n_0 ),
        .O(reg_data_out[25]),
        .S(sel0[2]));
  FDRE \axi_rdata_reg[26] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[26]),
        .Q(s00_axi_rdata[26]),
        .R(axi_awready_i_1_n_0));
  MUXF7 \axi_rdata_reg[26]_i_1 
       (.I0(\axi_rdata[26]_i_2_n_0 ),
        .I1(\axi_rdata[26]_i_3_n_0 ),
        .O(reg_data_out[26]),
        .S(sel0[2]));
  FDRE \axi_rdata_reg[27] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[27]),
        .Q(s00_axi_rdata[27]),
        .R(axi_awready_i_1_n_0));
  MUXF7 \axi_rdata_reg[27]_i_1 
       (.I0(\axi_rdata[27]_i_2_n_0 ),
        .I1(\axi_rdata[27]_i_3_n_0 ),
        .O(reg_data_out[27]),
        .S(sel0[2]));
  FDRE \axi_rdata_reg[28] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[28]),
        .Q(s00_axi_rdata[28]),
        .R(axi_awready_i_1_n_0));
  MUXF7 \axi_rdata_reg[28]_i_1 
       (.I0(\axi_rdata[28]_i_2_n_0 ),
        .I1(\axi_rdata[28]_i_3_n_0 ),
        .O(reg_data_out[28]),
        .S(sel0[2]));
  FDRE \axi_rdata_reg[29] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[29]),
        .Q(s00_axi_rdata[29]),
        .R(axi_awready_i_1_n_0));
  MUXF7 \axi_rdata_reg[29]_i_1 
       (.I0(\axi_rdata[29]_i_2_n_0 ),
        .I1(\axi_rdata[29]_i_3_n_0 ),
        .O(reg_data_out[29]),
        .S(sel0[2]));
  FDRE \axi_rdata_reg[2] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[2]),
        .Q(s00_axi_rdata[2]),
        .R(axi_awready_i_1_n_0));
  MUXF7 \axi_rdata_reg[2]_i_1 
       (.I0(\axi_rdata[2]_i_2_n_0 ),
        .I1(\axi_rdata[2]_i_3_n_0 ),
        .O(reg_data_out[2]),
        .S(sel0[2]));
  FDRE \axi_rdata_reg[30] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[30]),
        .Q(s00_axi_rdata[30]),
        .R(axi_awready_i_1_n_0));
  MUXF7 \axi_rdata_reg[30]_i_1 
       (.I0(\axi_rdata[30]_i_2_n_0 ),
        .I1(\axi_rdata[30]_i_3_n_0 ),
        .O(reg_data_out[30]),
        .S(sel0[2]));
  FDRE \axi_rdata_reg[31] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[31]),
        .Q(s00_axi_rdata[31]),
        .R(axi_awready_i_1_n_0));
  MUXF7 \axi_rdata_reg[31]_i_1 
       (.I0(\axi_rdata[31]_i_2_n_0 ),
        .I1(\axi_rdata[31]_i_3_n_0 ),
        .O(reg_data_out[31]),
        .S(sel0[2]));
  FDRE \axi_rdata_reg[3] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[3]),
        .Q(s00_axi_rdata[3]),
        .R(axi_awready_i_1_n_0));
  MUXF7 \axi_rdata_reg[3]_i_1 
       (.I0(\axi_rdata[3]_i_2_n_0 ),
        .I1(\axi_rdata[3]_i_3_n_0 ),
        .O(reg_data_out[3]),
        .S(sel0[2]));
  FDRE \axi_rdata_reg[4] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[4]),
        .Q(s00_axi_rdata[4]),
        .R(axi_awready_i_1_n_0));
  MUXF7 \axi_rdata_reg[4]_i_1 
       (.I0(\axi_rdata[4]_i_2_n_0 ),
        .I1(\axi_rdata[4]_i_3_n_0 ),
        .O(reg_data_out[4]),
        .S(sel0[2]));
  FDRE \axi_rdata_reg[5] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[5]),
        .Q(s00_axi_rdata[5]),
        .R(axi_awready_i_1_n_0));
  MUXF7 \axi_rdata_reg[5]_i_1 
       (.I0(\axi_rdata[5]_i_2_n_0 ),
        .I1(\axi_rdata[5]_i_3_n_0 ),
        .O(reg_data_out[5]),
        .S(sel0[2]));
  FDRE \axi_rdata_reg[6] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[6]),
        .Q(s00_axi_rdata[6]),
        .R(axi_awready_i_1_n_0));
  MUXF7 \axi_rdata_reg[6]_i_1 
       (.I0(\axi_rdata[6]_i_2_n_0 ),
        .I1(\axi_rdata[6]_i_3_n_0 ),
        .O(reg_data_out[6]),
        .S(sel0[2]));
  FDRE \axi_rdata_reg[7] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[7]),
        .Q(s00_axi_rdata[7]),
        .R(axi_awready_i_1_n_0));
  MUXF7 \axi_rdata_reg[7]_i_1 
       (.I0(\axi_rdata[7]_i_2_n_0 ),
        .I1(\axi_rdata[7]_i_3_n_0 ),
        .O(reg_data_out[7]),
        .S(sel0[2]));
  FDRE \axi_rdata_reg[8] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[8]),
        .Q(s00_axi_rdata[8]),
        .R(axi_awready_i_1_n_0));
  MUXF7 \axi_rdata_reg[8]_i_1 
       (.I0(\axi_rdata[8]_i_2_n_0 ),
        .I1(\axi_rdata[8]_i_3_n_0 ),
        .O(reg_data_out[8]),
        .S(sel0[2]));
  FDRE \axi_rdata_reg[9] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[9]),
        .Q(s00_axi_rdata[9]),
        .R(axi_awready_i_1_n_0));
  MUXF7 \axi_rdata_reg[9]_i_1 
       (.I0(\axi_rdata[9]_i_2_n_0 ),
        .I1(\axi_rdata[9]_i_3_n_0 ),
        .O(reg_data_out[9]),
        .S(sel0[2]));
  LUT4 #(
    .INIT(16'h08F8)) 
    axi_rvalid_i_1
       (.I0(S_AXI_ARREADY),
        .I1(s00_axi_arvalid),
        .I2(s00_axi_rvalid),
        .I3(s00_axi_rready),
        .O(axi_rvalid_i_1_n_0));
  FDRE axi_rvalid_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_rvalid_i_1_n_0),
        .Q(s00_axi_rvalid),
        .R(axi_awready_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h0800)) 
    axi_wready_i_1
       (.I0(s00_axi_awvalid),
        .I1(s00_axi_wvalid),
        .I2(S_AXI_WREADY),
        .I3(aw_en_reg_n_0),
        .O(axi_wready0));
  FDRE axi_wready_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_wready0),
        .Q(S_AXI_WREADY),
        .R(axi_awready_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    difference_carry__6_i_1
       (.I0(slv_reg0[31]),
        .I1(slv_reg1[31]),
        .O(difference_carry__6_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    difference_carry__6_i_2
       (.I0(slv_reg0[30]),
        .I1(slv_reg1[30]),
        .O(difference_carry__6_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    difference_carry__6_i_3
       (.I0(slv_reg0[29]),
        .I1(slv_reg1[29]),
        .O(difference_carry__6_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    difference_carry__6_i_4
       (.I0(slv_reg0[28]),
        .I1(slv_reg1[28]),
        .O(difference_carry__6_i_4_n_0));
  LUT5 #(
    .INIT(32'h00000200)) 
    \slv_reg0[15]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(\axi_awaddr_reg_n_0_[4] ),
        .I2(p_0_in0),
        .I3(s00_axi_wstrb[1]),
        .I4(p_0_in),
        .O(p_1_in[15]));
  LUT5 #(
    .INIT(32'h00000200)) 
    \slv_reg0[23]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(\axi_awaddr_reg_n_0_[4] ),
        .I2(p_0_in0),
        .I3(s00_axi_wstrb[2]),
        .I4(p_0_in),
        .O(p_1_in[23]));
  LUT5 #(
    .INIT(32'h00000200)) 
    \slv_reg0[31]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(\axi_awaddr_reg_n_0_[4] ),
        .I2(p_0_in0),
        .I3(s00_axi_wstrb[3]),
        .I4(p_0_in),
        .O(p_1_in[31]));
  LUT5 #(
    .INIT(32'h00000200)) 
    \slv_reg0[7]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(\axi_awaddr_reg_n_0_[4] ),
        .I2(p_0_in0),
        .I3(s00_axi_wstrb[0]),
        .I4(p_0_in),
        .O(p_1_in[7]));
  FDRE \slv_reg0_reg[0] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[0]),
        .Q(slv_reg0[0]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[10] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[10]),
        .Q(slv_reg0[10]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[11] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[11]),
        .Q(slv_reg0[11]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[12] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[12]),
        .Q(slv_reg0[12]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[13] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[13]),
        .Q(slv_reg0[13]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[14] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[14]),
        .Q(slv_reg0[14]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[15] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[15]),
        .Q(slv_reg0[15]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[16] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[16]),
        .Q(slv_reg0[16]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[17] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[17]),
        .Q(slv_reg0[17]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[18] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[18]),
        .Q(slv_reg0[18]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[19] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[19]),
        .Q(slv_reg0[19]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[1] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[1]),
        .Q(slv_reg0[1]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[20] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[20]),
        .Q(slv_reg0[20]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[21] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[21]),
        .Q(slv_reg0[21]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[22] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[22]),
        .Q(slv_reg0[22]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[23] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[23]),
        .Q(slv_reg0[23]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[24] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[24]),
        .Q(slv_reg0[24]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[25] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[25]),
        .Q(slv_reg0[25]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[26] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[26]),
        .Q(slv_reg0[26]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[27] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[27]),
        .Q(slv_reg0[27]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[28] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[28]),
        .Q(slv_reg0[28]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[29] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[29]),
        .Q(slv_reg0[29]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[2] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[2]),
        .Q(slv_reg0[2]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[30] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[30]),
        .Q(slv_reg0[30]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[31] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[31]),
        .Q(slv_reg0[31]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[3] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[3]),
        .Q(slv_reg0[3]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[4] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[4]),
        .Q(slv_reg0[4]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[5] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[5]),
        .Q(slv_reg0[5]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[6] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[6]),
        .Q(slv_reg0[6]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[7] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[7]),
        .Q(slv_reg0[7]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[8] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[8]),
        .Q(slv_reg0[8]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[9] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[9]),
        .Q(slv_reg0[9]),
        .R(axi_awready_i_1_n_0));
  LUT5 #(
    .INIT(32'h02000000)) 
    \slv_reg1[15]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(\axi_awaddr_reg_n_0_[4] ),
        .I2(p_0_in0),
        .I3(p_0_in),
        .I4(s00_axi_wstrb[1]),
        .O(\slv_reg1[15]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h02000000)) 
    \slv_reg1[23]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(\axi_awaddr_reg_n_0_[4] ),
        .I2(p_0_in0),
        .I3(p_0_in),
        .I4(s00_axi_wstrb[2]),
        .O(\slv_reg1[23]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h02000000)) 
    \slv_reg1[31]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(\axi_awaddr_reg_n_0_[4] ),
        .I2(p_0_in0),
        .I3(p_0_in),
        .I4(s00_axi_wstrb[3]),
        .O(\slv_reg1[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \slv_reg1[31]_i_2 
       (.I0(S_AXI_WREADY),
        .I1(S_AXI_AWREADY),
        .I2(s00_axi_awvalid),
        .I3(s00_axi_wvalid),
        .O(slv_reg_wren__0));
  LUT5 #(
    .INIT(32'h02000000)) 
    \slv_reg1[7]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(\axi_awaddr_reg_n_0_[4] ),
        .I2(p_0_in0),
        .I3(p_0_in),
        .I4(s00_axi_wstrb[0]),
        .O(\slv_reg1[7]_i_1_n_0 ));
  FDRE \slv_reg1_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[0]),
        .Q(slv_reg1[0]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[10] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[10]),
        .Q(slv_reg1[10]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[11] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[11]),
        .Q(slv_reg1[11]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[12] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[12]),
        .Q(slv_reg1[12]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[13] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[13]),
        .Q(slv_reg1[13]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[14] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[14]),
        .Q(slv_reg1[14]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[15] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[15]),
        .Q(slv_reg1[15]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[16] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[16]),
        .Q(slv_reg1[16]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[17] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[17]),
        .Q(slv_reg1[17]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[18] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[18]),
        .Q(slv_reg1[18]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[19] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[19]),
        .Q(slv_reg1[19]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[1]),
        .Q(slv_reg1[1]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[20] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[20]),
        .Q(slv_reg1[20]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[21] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[21]),
        .Q(slv_reg1[21]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[22] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[22]),
        .Q(slv_reg1[22]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[23] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[23]),
        .Q(slv_reg1[23]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[24] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[24]),
        .Q(slv_reg1[24]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[25] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[25]),
        .Q(slv_reg1[25]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[26] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[26]),
        .Q(slv_reg1[26]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[27] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[27]),
        .Q(slv_reg1[27]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[28] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[28]),
        .Q(slv_reg1[28]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[29] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[29]),
        .Q(slv_reg1[29]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[2]),
        .Q(slv_reg1[2]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[30] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[30]),
        .Q(slv_reg1[30]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[31] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[31]),
        .Q(slv_reg1[31]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[3]),
        .Q(slv_reg1[3]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[4]),
        .Q(slv_reg1[4]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[5] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[5]),
        .Q(slv_reg1[5]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[6] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[6]),
        .Q(slv_reg1[6]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[7] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[7]),
        .Q(slv_reg1[7]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[8] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[8]),
        .Q(slv_reg1[8]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[9] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[9]),
        .Q(slv_reg1[9]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(sum[0]),
        .Q(slv_reg2[0]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[10] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(sum[10]),
        .Q(slv_reg2[10]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[11] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(sum[11]),
        .Q(slv_reg2[11]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[12] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(sum[12]),
        .Q(slv_reg2[12]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[13] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(sum[13]),
        .Q(slv_reg2[13]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[14] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(sum[14]),
        .Q(slv_reg2[14]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[15] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(sum[15]),
        .Q(slv_reg2[15]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[16] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(sum[16]),
        .Q(slv_reg2[16]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[17] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(sum[17]),
        .Q(slv_reg2[17]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[18] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(sum[18]),
        .Q(slv_reg2[18]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[19] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(sum[19]),
        .Q(slv_reg2[19]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(sum[1]),
        .Q(slv_reg2[1]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[20] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(sum[20]),
        .Q(slv_reg2[20]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[21] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(sum[21]),
        .Q(slv_reg2[21]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[22] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(sum[22]),
        .Q(slv_reg2[22]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[23] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(sum[23]),
        .Q(slv_reg2[23]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[24] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(sum[24]),
        .Q(slv_reg2[24]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[25] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(sum[25]),
        .Q(slv_reg2[25]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[26] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(sum[26]),
        .Q(slv_reg2[26]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[27] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(sum[27]),
        .Q(slv_reg2[27]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[28] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(sum[28]),
        .Q(slv_reg2[28]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[29] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(sum[29]),
        .Q(slv_reg2[29]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(sum[2]),
        .Q(slv_reg2[2]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[30] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(sum[30]),
        .Q(slv_reg2[30]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[31] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(sum[31]),
        .Q(slv_reg2[31]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(sum[3]),
        .Q(slv_reg2[3]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[4] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(sum[4]),
        .Q(slv_reg2[4]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[5] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(sum[5]),
        .Q(slv_reg2[5]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[6] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(sum[6]),
        .Q(slv_reg2[6]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[7] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(sum[7]),
        .Q(slv_reg2[7]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[8] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(sum[8]),
        .Q(slv_reg2[8]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[9] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(sum[9]),
        .Q(slv_reg2[9]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(difference[0]),
        .Q(slv_reg3[0]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[10] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(difference[10]),
        .Q(slv_reg3[10]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[11] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(difference[11]),
        .Q(slv_reg3[11]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[12] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(difference[12]),
        .Q(slv_reg3[12]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[13] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(difference[13]),
        .Q(slv_reg3[13]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[14] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(difference[14]),
        .Q(slv_reg3[14]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[15] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(difference[15]),
        .Q(slv_reg3[15]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[16] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(difference[16]),
        .Q(slv_reg3[16]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[17] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(difference[17]),
        .Q(slv_reg3[17]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[18] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(difference[18]),
        .Q(slv_reg3[18]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[19] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(difference[19]),
        .Q(slv_reg3[19]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(difference[1]),
        .Q(slv_reg3[1]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[20] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(difference[20]),
        .Q(slv_reg3[20]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[21] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(difference[21]),
        .Q(slv_reg3[21]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[22] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(difference[22]),
        .Q(slv_reg3[22]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[23] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(difference[23]),
        .Q(slv_reg3[23]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[24] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(difference[24]),
        .Q(slv_reg3[24]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[25] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(difference[25]),
        .Q(slv_reg3[25]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[26] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(difference[26]),
        .Q(slv_reg3[26]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[27] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(difference[27]),
        .Q(slv_reg3[27]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[28] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(difference[28]),
        .Q(slv_reg3[28]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[29] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(difference[29]),
        .Q(slv_reg3[29]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(difference[2]),
        .Q(slv_reg3[2]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[30] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(difference[30]),
        .Q(slv_reg3[30]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[31] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(difference[31]),
        .Q(slv_reg3[31]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(difference[3]),
        .Q(slv_reg3[3]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[4] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(difference[4]),
        .Q(slv_reg3[4]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[5] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(difference[5]),
        .Q(slv_reg3[5]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[6] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(difference[6]),
        .Q(slv_reg3[6]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[7] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(difference[7]),
        .Q(slv_reg3[7]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[8] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(difference[8]),
        .Q(slv_reg3[8]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[9] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(difference[9]),
        .Q(slv_reg3[9]),
        .R(axi_awready_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slv_reg4[0]_i_1 
       (.I0(slv_reg0[0]),
        .I1(slv_reg1[0]),
        .O(bitwiseAnd[0]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slv_reg4[10]_i_1 
       (.I0(slv_reg0[10]),
        .I1(slv_reg1[10]),
        .O(bitwiseAnd[10]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slv_reg4[11]_i_1 
       (.I0(slv_reg0[11]),
        .I1(slv_reg1[11]),
        .O(bitwiseAnd[11]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slv_reg4[12]_i_1 
       (.I0(slv_reg0[12]),
        .I1(slv_reg1[12]),
        .O(bitwiseAnd[12]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slv_reg4[13]_i_1 
       (.I0(slv_reg0[13]),
        .I1(slv_reg1[13]),
        .O(bitwiseAnd[13]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slv_reg4[14]_i_1 
       (.I0(slv_reg0[14]),
        .I1(slv_reg1[14]),
        .O(bitwiseAnd[14]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slv_reg4[15]_i_1 
       (.I0(slv_reg0[15]),
        .I1(slv_reg1[15]),
        .O(bitwiseAnd[15]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slv_reg4[16]_i_1 
       (.I0(slv_reg0[16]),
        .I1(slv_reg1[16]),
        .O(bitwiseAnd[16]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slv_reg4[17]_i_1 
       (.I0(slv_reg0[17]),
        .I1(slv_reg1[17]),
        .O(bitwiseAnd[17]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slv_reg4[18]_i_1 
       (.I0(slv_reg0[18]),
        .I1(slv_reg1[18]),
        .O(bitwiseAnd[18]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slv_reg4[19]_i_1 
       (.I0(slv_reg0[19]),
        .I1(slv_reg1[19]),
        .O(bitwiseAnd[19]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slv_reg4[1]_i_1 
       (.I0(slv_reg0[1]),
        .I1(slv_reg1[1]),
        .O(bitwiseAnd[1]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slv_reg4[20]_i_1 
       (.I0(slv_reg0[20]),
        .I1(slv_reg1[20]),
        .O(bitwiseAnd[20]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slv_reg4[21]_i_1 
       (.I0(slv_reg0[21]),
        .I1(slv_reg1[21]),
        .O(bitwiseAnd[21]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slv_reg4[22]_i_1 
       (.I0(slv_reg0[22]),
        .I1(slv_reg1[22]),
        .O(bitwiseAnd[22]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slv_reg4[23]_i_1 
       (.I0(slv_reg0[23]),
        .I1(slv_reg1[23]),
        .O(bitwiseAnd[23]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slv_reg4[24]_i_1 
       (.I0(slv_reg0[24]),
        .I1(slv_reg1[24]),
        .O(bitwiseAnd[24]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slv_reg4[25]_i_1 
       (.I0(slv_reg0[25]),
        .I1(slv_reg1[25]),
        .O(bitwiseAnd[25]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slv_reg4[26]_i_1 
       (.I0(slv_reg0[26]),
        .I1(slv_reg1[26]),
        .O(bitwiseAnd[26]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slv_reg4[27]_i_1 
       (.I0(slv_reg0[27]),
        .I1(slv_reg1[27]),
        .O(bitwiseAnd[27]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slv_reg4[28]_i_1 
       (.I0(slv_reg0[28]),
        .I1(slv_reg1[28]),
        .O(bitwiseAnd[28]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slv_reg4[29]_i_1 
       (.I0(slv_reg0[29]),
        .I1(slv_reg1[29]),
        .O(bitwiseAnd[29]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slv_reg4[2]_i_1 
       (.I0(slv_reg0[2]),
        .I1(slv_reg1[2]),
        .O(bitwiseAnd[2]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slv_reg4[30]_i_1 
       (.I0(slv_reg0[30]),
        .I1(slv_reg1[30]),
        .O(bitwiseAnd[30]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slv_reg4[31]_i_1 
       (.I0(slv_reg0[31]),
        .I1(slv_reg1[31]),
        .O(bitwiseAnd[31]));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slv_reg4[3]_i_1 
       (.I0(slv_reg0[3]),
        .I1(slv_reg1[3]),
        .O(bitwiseAnd[3]));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slv_reg4[4]_i_1 
       (.I0(slv_reg0[4]),
        .I1(slv_reg1[4]),
        .O(bitwiseAnd[4]));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slv_reg4[5]_i_1 
       (.I0(slv_reg0[5]),
        .I1(slv_reg1[5]),
        .O(bitwiseAnd[5]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slv_reg4[6]_i_1 
       (.I0(slv_reg0[6]),
        .I1(slv_reg1[6]),
        .O(bitwiseAnd[6]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slv_reg4[7]_i_1 
       (.I0(slv_reg0[7]),
        .I1(slv_reg1[7]),
        .O(bitwiseAnd[7]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slv_reg4[8]_i_1 
       (.I0(slv_reg0[8]),
        .I1(slv_reg1[8]),
        .O(bitwiseAnd[8]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slv_reg4[9]_i_1 
       (.I0(slv_reg0[9]),
        .I1(slv_reg1[9]),
        .O(bitwiseAnd[9]));
  FDRE \slv_reg4_reg[0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseAnd[0]),
        .Q(slv_reg4[0]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg4_reg[10] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseAnd[10]),
        .Q(slv_reg4[10]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg4_reg[11] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseAnd[11]),
        .Q(slv_reg4[11]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg4_reg[12] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseAnd[12]),
        .Q(slv_reg4[12]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg4_reg[13] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseAnd[13]),
        .Q(slv_reg4[13]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg4_reg[14] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseAnd[14]),
        .Q(slv_reg4[14]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg4_reg[15] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseAnd[15]),
        .Q(slv_reg4[15]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg4_reg[16] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseAnd[16]),
        .Q(slv_reg4[16]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg4_reg[17] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseAnd[17]),
        .Q(slv_reg4[17]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg4_reg[18] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseAnd[18]),
        .Q(slv_reg4[18]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg4_reg[19] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseAnd[19]),
        .Q(slv_reg4[19]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg4_reg[1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseAnd[1]),
        .Q(slv_reg4[1]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg4_reg[20] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseAnd[20]),
        .Q(slv_reg4[20]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg4_reg[21] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseAnd[21]),
        .Q(slv_reg4[21]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg4_reg[22] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseAnd[22]),
        .Q(slv_reg4[22]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg4_reg[23] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseAnd[23]),
        .Q(slv_reg4[23]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg4_reg[24] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseAnd[24]),
        .Q(slv_reg4[24]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg4_reg[25] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseAnd[25]),
        .Q(slv_reg4[25]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg4_reg[26] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseAnd[26]),
        .Q(slv_reg4[26]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg4_reg[27] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseAnd[27]),
        .Q(slv_reg4[27]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg4_reg[28] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseAnd[28]),
        .Q(slv_reg4[28]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg4_reg[29] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseAnd[29]),
        .Q(slv_reg4[29]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg4_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseAnd[2]),
        .Q(slv_reg4[2]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg4_reg[30] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseAnd[30]),
        .Q(slv_reg4[30]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg4_reg[31] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseAnd[31]),
        .Q(slv_reg4[31]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg4_reg[3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseAnd[3]),
        .Q(slv_reg4[3]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg4_reg[4] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseAnd[4]),
        .Q(slv_reg4[4]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg4_reg[5] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseAnd[5]),
        .Q(slv_reg4[5]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg4_reg[6] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseAnd[6]),
        .Q(slv_reg4[6]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg4_reg[7] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseAnd[7]),
        .Q(slv_reg4[7]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg4_reg[8] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseAnd[8]),
        .Q(slv_reg4[8]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg4_reg[9] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseAnd[9]),
        .Q(slv_reg4[9]),
        .R(axi_awready_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \slv_reg5[0]_i_1 
       (.I0(slv_reg0[0]),
        .I1(slv_reg1[0]),
        .O(bitwiseOr[0]));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \slv_reg5[10]_i_1 
       (.I0(slv_reg0[10]),
        .I1(slv_reg1[10]),
        .O(bitwiseOr[10]));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \slv_reg5[11]_i_1 
       (.I0(slv_reg0[11]),
        .I1(slv_reg1[11]),
        .O(bitwiseOr[11]));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \slv_reg5[12]_i_1 
       (.I0(slv_reg0[12]),
        .I1(slv_reg1[12]),
        .O(bitwiseOr[12]));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \slv_reg5[13]_i_1 
       (.I0(slv_reg0[13]),
        .I1(slv_reg1[13]),
        .O(bitwiseOr[13]));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \slv_reg5[14]_i_1 
       (.I0(slv_reg0[14]),
        .I1(slv_reg1[14]),
        .O(bitwiseOr[14]));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \slv_reg5[15]_i_1 
       (.I0(slv_reg0[15]),
        .I1(slv_reg1[15]),
        .O(bitwiseOr[15]));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \slv_reg5[16]_i_1 
       (.I0(slv_reg0[16]),
        .I1(slv_reg1[16]),
        .O(bitwiseOr[16]));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \slv_reg5[17]_i_1 
       (.I0(slv_reg0[17]),
        .I1(slv_reg1[17]),
        .O(bitwiseOr[17]));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \slv_reg5[18]_i_1 
       (.I0(slv_reg0[18]),
        .I1(slv_reg1[18]),
        .O(bitwiseOr[18]));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \slv_reg5[19]_i_1 
       (.I0(slv_reg0[19]),
        .I1(slv_reg1[19]),
        .O(bitwiseOr[19]));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \slv_reg5[1]_i_1 
       (.I0(slv_reg0[1]),
        .I1(slv_reg1[1]),
        .O(bitwiseOr[1]));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \slv_reg5[20]_i_1 
       (.I0(slv_reg0[20]),
        .I1(slv_reg1[20]),
        .O(bitwiseOr[20]));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \slv_reg5[21]_i_1 
       (.I0(slv_reg0[21]),
        .I1(slv_reg1[21]),
        .O(bitwiseOr[21]));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \slv_reg5[22]_i_1 
       (.I0(slv_reg0[22]),
        .I1(slv_reg1[22]),
        .O(bitwiseOr[22]));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \slv_reg5[23]_i_1 
       (.I0(slv_reg0[23]),
        .I1(slv_reg1[23]),
        .O(bitwiseOr[23]));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \slv_reg5[24]_i_1 
       (.I0(slv_reg0[24]),
        .I1(slv_reg1[24]),
        .O(bitwiseOr[24]));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \slv_reg5[25]_i_1 
       (.I0(slv_reg0[25]),
        .I1(slv_reg1[25]),
        .O(bitwiseOr[25]));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \slv_reg5[26]_i_1 
       (.I0(slv_reg0[26]),
        .I1(slv_reg1[26]),
        .O(bitwiseOr[26]));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \slv_reg5[27]_i_1 
       (.I0(slv_reg0[27]),
        .I1(slv_reg1[27]),
        .O(bitwiseOr[27]));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \slv_reg5[28]_i_1 
       (.I0(slv_reg0[28]),
        .I1(slv_reg1[28]),
        .O(bitwiseOr[28]));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \slv_reg5[29]_i_1 
       (.I0(slv_reg0[29]),
        .I1(slv_reg1[29]),
        .O(bitwiseOr[29]));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \slv_reg5[2]_i_1 
       (.I0(slv_reg0[2]),
        .I1(slv_reg1[2]),
        .O(bitwiseOr[2]));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \slv_reg5[30]_i_1 
       (.I0(slv_reg0[30]),
        .I1(slv_reg1[30]),
        .O(bitwiseOr[30]));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \slv_reg5[31]_i_1 
       (.I0(slv_reg0[31]),
        .I1(slv_reg1[31]),
        .O(bitwiseOr[31]));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \slv_reg5[3]_i_1 
       (.I0(slv_reg0[3]),
        .I1(slv_reg1[3]),
        .O(bitwiseOr[3]));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \slv_reg5[4]_i_1 
       (.I0(slv_reg0[4]),
        .I1(slv_reg1[4]),
        .O(bitwiseOr[4]));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \slv_reg5[5]_i_1 
       (.I0(slv_reg0[5]),
        .I1(slv_reg1[5]),
        .O(bitwiseOr[5]));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \slv_reg5[6]_i_1 
       (.I0(slv_reg0[6]),
        .I1(slv_reg1[6]),
        .O(bitwiseOr[6]));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \slv_reg5[7]_i_1 
       (.I0(slv_reg0[7]),
        .I1(slv_reg1[7]),
        .O(bitwiseOr[7]));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \slv_reg5[8]_i_1 
       (.I0(slv_reg0[8]),
        .I1(slv_reg1[8]),
        .O(bitwiseOr[8]));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \slv_reg5[9]_i_1 
       (.I0(slv_reg0[9]),
        .I1(slv_reg1[9]),
        .O(bitwiseOr[9]));
  FDRE \slv_reg5_reg[0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseOr[0]),
        .Q(slv_reg5[0]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg5_reg[10] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseOr[10]),
        .Q(slv_reg5[10]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg5_reg[11] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseOr[11]),
        .Q(slv_reg5[11]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg5_reg[12] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseOr[12]),
        .Q(slv_reg5[12]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg5_reg[13] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseOr[13]),
        .Q(slv_reg5[13]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg5_reg[14] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseOr[14]),
        .Q(slv_reg5[14]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg5_reg[15] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseOr[15]),
        .Q(slv_reg5[15]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg5_reg[16] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseOr[16]),
        .Q(slv_reg5[16]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg5_reg[17] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseOr[17]),
        .Q(slv_reg5[17]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg5_reg[18] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseOr[18]),
        .Q(slv_reg5[18]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg5_reg[19] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseOr[19]),
        .Q(slv_reg5[19]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg5_reg[1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseOr[1]),
        .Q(slv_reg5[1]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg5_reg[20] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseOr[20]),
        .Q(slv_reg5[20]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg5_reg[21] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseOr[21]),
        .Q(slv_reg5[21]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg5_reg[22] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseOr[22]),
        .Q(slv_reg5[22]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg5_reg[23] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseOr[23]),
        .Q(slv_reg5[23]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg5_reg[24] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseOr[24]),
        .Q(slv_reg5[24]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg5_reg[25] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseOr[25]),
        .Q(slv_reg5[25]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg5_reg[26] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseOr[26]),
        .Q(slv_reg5[26]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg5_reg[27] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseOr[27]),
        .Q(slv_reg5[27]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg5_reg[28] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseOr[28]),
        .Q(slv_reg5[28]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg5_reg[29] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseOr[29]),
        .Q(slv_reg5[29]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg5_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseOr[2]),
        .Q(slv_reg5[2]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg5_reg[30] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseOr[30]),
        .Q(slv_reg5[30]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg5_reg[31] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseOr[31]),
        .Q(slv_reg5[31]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg5_reg[3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseOr[3]),
        .Q(slv_reg5[3]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg5_reg[4] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseOr[4]),
        .Q(slv_reg5[4]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg5_reg[5] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseOr[5]),
        .Q(slv_reg5[5]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg5_reg[6] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseOr[6]),
        .Q(slv_reg5[6]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg5_reg[7] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseOr[7]),
        .Q(slv_reg5[7]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg5_reg[8] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseOr[8]),
        .Q(slv_reg5[8]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg5_reg[9] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseOr[9]),
        .Q(slv_reg5[9]),
        .R(axi_awready_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \slv_reg6[0]_i_1 
       (.I0(slv_reg1[0]),
        .I1(slv_reg0[0]),
        .O(bitwiseXor[0]));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \slv_reg6[10]_i_1 
       (.I0(slv_reg1[10]),
        .I1(slv_reg0[10]),
        .O(bitwiseXor[10]));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \slv_reg6[11]_i_1 
       (.I0(slv_reg1[11]),
        .I1(slv_reg0[11]),
        .O(bitwiseXor[11]));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \slv_reg6[12]_i_1 
       (.I0(slv_reg1[12]),
        .I1(slv_reg0[12]),
        .O(bitwiseXor[12]));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \slv_reg6[13]_i_1 
       (.I0(slv_reg1[13]),
        .I1(slv_reg0[13]),
        .O(bitwiseXor[13]));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \slv_reg6[14]_i_1 
       (.I0(slv_reg1[14]),
        .I1(slv_reg0[14]),
        .O(bitwiseXor[14]));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \slv_reg6[15]_i_1 
       (.I0(slv_reg1[15]),
        .I1(slv_reg0[15]),
        .O(bitwiseXor[15]));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \slv_reg6[16]_i_1 
       (.I0(slv_reg1[16]),
        .I1(slv_reg0[16]),
        .O(bitwiseXor[16]));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \slv_reg6[17]_i_1 
       (.I0(slv_reg1[17]),
        .I1(slv_reg0[17]),
        .O(bitwiseXor[17]));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \slv_reg6[18]_i_1 
       (.I0(slv_reg1[18]),
        .I1(slv_reg0[18]),
        .O(bitwiseXor[18]));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \slv_reg6[19]_i_1 
       (.I0(slv_reg1[19]),
        .I1(slv_reg0[19]),
        .O(bitwiseXor[19]));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \slv_reg6[1]_i_1 
       (.I0(slv_reg1[1]),
        .I1(slv_reg0[1]),
        .O(bitwiseXor[1]));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \slv_reg6[20]_i_1 
       (.I0(slv_reg1[20]),
        .I1(slv_reg0[20]),
        .O(bitwiseXor[20]));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \slv_reg6[21]_i_1 
       (.I0(slv_reg1[21]),
        .I1(slv_reg0[21]),
        .O(bitwiseXor[21]));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \slv_reg6[22]_i_1 
       (.I0(slv_reg1[22]),
        .I1(slv_reg0[22]),
        .O(bitwiseXor[22]));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \slv_reg6[23]_i_1 
       (.I0(slv_reg1[23]),
        .I1(slv_reg0[23]),
        .O(bitwiseXor[23]));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \slv_reg6[24]_i_1 
       (.I0(slv_reg1[24]),
        .I1(slv_reg0[24]),
        .O(bitwiseXor[24]));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \slv_reg6[25]_i_1 
       (.I0(slv_reg1[25]),
        .I1(slv_reg0[25]),
        .O(bitwiseXor[25]));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \slv_reg6[26]_i_1 
       (.I0(slv_reg1[26]),
        .I1(slv_reg0[26]),
        .O(bitwiseXor[26]));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \slv_reg6[27]_i_1 
       (.I0(slv_reg1[27]),
        .I1(slv_reg0[27]),
        .O(bitwiseXor[27]));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \slv_reg6[28]_i_1 
       (.I0(slv_reg1[28]),
        .I1(slv_reg0[28]),
        .O(bitwiseXor[28]));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \slv_reg6[29]_i_1 
       (.I0(slv_reg1[29]),
        .I1(slv_reg0[29]),
        .O(bitwiseXor[29]));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \slv_reg6[2]_i_1 
       (.I0(slv_reg1[2]),
        .I1(slv_reg0[2]),
        .O(bitwiseXor[2]));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \slv_reg6[30]_i_1 
       (.I0(slv_reg1[30]),
        .I1(slv_reg0[30]),
        .O(bitwiseXor[30]));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \slv_reg6[31]_i_1 
       (.I0(slv_reg1[31]),
        .I1(slv_reg0[31]),
        .O(bitwiseXor[31]));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \slv_reg6[3]_i_1 
       (.I0(slv_reg1[3]),
        .I1(slv_reg0[3]),
        .O(bitwiseXor[3]));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \slv_reg6[4]_i_1 
       (.I0(slv_reg1[4]),
        .I1(slv_reg0[4]),
        .O(bitwiseXor[4]));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \slv_reg6[5]_i_1 
       (.I0(slv_reg1[5]),
        .I1(slv_reg0[5]),
        .O(bitwiseXor[5]));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \slv_reg6[6]_i_1 
       (.I0(slv_reg1[6]),
        .I1(slv_reg0[6]),
        .O(bitwiseXor[6]));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \slv_reg6[7]_i_1 
       (.I0(slv_reg1[7]),
        .I1(slv_reg0[7]),
        .O(bitwiseXor[7]));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \slv_reg6[8]_i_1 
       (.I0(slv_reg1[8]),
        .I1(slv_reg0[8]),
        .O(bitwiseXor[8]));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \slv_reg6[9]_i_1 
       (.I0(slv_reg1[9]),
        .I1(slv_reg0[9]),
        .O(bitwiseXor[9]));
  FDRE \slv_reg6_reg[0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseXor[0]),
        .Q(slv_reg6[0]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg6_reg[10] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseXor[10]),
        .Q(slv_reg6[10]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg6_reg[11] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseXor[11]),
        .Q(slv_reg6[11]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg6_reg[12] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseXor[12]),
        .Q(slv_reg6[12]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg6_reg[13] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseXor[13]),
        .Q(slv_reg6[13]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg6_reg[14] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseXor[14]),
        .Q(slv_reg6[14]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg6_reg[15] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseXor[15]),
        .Q(slv_reg6[15]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg6_reg[16] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseXor[16]),
        .Q(slv_reg6[16]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg6_reg[17] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseXor[17]),
        .Q(slv_reg6[17]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg6_reg[18] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseXor[18]),
        .Q(slv_reg6[18]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg6_reg[19] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseXor[19]),
        .Q(slv_reg6[19]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg6_reg[1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseXor[1]),
        .Q(slv_reg6[1]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg6_reg[20] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseXor[20]),
        .Q(slv_reg6[20]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg6_reg[21] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseXor[21]),
        .Q(slv_reg6[21]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg6_reg[22] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseXor[22]),
        .Q(slv_reg6[22]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg6_reg[23] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseXor[23]),
        .Q(slv_reg6[23]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg6_reg[24] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseXor[24]),
        .Q(slv_reg6[24]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg6_reg[25] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseXor[25]),
        .Q(slv_reg6[25]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg6_reg[26] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseXor[26]),
        .Q(slv_reg6[26]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg6_reg[27] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseXor[27]),
        .Q(slv_reg6[27]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg6_reg[28] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseXor[28]),
        .Q(slv_reg6[28]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg6_reg[29] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseXor[29]),
        .Q(slv_reg6[29]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg6_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseXor[2]),
        .Q(slv_reg6[2]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg6_reg[30] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseXor[30]),
        .Q(slv_reg6[30]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg6_reg[31] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseXor[31]),
        .Q(slv_reg6[31]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg6_reg[3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseXor[3]),
        .Q(slv_reg6[3]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg6_reg[4] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseXor[4]),
        .Q(slv_reg6[4]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg6_reg[5] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseXor[5]),
        .Q(slv_reg6[5]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg6_reg[6] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseXor[6]),
        .Q(slv_reg6[6]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg6_reg[7] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseXor[7]),
        .Q(slv_reg6[7]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg6_reg[8] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseXor[8]),
        .Q(slv_reg6[8]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg6_reg[9] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseXor[9]),
        .Q(slv_reg6[9]),
        .R(axi_awready_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \slv_reg7[0]_i_1 
       (.I0(slv_reg1[0]),
        .I1(slv_reg0[0]),
        .O(bitwiseXNor[0]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \slv_reg7[10]_i_1 
       (.I0(slv_reg1[10]),
        .I1(slv_reg0[10]),
        .O(bitwiseXNor[10]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \slv_reg7[11]_i_1 
       (.I0(slv_reg1[11]),
        .I1(slv_reg0[11]),
        .O(bitwiseXNor[11]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \slv_reg7[12]_i_1 
       (.I0(slv_reg1[12]),
        .I1(slv_reg0[12]),
        .O(bitwiseXNor[12]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \slv_reg7[13]_i_1 
       (.I0(slv_reg1[13]),
        .I1(slv_reg0[13]),
        .O(bitwiseXNor[13]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \slv_reg7[14]_i_1 
       (.I0(slv_reg1[14]),
        .I1(slv_reg0[14]),
        .O(bitwiseXNor[14]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \slv_reg7[15]_i_1 
       (.I0(slv_reg1[15]),
        .I1(slv_reg0[15]),
        .O(bitwiseXNor[15]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \slv_reg7[16]_i_1 
       (.I0(slv_reg1[16]),
        .I1(slv_reg0[16]),
        .O(bitwiseXNor[16]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \slv_reg7[17]_i_1 
       (.I0(slv_reg1[17]),
        .I1(slv_reg0[17]),
        .O(bitwiseXNor[17]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \slv_reg7[18]_i_1 
       (.I0(slv_reg1[18]),
        .I1(slv_reg0[18]),
        .O(bitwiseXNor[18]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \slv_reg7[19]_i_1 
       (.I0(slv_reg1[19]),
        .I1(slv_reg0[19]),
        .O(bitwiseXNor[19]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \slv_reg7[1]_i_1 
       (.I0(slv_reg1[1]),
        .I1(slv_reg0[1]),
        .O(bitwiseXNor[1]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \slv_reg7[20]_i_1 
       (.I0(slv_reg1[20]),
        .I1(slv_reg0[20]),
        .O(bitwiseXNor[20]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \slv_reg7[21]_i_1 
       (.I0(slv_reg1[21]),
        .I1(slv_reg0[21]),
        .O(bitwiseXNor[21]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \slv_reg7[22]_i_1 
       (.I0(slv_reg1[22]),
        .I1(slv_reg0[22]),
        .O(bitwiseXNor[22]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \slv_reg7[23]_i_1 
       (.I0(slv_reg1[23]),
        .I1(slv_reg0[23]),
        .O(bitwiseXNor[23]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \slv_reg7[24]_i_1 
       (.I0(slv_reg1[24]),
        .I1(slv_reg0[24]),
        .O(bitwiseXNor[24]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \slv_reg7[25]_i_1 
       (.I0(slv_reg1[25]),
        .I1(slv_reg0[25]),
        .O(bitwiseXNor[25]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \slv_reg7[26]_i_1 
       (.I0(slv_reg1[26]),
        .I1(slv_reg0[26]),
        .O(bitwiseXNor[26]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \slv_reg7[27]_i_1 
       (.I0(slv_reg1[27]),
        .I1(slv_reg0[27]),
        .O(bitwiseXNor[27]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \slv_reg7[28]_i_1 
       (.I0(slv_reg1[28]),
        .I1(slv_reg0[28]),
        .O(bitwiseXNor[28]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \slv_reg7[29]_i_1 
       (.I0(slv_reg1[29]),
        .I1(slv_reg0[29]),
        .O(bitwiseXNor[29]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \slv_reg7[2]_i_1 
       (.I0(slv_reg1[2]),
        .I1(slv_reg0[2]),
        .O(bitwiseXNor[2]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \slv_reg7[30]_i_1 
       (.I0(slv_reg1[30]),
        .I1(slv_reg0[30]),
        .O(bitwiseXNor[30]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \slv_reg7[31]_i_1 
       (.I0(slv_reg1[31]),
        .I1(slv_reg0[31]),
        .O(bitwiseXNor[31]));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \slv_reg7[3]_i_1 
       (.I0(slv_reg1[3]),
        .I1(slv_reg0[3]),
        .O(bitwiseXNor[3]));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \slv_reg7[4]_i_1 
       (.I0(slv_reg1[4]),
        .I1(slv_reg0[4]),
        .O(bitwiseXNor[4]));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \slv_reg7[5]_i_1 
       (.I0(slv_reg1[5]),
        .I1(slv_reg0[5]),
        .O(bitwiseXNor[5]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \slv_reg7[6]_i_1 
       (.I0(slv_reg1[6]),
        .I1(slv_reg0[6]),
        .O(bitwiseXNor[6]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \slv_reg7[7]_i_1 
       (.I0(slv_reg1[7]),
        .I1(slv_reg0[7]),
        .O(bitwiseXNor[7]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \slv_reg7[8]_i_1 
       (.I0(slv_reg1[8]),
        .I1(slv_reg0[8]),
        .O(bitwiseXNor[8]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \slv_reg7[9]_i_1 
       (.I0(slv_reg1[9]),
        .I1(slv_reg0[9]),
        .O(bitwiseXNor[9]));
  FDRE \slv_reg7_reg[0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseXNor[0]),
        .Q(slv_reg7[0]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg7_reg[10] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseXNor[10]),
        .Q(slv_reg7[10]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg7_reg[11] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseXNor[11]),
        .Q(slv_reg7[11]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg7_reg[12] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseXNor[12]),
        .Q(slv_reg7[12]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg7_reg[13] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseXNor[13]),
        .Q(slv_reg7[13]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg7_reg[14] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseXNor[14]),
        .Q(slv_reg7[14]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg7_reg[15] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseXNor[15]),
        .Q(slv_reg7[15]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg7_reg[16] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseXNor[16]),
        .Q(slv_reg7[16]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg7_reg[17] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseXNor[17]),
        .Q(slv_reg7[17]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg7_reg[18] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseXNor[18]),
        .Q(slv_reg7[18]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg7_reg[19] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseXNor[19]),
        .Q(slv_reg7[19]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg7_reg[1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseXNor[1]),
        .Q(slv_reg7[1]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg7_reg[20] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseXNor[20]),
        .Q(slv_reg7[20]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg7_reg[21] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseXNor[21]),
        .Q(slv_reg7[21]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg7_reg[22] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseXNor[22]),
        .Q(slv_reg7[22]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg7_reg[23] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseXNor[23]),
        .Q(slv_reg7[23]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg7_reg[24] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseXNor[24]),
        .Q(slv_reg7[24]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg7_reg[25] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseXNor[25]),
        .Q(slv_reg7[25]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg7_reg[26] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseXNor[26]),
        .Q(slv_reg7[26]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg7_reg[27] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseXNor[27]),
        .Q(slv_reg7[27]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg7_reg[28] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseXNor[28]),
        .Q(slv_reg7[28]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg7_reg[29] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseXNor[29]),
        .Q(slv_reg7[29]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg7_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseXNor[2]),
        .Q(slv_reg7[2]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg7_reg[30] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseXNor[30]),
        .Q(slv_reg7[30]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg7_reg[31] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseXNor[31]),
        .Q(slv_reg7[31]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg7_reg[3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseXNor[3]),
        .Q(slv_reg7[3]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg7_reg[4] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseXNor[4]),
        .Q(slv_reg7[4]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg7_reg[5] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseXNor[5]),
        .Q(slv_reg7[5]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg7_reg[6] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseXNor[6]),
        .Q(slv_reg7[6]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg7_reg[7] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseXNor[7]),
        .Q(slv_reg7[7]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg7_reg[8] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseXNor[8]),
        .Q(slv_reg7[8]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg7_reg[9] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bitwiseXNor[9]),
        .Q(slv_reg7[9]),
        .R(axi_awready_i_1_n_0));
  LUT3 #(
    .INIT(8'h20)) 
    slv_reg_rden
       (.I0(s00_axi_arvalid),
        .I1(s00_axi_rvalid),
        .I2(S_AXI_ARREADY),
        .O(slv_reg_rden__0));
  LUT2 #(
    .INIT(4'h6)) 
    sum_carry__6_i_1
       (.I0(slv_reg0[31]),
        .I1(slv_reg1[31]),
        .O(sum_carry__6_i_1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sum_carry__6_i_2
       (.I0(slv_reg0[30]),
        .I1(slv_reg1[30]),
        .O(sum_carry__6_i_2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sum_carry__6_i_3
       (.I0(slv_reg0[29]),
        .I1(slv_reg1[29]),
        .O(sum_carry__6_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    sum_carry__6_i_4
       (.I0(slv_reg0[28]),
        .I1(slv_reg1[28]),
        .O(sum_carry__6_i_4_n_0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
