
`timescale 1 ns / 1 ps

	module FrameCoprocessor_v1_0 #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Slave Bus Interface Control
		parameter integer C_Control_DATA_WIDTH	= 32,
		parameter integer C_Control_ADDR_WIDTH	= 7,

		// Parameters of Axi Slave Bus Interface StreamDataIn
		parameter integer C_StreamDataIn_TDATA_WIDTH	= 32,

		// Parameters of Axi Master Bus Interface StreamDataOut
		parameter integer C_StreamDataOut_TDATA_WIDTH	= 32,
		parameter integer C_StreamDataOut_START_COUNT	= 32
	)
	(
		// Users to add ports here

		// User ports ends
		// Do not modify the ports beyond this line


		// Ports of Axi Slave Bus Interface Control
		input wire  control_aclk,
		input wire  control_aresetn,
		input wire [C_Control_ADDR_WIDTH-1 : 0] control_awaddr,
		input wire [2 : 0] control_awprot,
		input wire  control_awvalid,
		output wire  control_awready,
		input wire [C_Control_DATA_WIDTH-1 : 0] control_wdata,
		input wire [(C_Control_DATA_WIDTH/8)-1 : 0] control_wstrb,
		input wire  control_wvalid,
		output wire  control_wready,
		output wire [1 : 0] control_bresp,
		output wire  control_bvalid,
		input wire  control_bready,
		input wire [C_Control_ADDR_WIDTH-1 : 0] control_araddr,
		input wire [2 : 0] control_arprot,
		input wire  control_arvalid,
		output wire  control_arready,
		output wire [C_Control_DATA_WIDTH-1 : 0] control_rdata,
		output wire [1 : 0] control_rresp,
		output wire  control_rvalid,
		input wire  control_rready,

		// Ports of Axi Slave Bus Interface StreamDataIn
		input wire  streamdatain_aclk,
		input wire  streamdatain_aresetn,
		output wire  streamdatain_tready,
		input wire [C_StreamDataIn_TDATA_WIDTH-1 : 0] streamdatain_tdata,
		input wire [(C_StreamDataIn_TDATA_WIDTH/8)-1 : 0] streamdatain_tstrb,
		input wire  streamdatain_tlast,
		input wire  streamdatain_tvalid,

		// Ports of Axi Master Bus Interface StreamDataOut
		input wire  streamdataout_aclk,
		input wire  streamdataout_aresetn,
		output wire  streamdataout_tvalid,
		output wire [C_StreamDataOut_TDATA_WIDTH-1 : 0] streamdataout_tdata,
		output wire [(C_StreamDataOut_TDATA_WIDTH/8)-1 : 0] streamdataout_tstrb,
		output wire  streamdataout_tlast,
		input wire  streamdataout_tready
	);


// Instantiation of Axi Bus Interface Control
	FrameCoprocessor_v1_0_Control # ( 
		.C_S_AXI_DATA_WIDTH(C_Control_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_Control_ADDR_WIDTH)
	) FrameCoprocessor_v1_0_Control_inst (
                .configRegister0(configRegister0),
                .configRegister1(configRegister1),
                .LastStatus(LastStatus),
                .FrameBufferStatus(FrameBufferStatus),
                .FrameBuffer0(FrameBuffer0),
                .FrameBuffer1(FrameBuffer1),
                .FrameBuffer2(FrameBuffer2),
                .FrameBuffer3(FrameBuffer3),

		.S_AXI_ACLK(control_aclk),
		.S_AXI_ARESETN(control_aresetn),
		.S_AXI_AWADDR(control_awaddr),
		.S_AXI_AWPROT(control_awprot),
		.S_AXI_AWVALID(control_awvalid),
		.S_AXI_AWREADY(control_awready),
		.S_AXI_WDATA(control_wdata),
		.S_AXI_WSTRB(control_wstrb),
		.S_AXI_WVALID(control_wvalid),
		.S_AXI_WREADY(control_wready),
		.S_AXI_BRESP(control_bresp),
		.S_AXI_BVALID(control_bvalid),
		.S_AXI_BREADY(control_bready),
		.S_AXI_ARADDR(control_araddr),
		.S_AXI_ARPROT(control_arprot),
		.S_AXI_ARVALID(control_arvalid),
		.S_AXI_ARREADY(control_arready),
		.S_AXI_RDATA(control_rdata),
		.S_AXI_RRESP(control_rresp),
		.S_AXI_RVALID(control_rvalid),
		.S_AXI_RREADY(control_rready)
	);

    // Add user logic here

    FrameCoprocessorMain FrameCoprocessorMain_inst 
    (


    .dataIn       (streamdatain_tdata),
    .dataInClock  (streamdatain_aclk),
    .dataInResetN (streamdatain_aresetn),
    .dataInTValid (streamdatain_tvalid),
    .dataInTReady (streamdatain_tready),
    .dataInTLast  (streamdatain_tlast),
    .dataInTStrb  (streamdatain_tstrb),

    .dataOut      (streamdataout_tdata),
    .dataOutClock (streamdataout_aclk),
    .dataOutResetN(streamdataout_aresetn),
    .dataOutTValid(streamdataout_tvalid),
    .dataOutTReady(streamdataout_tready),
    .dataOutTLast (streamdataout_tlast),
    .dataOutTStrb (streamdataout_tstrb)


     );





	// User logic ends

	endmodule
