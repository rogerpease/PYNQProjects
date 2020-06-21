module tb_CDCSimpleToggler (); 

   reg asyncClk;
   reg clk;
   reg reset; 
   reg startNotStop_false;

   wire [31:0] miscompareCycleCount;
   wire [31:0] noMiscompareCycleCount;

   always begin 
    asyncClk = 0;
    #6;
    asyncClk = 1;
    #6; 
   end
   
   always begin 
    clk = 0;
    #7;
    clk = 1;
    #6; 
   end



   initial begin 
     $display("STARTED"); 
     startNotStop_false = 0; 
     reset = 1;
     #200;
     reset = 0; 
     #200;
     startNotStop_false = 1; 
     #10000;
     if (miscompareCycleCount != 0) $stop();  
     if (noMiscompareCycleCount != 104) begin $display(noMiscompareCycleCount," = noMiscompareCycleCount"); $stop("FAIL"); end
     $display("PASS"); 
     $stop(); 
   end
   
  CDCSimpleToggler CDCSimpleToggler_inst (
   .asyncClk(asyncClk),
   .clk(clk),
   .reset(reset),
   .startNotStop_false(startNotStop_false),
   .miscompareCycleCount(miscompareCycleCount),
   .noMiscompareCycleCount(noMiscompareCycleCount)
  ); 
   

  

endmodule;
