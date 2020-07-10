module SimpleEdgeDetectGenerator(
	input wire [7:0] parameter_cycleLength, 
	input wire [7:0] parameter_edgeToggleCycle, 
	input wire [7:0] parameter_dataToggleCycle, 
	input clk, 
	input reset, 
	input startNotStop,  // synchronized into clk's domain. 
	output reg [7:0] captureData,
	output reg       captureEdge

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

   reg startNotStop_q, startNotStop_qq; 

   always @(posedge clk or posedge reset) begin  
     if (reset) 
     begin 
	   startNotStop_q <= startNotStop; 
           startNotStop_qq <= startNotStop_q;  
     end  else begin 
	   startNotStop_q <= startNotStop; 
           startNotStop_qq <= startNotStop_q;  
     end    
   end  
	   


   reg toggleCycle_q = 0; 
   always @(clk)
   begin 
      if (reset) 
         cycle_q <= 0; 
         captureData <= 8'h55;
         captureEdge <= 0; 
      else
        if (startNotStop_qq) begin  

	   if (cycle_q == parameter_dataToggleCycle) 
             captureData <= genPattern(captureData); 
           //	
           // We capture on both edges. 
	   //
	   if (cycle_q == parameter_edgeToggleCycle) 
             captureEdge <= ~captureEdge; 

            cycle_q = cycle_q + 1; 
            if (cycle_q == parameter_cycleLength)
		cycle_q = 0; 
	end 
   end 
 	      
