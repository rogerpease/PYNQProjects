module CDCSimpleTogglerGenerator
#(
    parameter cyclesPerDataToggle = 7
 )
 (
    input asyncClk,  // This will be on a separate clock domain 
    input reset,
    input startNotStop_false,   // This can be a false path since it's only 1-bit from n

    // Output Data. 
    output reg [31:0] captureDataValue,
    output reg captureDataExpected

);

  

  // Synchronizers for StartStop signal. 
  // Bring into our domain. 

  reg startNotStop_q; 
  reg startNotStop_qq; 
  always @(posedge asyncClk) 
  begin : SYNCHRONIZERBLOCK 
    startNotStop_q  <= startNotStop_false;
    startNotStop_qq <= startNotStop_q;
  end 


  // 
  // 	
  // 
  reg [7:0] genDataCycle;

  always @(posedge asyncClk or posedge reset) begin : GENERATORBLOCK 
   if (reset == 1) begin
      genDataCycle              = 0;  
      captureDataValue          = 0; 
      captureDataExpected       = 0;
   end 
   else begin 
      if (startNotStop_qq) begin 
         if (genDataCycle == 0) 
           captureDataExpected  = ~captureDataExpected;
         else if (genDataCycle == cyclesPerDataToggle-1) 
           captureDataValue   = ~captureDataValue;
         
         if (genDataCycle == cyclesPerDataToggle)
           genDataCycle = 0;      
         else 
           genDataCycle = genDataCycle+1;  

      end
    end
  end


endmodule
