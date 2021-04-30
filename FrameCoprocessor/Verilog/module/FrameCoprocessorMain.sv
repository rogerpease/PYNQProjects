module FrameCoprocessor 
#(

) 
( 

    input [31:0]      dataIn,  
    input [31:0]      dataInClock,  
    input [31:0]      dataInResetN,  
    input             dataInTValid, 
    output reg        dataInTReady, 
    input             dataInTLast, 
    input  reg [3:0]  dataInTStrb,

    output reg [31:0] dataOut,  
    input [31:0]      dataOutClock,  
    input [31:0]      dataOutResetN,  
    output reg        dataOutTValid, 
    input             dataOutTReady, 
    output reg        dataOutTLast,
    output reg [3:0]  dataOutTStrb,

    /* verilator lint_off UNUSED */
    input  [31:0] configRegister0
    /* verilator lint_on UNUSED */

); 

   initial begin 
     $display("[%0t] Tracing to logs/vlt_dump.vcd...\n", $time);
     $dumpfile("logs/vlt_dump.vcd");
     $dumpvars();
   end 

   parameter DEBUG = 1;  
 
   parameter FRAME_BUFFER_DEPTH = 32;  
   reg [32:0]FrameBuffer[FRAME_BUFFER_DEPTH-1:0];  // 32 bits of data and the EOF bit
   reg [$clog2(FRAME_BUFFER_DEPTH)-1:0] FrameBufferStart;
   reg [$clog2(FRAME_BUFFER_DEPTH)-1:0] FrameBufferEnd;

   // Take Data in. 
   always_ff @(posedge dataInClock,negedge dataInResetN) 
   begin 
     reg twoMoreSlots;

     if (dataInResetN == 0) 
     begin 
       $display("Reset"); 
       FrameBufferStart <= 0; 
       dataInTReady <= 0; 
     end 
     else
     begin      
                                        // We're not at the end of the buffer or we're also able to send. 

       if (((FrameBufferEnd + 2) == FrameBufferStart) ||
          ((FrameBufferEnd + 1)  == FrameBufferStart)      ) twoMoreSlots = 1; else twoMoreSlots = 0;

       if (DEBUG) $display("IN: DIA  ", dataInTValid, " FBS ",FrameBufferStart," FBE ", FrameBufferEnd, " DOR " , dataOutTReady, " Two more slots ",twoMoreSlots); 

       if ((dataInTValid) && (dataInTReady))
       begin 
         FrameBuffer[FrameBufferEnd] <= {dataInTLast, dataIn}; 
         FrameBufferEnd <= FrameBufferEnd + 1; 
         if (DEBUG) $display("Took in Data ",dataIn," ",FrameBufferEnd); 
       end 

       if (!twoMoreSlots)
       begin 
         dataInTReady <= 1; 
         if (DEBUG) $display("Data In Ready = 1"); 
       end 
       else  
       begin 
         dataInTReady <= 0; 
         if (DEBUG) $display("Data In Ready = 0"); 
       end
     end
   end 

   always_ff @(posedge dataOutClock, negedge dataOutResetN) 
   begin 
     if (dataOutResetN == 0) 
       FrameBufferStart   <= 0; 
     else 
     begin 
       if ((dataOutTReady) && (FrameBufferStart != FrameBufferEnd)) 
       begin 
         dataOut          <= FrameBuffer[FrameBufferStart][31:0];
         dataOutTLast     <= FrameBuffer[FrameBufferStart][32];
         FrameBufferStart <= FrameBufferStart + 1; 
       end 
       if ((dataOutTReady) && (FrameBufferStart != FrameBufferEnd))
         dataOutTValid = 1; 
       else 
         dataOutTValid = 0; 
     end
   end 



endmodule
