
`timescale 1 ns / 1 ps

	module SBNModule  #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Slave Bus Interface SBNDatapath
		parameter integer C_SBNDatapath_DATA_WIDTH	= 32,
		parameter integer C_SBNDatapath_ADDR_WIDTH	= 7
	)
	(
		// Users to add ports here


		// User ports ends
		// Do not modify the ports beyond this line


		// Ports of Axi Slave Bus Interface SBNDatapath
		input wire  sbndatapath_aclk,
		input wire  sbndatapath_aresetn,
		input wire [C_SBNDatapath_ADDR_WIDTH-1 : 0] sbndatapath_awaddr,
		input wire [2 : 0] sbndatapath_awprot,
		input wire  sbndatapath_awvalid,
		output wire  sbndatapath_awready,
		input wire [C_SBNDatapath_DATA_WIDTH-1 : 0] sbndatapath_wdata,
		input wire [(C_SBNDatapath_DATA_WIDTH/8)-1 : 0] sbndatapath_wstrb,
		input wire  sbndatapath_wvalid,
		output wire  sbndatapath_wready,
		output wire [1 : 0] sbndatapath_bresp,
		output wire  sbndatapath_bvalid,
		input wire  sbndatapath_bready,
		input wire [C_SBNDatapath_ADDR_WIDTH-1 : 0] sbndatapath_araddr,
		input wire [2 : 0] sbndatapath_arprot,
		input wire  sbndatapath_arvalid,
		output wire  sbndatapath_arready,
		output wire [C_SBNDatapath_DATA_WIDTH-1 : 0] sbndatapath_rdata,
		output wire [1 : 0] sbndatapath_rresp,
		output wire  sbndatapath_rvalid,
		input wire  sbndatapath_rready
	);

        wire [31:0] reg0;   // Instructions 0..15
        wire [31:0] reg1;
        wire [31:0] reg2;
        wire [31:0] reg3;
        wire [31:0] reg4;
        wire [31:0] reg5;
        wire [31:0] reg6;
        wire [31:0] reg7;
        wire [31:0] reg8;
        wire [31:0] reg9;
        wire [31:0] reg10;
        wire [31:0] reg11;
        wire [31:0] reg12;
        wire [31:0] reg13;
        wire [31:0] reg14;
        wire [31:0] reg15;
        wire [31:0] reg16;  // Bit 2 is done, 1 is enable, 0 is reset (active high) 
        wire [31:0] reg17;  // Reg Write Enable[8], Reg write Addr[7:0]
        wire [31:0] reg18;  // Reg Write Data
        wire [31:0] reg19;  // Reg Read  Data
        wire [31:0] reg20;  // IP 
        wire [31:0] reg21;
        wire [31:0] reg22;
        wire [31:0] reg23;
        wire [31:0] reg24;
        wire [31:0] reg25;
        wire [31:0] reg26;
        wire [31:0] reg27;
        wire [31:0] reg28; 
        wire [31:0] reg29; 
        wire [31:0] reg30; 
        wire [31:0] reg31; // 0x0DEBAC7E

        wire SBNDatapathDone;
        wire [31:0] SBNDatapathIP;
        wire [31:0] SBNReadData;
        wire [31:0] SBNDatapathReset;
        wire [31:0] SBNDatapathEnable;
        wire [31:0] debugBus;

// Instantiation of Axi Bus Interface SBNDatapath
	SBNModule_v1_0_DatapathControl # ( 
		.C_S_AXI_DATA_WIDTH(C_SBNDatapath_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_SBNDatapath_ADDR_WIDTH)
	) SBNModule_v1_0_DatapathControl (
        .reg0(reg0),
        .reg1(reg1),
        .reg2(reg2),
        .reg3(reg3),
        .reg4(reg4),
        .reg5(reg5),
        .reg6(reg6),
        .reg7(reg7),
        .reg8(reg8),
        .reg9(reg9),
        .reg10(reg10),
        .reg11(reg11),
        .reg12(reg12),
        .reg13(reg13),
        .reg14(reg14),
        .reg15(reg15),
        .reg16(reg16),
        .reg17(reg17),
        .reg18(reg18),
        .reg19(reg19),
        .reg20(reg20),
        .reg21(reg21),
        .reg22(reg22),
        .reg23(reg23),
        .reg24(reg24),
        .reg25(reg25),
        .reg26(reg26),
        .reg27(reg27),
        .reg28(reg28),
        .reg29(reg29),
        .reg30(reg30),
        .reg31(reg31),
        .SBNDatapathDone(SBNDatapathDone),
        .SBNDatapathIP(SBNDatapathIP),
        .SBNReadData(SBNReadData),
        .SBNDatapathEnable(SBNDatapathEnable),
        .SBNDatapathReset(SBNDatapathReset),
        .debugBus(debugBus),

		.S_AXI_ACLK(sbndatapath_aclk),
		.S_AXI_ARESETN(sbndatapath_aresetn),
		.S_AXI_AWADDR(sbndatapath_awaddr),
		.S_AXI_AWPROT(sbndatapath_awprot),
		.S_AXI_AWVALID(sbndatapath_awvalid),
		.S_AXI_AWREADY(sbndatapath_awready),
		.S_AXI_WDATA(sbndatapath_wdata),
		.S_AXI_WSTRB(sbndatapath_wstrb),
		.S_AXI_WVALID(sbndatapath_wvalid),
		.S_AXI_WREADY(sbndatapath_wready),
		.S_AXI_BRESP(sbndatapath_bresp),
		.S_AXI_BVALID(sbndatapath_bvalid),
		.S_AXI_BREADY(sbndatapath_bready),
		.S_AXI_ARADDR(sbndatapath_araddr),
		.S_AXI_ARPROT(sbndatapath_arprot),
		.S_AXI_ARVALID(sbndatapath_arvalid),
		.S_AXI_ARREADY(sbndatapath_arready),
		.S_AXI_RDATA(sbndatapath_rdata),
		.S_AXI_RRESP(sbndatapath_rresp),
		.S_AXI_RVALID(sbndatapath_rvalid),
		.S_AXI_RREADY(sbndatapath_rready)
	);


	// Add user logic here

        wire [32*32-1:0] instructions; 
        assign SBNDatapathReset = reg16[0] || !sbndatapath_aresetn;
        assign SBNDatapathEnable = reg16[1]; 
        
        SBNDatapath SBNDatapath_inst
         (
           .clk(sbndatapath_aclk),
           .reset(SBNDatapathReset),
           .enable(SBNDatapathEnable),

           .regAddr       (reg17[7:0]),
           .regWriteData  (reg18),
           .regWriteEnable(reg17[8]),
           .regReadData   (SBNReadData),
           .InstructionsExecuted(debugBus),

           .done(SBNDatpathDone),
           .IP(SBNDatapathIP),
           .instructions(instructions)

        );

        assign instructions = { 
                         reg15, reg14, reg13, reg12,
                         reg11, reg10, reg9, reg8,
                         reg7, reg6, reg5, reg4,
                         reg3, reg2, reg1, reg0};

	// User logic ends

	endmodule
