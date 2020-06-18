module tb_GenerateCapture(); 

  wire [31:0] genAbsoluteTickCounter; 
  reg procClk;
  reg asyncClk;
  reg asyncReset; 
  reg startNotStop; 
  reg[7:0] parameterCycleDataToggles;          
  reg[7:0] parameterCycleEnableTogglesHigh; 
  reg[7:0] parameterCycleEnableTogglesLow;

  reg[7:0] parameterA;          
  reg[7:0] parameterB; 
  reg[7:0] parameterYinit;

  wire [7:0] captureDataValue; 
  wire       captureEnable; 
  wire [31:0]     genAbsoluteTickCounter; 
  wire [31:0] captureAbsoluteTickCounter; 

  wire       miscompareFlag; 
  wire [7:0] miscompareCount;
  wire [7:0] capturedDataValue; 
  

  always begin
    procClk = 0; 
    #5;
    procClk = 1; 
    #5;
  end
  always begin
    asyncClk = 0; 
    #7;
    asyncClk = 1; 
    #7;
  end
  initial begin
     asyncReset = 1;
     parameterA = 1;
     parameterB = 1;
     parameterYinit = 0;
     parameterCycleDataToggles = 5;
     parameterCycleEnableTogglesHigh = 1;
     parameterCycleEnableTogglesLow = 3;
     startNotStop = 0;  
     #100 asyncReset = 0;
     #200 startNotStop = 1;
     
  end 

CDCGeneratorModule CDCGeneratorModule_inst 
(
    .asyncClk(asyncClk),
    .reset(asyncReset),
    .startNotStop_falsePath(startNotStop),   

    .parameterCycleDataToggles (parameterCycleDataToggles),          
    .parameterCycleEnableTogglesHigh(parameterCycleEnableTogglesHigh), 
    .parameterCycleEnableTogglesLow(parameterCycleEnableTogglesLow),

    .parameterA(parameterA), 
    .parameterB(parameterB), 
    .parameterYinit(parameterYinit), 

   // Output Data.
    .captureDataValue(captureDataValue),
    .captureEnable(captureEnable),

    // This can also be a multicycle path.
    .absoluteTickCounter(genAbsoluteTickCounter) 
);


CDCCaptureModule CDCCaptureModule_inst 
(
    .clk(procClk), 
    .reset(asyncReset), 

    .captureDataValue(captureDataValue),
    .captureEnable(captureEnable),

    .parameterA(parameterA),
    .parameterB(parameterB),
    .parameterYinit(parameterYinit),

    .miscompareCount(miscompareCount),
    .miscompareFlag(miscompareFlag),

    .capturedDataValue(capturedDataValue), 
    .capturedValueFlag(capturedValueFlag), 

    // This can also be a multicycle path.
    .absoluteTickCounter(captureAbsoluteTickCounter)
);


endmodule 
