module SimpleEdgeDetectCapture(
	input clk,  
	input reset, 
	input wire [7:0] captureData, // We capture on both edges. 
	input wire captureEdge,       
        output reg [15:0] numEdges,    // == 0 if no miscomps. Otherwise shows 2 sets of expected/actual
        output reg [15:0] numMiscompares,    // == 0 if no miscomps. Otherwise shows 2 sets of expected/actual
        output reg [15:0] miscompare1,  // == 0 if no miscomps. Otherwise shows 2 sets of expected/actual
        output reg [15:0] miscompare2,  // == 0 if no miscomps. Otherwise shows 2 sets of expected/actual
); 

   function [7:0] genPattern ( input [7:0] dataPattern);
     case (dataPattern)
       8'h81  :  genPattern = 8'h42; 
       8'h42  :  genPattern = 8'h24; 
       8'h24  :  genPattern = 8'h18; 
       8'h18  :  genPattern = 8'h81; 
       default:  genPattern = 8'h81; 
     endcase 
   endfunction 

   always @(posedge clk)
   begin 
     if (reset) begin
         captureEdge_q <= 0; 
         captureEdge_qq <= 0; 
         captureEdge_qqq <= 0; 
     end else begin  
         captureEdge_q <= captureEdge; 
         captureEdge_qq <= capureedge_q; 
         captureEdge_qqq <= capureedge_qq; 
     end
   end

   assign edgeDetected = (captureEdge_qqq != captureEdge_q); 
   reg edgeDetected_q; 
   reg captureData; 

   always @(clk)
   begin 
     if (reset) begin 
         cycle_q <= 0; 
         captureDataExpected = 8'h00; 
	 numEdges = 0; 
         numMiscompares = 0; 
         miscompare0 = 0;
         miscompare1 = 0;
     end
      else
        if (edgeDetected_q) begin 	      
	  numEdges = numEdges + 1; 
	  if (captureDataExpected != captureDataActual)    
          begin 
	     if (numMiscompares == 0) 
                miscompare0 = {captureDataExpected,captureDataActual}; 		  
	     if (numMiscompares == 1) 
                miscompare1 = {captureDataExpected,captureDataActual}; 		  
             numMiscompares = numMiscompares + 1; 
          end 
        end 
        edgeDetected_q      = 0;
        if (edgeDetected) begin 
           captureDataExpected = genPattern(captureDataExpected);
           captureDataActual   = captureData; 
	   edgeDetected_q      = edgeDetected; 
	end 
   end 
 	      
