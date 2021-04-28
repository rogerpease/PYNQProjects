module FrameCoprocessor 
#(

) 
( 
    input masterClock,  
    input reset,  

    input [31:0]      dataIn,  
    input             dataInTValid, 
    output reg        dataInTReady, 
    input             dataInTLast, 

    output reg [31:0] dataOut,  
    output reg        dataOutTValid, 
    input             dataOutTReady, 
    output reg        dataOutTLast,

    /* verilator lint_off UNUSED */
    input  [31:0] configRegisterAddress,  
    input  [31:0] configRegisterDataIn,
    input         configRegisterWriteEnable,
    output reg [31:0] configRegisterDataOut 
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
   always_ff @(posedge masterClock) 
   begin 
     reg twoMoreSlots;

     if (reset) 
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

   always_ff @(posedge masterClock) 
   begin 
     if (reset) 
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

   parameter CONFIGREGISTERS = 32;  
   reg [31:0]ConfigRegisters[CONFIGREGISTERS-1:0]; 

   always_ff @(posedge masterClock) 
   begin 
     int i; 
     if (reset) 
     begin
       for (i = 0; i < CONFIGREGISTERS; i++) 
         ConfigRegisters[i] <= 0; 
     end
     else 
     begin 
       if (configRegisterWriteEnable) 
       begin 
         ConfigRegisters[configRegisterAddress] <= configRegisterDataIn; 
       end 
     end 
   end 

   always_ff @(posedge masterClock) configRegisterDataOut = ConfigRegisters[configRegisterAddress];  

endmodule
