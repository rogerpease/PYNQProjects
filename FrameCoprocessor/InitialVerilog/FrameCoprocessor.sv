module FrameCoprocessor 
#(

) 
( 
    input masterClock,  
    input reset,  

    input [31:0] dataIn,  
    input dataInAvailable, 
    input endOfFrameIn, 

    output reg [31:0] dataOut,  
    output dataOutAvailable, 
    output reg endOfFrameOut,

    /* verilator lint_off UNUSED */
    input  [31:0] configRegisterAddress,  
    input  [31:0] configRegisterDataIn,
    input         configRegisterWriteEnable,
    output reg [31:0] configRegisterDataOut 
    /* verilator lint_on UNUSED */

); 

   parameter FRAME_BUFFER_DEPTH = 32;  
   reg [32:0]FrameBuffer[FRAME_BUFFER_DEPTH-1:0]; 
   reg [$clog2(FRAME_BUFFER_DEPTH)-1:0] FrameBufferStart;
   reg [$clog2(FRAME_BUFFER_DEPTH)-1:0] FrameBufferEnd;

   always_ff @(posedge masterClock) 
   begin 
     if (reset) 
       FrameBufferStart <= 0; 
     else
     begin      
       if (dataInAvailable == 1) 
       begin 
         FrameBuffer[FrameBufferStart] <= {endOfFrameIn, dataIn}; 
         FrameBufferStart <= FrameBufferStart + 1; 
       end 
     end
   end 

   always_ff @(posedge masterClock) 
   begin 
     if (reset) 
       FrameBufferEnd <= 0; 
     else 
     begin 
       if (FrameBufferStart != FrameBufferEnd) 
       begin 
         dataOut <= FrameBuffer[FrameBufferEnd][31:0];
         endOfFrameOut <= FrameBuffer[FrameBufferEnd][32];
         FrameBufferEnd <= FrameBufferEnd + 1; 
         dataOutAvailable = 1; 
       end 
       else
       begin 
         dataOutAvailable = 1; 
       end 
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
