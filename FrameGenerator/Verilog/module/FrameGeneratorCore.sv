module FrameGeneratorCore 
#(
   parameter DATAOUTWIDTHBYTES = 1
)
(
   input clk,
   input reset, 

   output reg [DATAOUTWIDTHBYTES*8-1:0] dataOut,
   output reg dataOutLast,
   output reg dataOutValid,
   input  wire dataOutReady,

   input  wire [31:0] controlRegister,
   input  wire [31:0] dataOutLastPeriod,

   output wire [15:0] CoreID,
   output wire [31:0] rowColCounter  

);
  // Control Register 0:   0 = enable, bit 1 = reset 
   wire controlReset;
   assign controlReset = controlRegister[1]; 

   wire controlEnable;
   assign controlEnable = controlRegister[0]; 

   parameter FORMAT = 0; 
   parameter NUMPIXELPLANES = 3; 
   parameter HEIGHT         = 1080; 
   parameter WIDTH          = 1920; 
   parameter QUARTERWIDTH   = WIDTH/4; 
   parameter LastPeriod     = 256; 

   
   reg [2:0] pixelPlane; 
   reg [12:0] rowCounter; 
   reg [12:0] colCounter; 
   reg [24:0] dataOutLastIndex; 

   assign rowColCounter = { 3'b000,rowCounter,3'b000,colCounter }; 

   always @(posedge clk) 
   begin 
     if ((reset == 0) || (controlReset == 1)) 
       begin 
         pixelPlane = 0; 
         rowCounter = 0; 
         colCounter = 0; 
         dataOut      = 0; 
         dataOutValid      <= 0; 
         dataOutLast       <= 0; 
         dataOutLastIndex  <= 0; 
       $display ("RESET == 1");  
       end 
     else  
       begin 
         if ((dataOutReady == 1) && (controlEnable == 1))
         begin 
           if (FORMAT == 0) 
           begin 
             if (dataOutLastIndex == dataOutLastPeriod[24:0]) 
             begin 
               dataOutLast <= 1; 
               dataOutLastIndex <= 0; 
             end 
             else 
             begin 
               dataOutLast <= 0; 
               dataOutLastIndex <= dataOutLastIndex + 1; 
             end 

             if (colCounter < (QUARTERWIDTH)) 
                dataOut = (pixelPlane == 0) ? 8'hFF : 8'h00; // Red 
             else if (colCounter < (2*QUARTERWIDTH)) 
                dataOut = (pixelPlane == 1) ? 8'hFF : 8'h00; // Green
             else if (colCounter < (3*QUARTERWIDTH)) 
                dataOut = (pixelPlane == 2) ? 8'hFF : 8'h00; // Blue 
             else
                dataOut = 8'hFF;                 // White. 

             $display("ColCounter: ",colCounter, " RowCounter ",rowCounter," pixelPlane ", pixelPlane," DataOut ",dataOut); 

             pixelPlane = (pixelPlane + 1) % NUMPIXELPLANES; 
             if (pixelPlane == 0) 
               colCounter = (colCounter + 1) % WIDTH;  
             if ((colCounter == 0) && (pixelPlane == 0)) 
               rowCounter = (rowCounter + 1) % HEIGHT;  
           end 
           else 
           begin 
             $display(" FORMAT != 0 ", dataOutReady); 
           end
           dataOutValid <= 1;
         end 
         else
         begin  
           $display("DataOutReady ", dataOutReady); 
          // Do nothing  
           dataOutValid <= 0;
         end 
       end 

   end 

   assign CoreID = 16'h0DEB;

endmodule 
