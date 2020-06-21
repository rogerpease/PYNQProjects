module CDCSimpleTogglerCapture ( 
   input        clk,  
   input        reset,  

   input [31:0] captureDataValue,
   input        captureDataExpected,

   output reg [31:0]  noMiscompareCycleCount,
   output reg [31:0]  miscompareCycleCount 

);
  
   reg[31:0] previousCycleData; 
   
   always @(posedge clk) 
   begin : CAPTUREBLOCK 
     if (reset) begin 
       miscompareCycleCount = 0;
       noMiscompareCycleCount = 0;
     end else begin  
       if (previousCycleData != captureDataValue) // Data has changed. 
         if (captureDataValue != {32{captureDataExpected}}) 
            miscompareCycleCount = miscompareCycleCount + 1;
         else 
            noMiscompareCycleCount = noMiscompareCycleCount + 1; 

       previousCycleData = captureDataValue;
     end 
   end

endmodule 
