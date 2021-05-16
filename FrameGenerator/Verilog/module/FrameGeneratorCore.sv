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
   input  reg dataOutReady

);

   parameter FORMAT = 0; 
   parameter HEIGHT = 1080; 
   parameter NUMPIXELPLANES = 3; 
   parameter WIDTH  = 1920; 
   parameter QUARTERWIDTH  = WIDTH/4; 
   
   reg [2:0] pixelPlane = 0; 
   reg [12:0] rowCounter = 0; 
   reg [12:0] colCounter = 0; 

   always @(posedge clk) 
   begin 
     if (reset == 1) 
       begin 
         pixelPlane = 0; 
         rowCounter = 0; 
         colCounter = 0; 
         dataOut      = 0; 
         dataOutValid <= 0; 
         dataOutLast  <= 0; 
       $display ("RESET == 1");  
       end 
     else  
       begin 
         if (dataOutReady == 1) 
         begin 
           if (FORMAT == 0) 
           begin 
//             $write("Row ",rowCounter, " Col ", colCounter, " pixel ",pixelPlane); 
             if ((rowCounter == (HEIGHT-1)) && (colCounter == (WIDTH-1)) && (pixelPlane == (NUMPIXELPLANES-1))) 
               dataOutLast <= 1; 
             else 
               dataOutLast <= 0; 

             if (colCounter < (QUARTERWIDTH)) 
                dataOut = (pixelPlane == 0) ? 8'hFF : 8'h00; // Red 
             else if (colCounter < (2*QUARTERWIDTH)) 
                dataOut = (pixelPlane == 1) ? 8'hFF : 8'h00; // Green
             else if (colCounter < (3*QUARTERWIDTH)) 
                dataOut = (pixelPlane == 2) ? 8'hFF : 8'h00; // Blue 
             else
                dataOut = 8'hFF;                 // White. 

//             $write(" DataOut ",dataOut,"\n");

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
         end 
         else
         begin  
           $display("DataOutReady ", dataOutReady); 
          // Do nothing  
         end 
         dataOutValid <= 1;
       end 

   end 

endmodule 
