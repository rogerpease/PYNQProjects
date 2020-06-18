module CDCGeneratorModule
(
    input asyncClk,  // This will be on a separate clock domain 
    input reset, 
    input startNotStop_falsePath,   // This can be a false path since it's only 1-bit from n

   //  I've set a usage requirement that parameter* values are only updated when 
   //  startNotStop is '0'.This way we can make them multicycle paths. 
   //  Normally I would think twice about doing something like that in a commercial product. 
   //  I had a case once where customers were reproggramming a DMA transfer mid-flight.  
   //   and it was confusing the peripheral. However for this case we should be fine. 

    input [7:0] parameterCycleDataToggles,         // if this is 5 
    input [7:0] parameterCycleEnableTogglesHigh,   // and this is 2 
    input [7:0] parameterCycleEnableTogglesLow,    // and this is 3  
                                                    // Then enable will be low 2 cycles, then go high, then go low
                                                    // at the third cycle and remain that way for a total of 6 cycles.
                                                    // on the 6th cycle, the data will toggle. 

    input [7:0]  parameterA, 
    input [7:0]  parameterB,     
    input [7:0]  parameterYinit, 

   // Output Data. 
    output [7:0]  captureDataValue, 
    output        captureEnable,

    // This can also be a multicycle path. 
    output reg [31:0] absoluteTickCounter 
);


  // Synchronizers for StartStop signal. 
  // Bring into our domain. 

  reg startNotStop_q; 
  reg startNotStop_qq; 
  
  always @(posedge asyncClk) 
  begin : SYNCHRONIZERBLOCK 
    startNotStop_q  <= startNotStop_falsePath;
    startNotStop_qq <= startNotStop_q;
  end 


  // This can be a Multicycle Path if we guarantee parameterCyclesPerOutputDataToggle >= 2 

  wire [7:0] nextGeneratedDataMultiCyclePath;
  assign nextGeneratedDataMultiCyclePath = parameterA*generatedData + parameterB;  

  // 
  // Generate 	
  // 
  reg [7:0] generatedData; 
  reg [7:0] generatedDataCycleCounter; 
  reg       generatedEnable; 

  always @(posedge asyncClk or posedge reset) begin : GENERATORBLOCK 
   if (reset == 1) begin
      absoluteTickCounter = 0; 
      generatedDataCycleCounter = 0; 
      generatedData             = parameterYinit;  
      generatedEnable           = 0;  
   end 
   else begin 
      if (startNotStop_qq) begin 
        absoluteTickCounter         <= absoluteTickCounter + 1; 
      end
      if (startNotStop_qq) begin 
        if (generatedDataCycleCounter == parameterCycleDataToggles) begin 
          generatedData             <= nextGeneratedDataMultiCyclePath;
          generatedDataCycleCounter <= 0; 
          generatedEnable           <= 0; 
        end else begin  
          generatedDataCycleCounter <= generatedDataCycleCounter + 1; 
        end 

        if (generatedDataCycleCounter == parameterCycleEnableTogglesHigh) begin
          generatedEnable <= 1; 
	    end 
        if (generatedDataCycleCounter == parameterCycleEnableTogglesLow) begin
          generatedEnable <= 0; 
     	end 
      end  

   end
  end

  assign captureDataValue   = {generatedData};
  assign captureEnable = generatedEnable; 

endmodule
