module CDCCaptureModule 
(
    input clk,                  // Should be on processor bus's domain. 
    input reset, 
    input startNotStop_falsePath,

    input [7:0]  captureDataValue, 
    input        captureEnable,

    input [7:0]  parameterA,  
    input [7:0]  parameterB,     
    input [7:0]  parameterYinit, 
 
    output reg [7:0] miscompareCount, 
    output reg miscompareFlag,

    output reg [7:0] capturedDataValue,
    output reg capturedValueFlag,
    
    output reg [7:0] miscompareActual,
    output reg [7:0] miscompareExpected,

    // This can also be a multicycle path. 
    output reg [31:0] absoluteTickCounter
);


  reg captureEnable_q; 
  reg captureEnable_qq; 
  reg captureEnable_qqq;
  wire edgeDetected;
  reg edgeDetected_q; 
  
  always @(posedge clk) 
  begin
     captureEnable_q   <= captureEnable; 
     captureEnable_qq  <= captureEnable_q; 
  end    

  assign edgeDetected = (! captureEnable_qq) & (captureEnable_q);




  reg [7:0] comparatorValue; 
  wire [7:0] nextComparatorDataMultiCyclePath; 

  assign nextComparatorDataMultiCyclePath = parameterA*comparatorValue + parameterB;

  always @(posedge clk or posedge reset) begin : COMPAREVALUEBLOCK
   if (reset == 1) begin
     comparatorValue =  parameterYinit; 
     miscompareExpected = 0;
     miscompareActual   = 0; 
   end else begin 
     if (edgeDetected_q)  begin
       if (capturedDataValue != comparatorValue) begin
         
         if (miscompareCount == 0) begin 
           miscompareExpected = comparatorValue;
           miscompareActual   = capturedDataValue;
         end
         
         if (miscompareCount != 'hFF) 
           miscompareCount <= miscompareCount + 1; 
         miscompareFlag <= 1; 
         
       end
       comparatorValue =  nextComparatorDataMultiCyclePath; 
     end
   end 
  end
  
  reg startNotStop_q; 
  reg startNotStop_qq;
  
  always @(posedge clk)
  begin
    if (reset == 1) begin
      startNotStop_q  <= 0;
      startNotStop_qq <= 0;
    end else begin 
      startNotStop_q  <= startNotStop_falsePath;
      startNotStop_qq <= startNotStop_q;
    end 
 end  

  always @(posedge clk or posedge reset) 
  begin : CAPTUREBLOCK 
   if (reset == 1) begin
     miscompareCount <= 0; 
     capturedValueFlag <= 0; 
     miscompareFlag <= 0;
     edgeDetected_q <= 0;  
     absoluteTickCounter = 0; 
   end 
   else
   begin 
     edgeDetected_q <= edgeDetected;
     if (edgeDetected) begin
       capturedDataValue <= captureDataValue; 
       capturedValueFlag <= 1; 
     end 
     else 
       capturedValueFlag <= 0; 
   end
   absoluteTickCounter = absoluteTickCounter + 1; 
 end


endmodule
