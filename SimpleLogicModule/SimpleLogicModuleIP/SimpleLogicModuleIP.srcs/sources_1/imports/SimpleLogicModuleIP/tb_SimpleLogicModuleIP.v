module tb_SimpleLogicModule();

   reg [31:0] a;
   reg [31:0] b; 
   wire [31:0] sum;
   wire [31:0] difference;
   wire [31:0] bitwiseAnd;
   wire [31:0] bitwiseOr;
   wire [31:0] bitwiseXor;
   wire [31:0] bitwiseXNor;

SimpleLogicModule SimpleLogicModule_inst (
    .a(a),
    .b(b),
    .sum(sum),
    .difference(difference),
    .bitwiseAnd(bitwiseAnd),
    .bitwiseOr(bitwiseOr),
    .bitwiseXor(bitwiseXor),
    .bitwiseXNor(bitwiseXNor)
    );

  //
  // Normally I would do a more comprehensive testbench but since this is an example I'm not really looking for a specific issue or corner. 
  //
    
  initial begin : TESTBLOCK
   integer i,j; 
   reg [63:0] expProduct; 
   for (i = 0; i < 32; i=i+1)
      for (j = 0; j < 32; j=j+1)
      begin  
        a = (1<<i)+ ('ha0a0a0a0);
        b = (1<<j)+ ('hF);
        #5
        if (sum != a + b) $stop("Sum Failed"); 
        if (difference != a - b) $stop("Difference Failed"); 
        if ((a & b) != bitwiseAnd) $stop("bitwiseAnd Failed"); 
        if ((a | b) != bitwiseOr)  $stop("bitwiseOr Failed"); 
        if ((a ^ b) != bitwiseXor) $stop("bitwiseAnd Failed"); 
        if ((a ~^ b) != bitwiseXNor)  $stop("bitwiseOr Failed"); 
      end
      $stop("Normal Termination");   
   end
  
  

endmodule
