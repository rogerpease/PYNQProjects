
`timescale 1 ns / 1 ps

module SimpleAXIAsyncFIFO #
(

	parameter integer C_Control_DATA_WIDTH	= 32,

	parameter integer C_FIFO_DEPTH          = 32,

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

	// Ports of Axi Slave Bus Interface StreamDataIn
	input wire  streamdatain_aclk,
	input wire  streamdatain_aresetn,
	output reg streamdatain_tready,
	input wire [C_StreamDataIn_TDATA_WIDTH-1 : 0] streamdatain_tdata,
	input wire [(C_StreamDataIn_TDATA_WIDTH/8)-1 : 0] streamdatain_tstrb,
	input wire  streamdatain_tlast,
	input wire  streamdatain_tvalid,

	// Ports of Axi Master Bus Interface StreamDataOut
	input wire  streamdataout_aclk,
	input wire  streamdataout_aresetn,
	output reg streamdataout_tvalid,
	output reg [C_StreamDataOut_TDATA_WIDTH-1 : 0] streamdataout_tdata,
	output reg [(C_StreamDataOut_TDATA_WIDTH/8)-1 : 0] streamdataout_tstrb,
	output reg streamdataout_tlast,
	input wire  streamdataout_tready
);



   parameter DEBUG = 1;  
 
   reg [32:0]FrameBuffer[C_FIFO_DEPTH-1:0];  // 32 bits of data and the Last bit
   reg [$clog2(C_FIFO_DEPTH)-1:0] FIFOStart;
   reg [$clog2(C_FIFO_DEPTH)-1:0] FIFOEnd;

   // Take Data in. 
   always_ff @(posedge streamdatain_aclk) 
   begin 
     reg twoMoreSlots;

     if (streamdatain_aresetn == 0) 
     begin 
       $display("Reset"); 
       FIFOEnd <= 0; 
       streamdatain_tready <= 0; 
     end 
     else
     begin      
       // We're not at the end of the buffer or we're also able to send. 

       if (((FIFOEnd + 2) == FIFOStart) || ((FIFOEnd + 1)  == FIFOStart)      ) twoMoreSlots = 1; else twoMoreSlots = 0;

       if ((streamdatain_tvalid) && (streamdatain_tready))
       begin 
         FrameBuffer[FIFOEnd] <= {streamdataout_tlast, streamdatain_tdata}; 
         FIFOEnd <= FIFOEnd + 1; 
         if (DEBUG) $display("Took in Data ",streamdatain_tdata," ",FIFOEnd); 
       end 

       if (!twoMoreSlots)
       begin 
         streamdatain_tready <= 1; 
         if (DEBUG) $display("Data In Ready = 1"); 
       end 
       else  
       begin 
         streamdatain_tready <= 0; if (DEBUG) $display("Data In Ready = 0"); 
       end
     end
   end 

    

   always_ff @(posedge streamdataout_aclk) 
   begin 
     if (streamdataout_aresetn == 0) 
     begin 
       FIFOStart   <= 0; 
       streamdataout_tlast       <= 0; 
       streamdataout_tvalid      <= 0; 
       streamdataout_tstrb       <= 1; 
     end
     else 
     begin 
       streamdataout_tdata     <= FrameBuffer[FIFOStart][31:0];
       streamdataout_tlast     <= FrameBuffer[FIFOStart][32];
       if ((streamdataout_tready) && (FIFOStart != FIFOEnd))
       begin 
         FIFOStart <= FIFOStart + 1; 
       end
       else 
       begin
         FIFOStart <= FIFOStart; 
       end 
       if (FIFOStart != FIFOEnd)
         streamdataout_tvalid <= 1; 
       else 
         streamdataout_tvalid <= 0; 
     end
     streamdataout_tstrb <= 4'b1111;
   end 


endmodule
