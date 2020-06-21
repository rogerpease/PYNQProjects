module CDCSimpleToggler (
   input asyncClk,
   input clk, 
   input reset,
   input startNotStop_false,
   output [31:0] miscompareCycleCount,
   output [31:0] noMiscompareCycleCount

); 

  wire [31:0] captureDataValue;   
  wire captureDataExpected;   
  
CDCSimpleTogglerGenerator CDCSimpleTogglerGenerator_inst ( 
  
    .asyncClk(asyncClk),  
    .reset(reset),
    .startNotStop_false(startNotStop_false),  

    // Output Data. 
    .captureDataValue   (captureDataValue),
    .captureDataExpected(captureDataExpected)
);

CDCSimpleTogglerCapture CDCSimpleTogglerCapture_inst (
   .clk(clk),
   .reset(reset),

   .captureDataValue   (captureDataValue),
   .captureDataExpected(captureDataExpected),

   .noMiscompareCycleCount(noMiscompareCycleCount),
   .miscompareCycleCount  (miscompareCycleCount) 

);

  

endmodule;
