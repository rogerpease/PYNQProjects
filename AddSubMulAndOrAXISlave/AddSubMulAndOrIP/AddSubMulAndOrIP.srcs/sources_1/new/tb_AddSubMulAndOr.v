module tb_AddSubMulAndOr();

   reg [31:0] a;
   reg [31:0] b; 
   wire [31:0] sum;
   wire [31:0] difference;
   wire [31:0] productLSB; 
   wire [31:0] productMSB; 
   wire [63:0] product; 
   wire [31:0] bitwiseAnd;
   wire [31:0] bitwiseOr;

AddSubMulAndOr AddSubMulAndOr_inst(
    .a(a),
    .b(b),
    .sum(sum),
    .difference(difference),
    .productLSB(productLSB),
    .productMSB(productMSB),
    .bitwiseAnd(bitwiseAnd),
    .bitwiseOr(bitwiseOr)
    );
   assign product = {productMSB,productLSB} ;    

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
	expProduct = a * b; 
        if (product != expProduct) $stop("Multiplier Failed"); 
        if ((a & b) != bitwiseAnd) $stop("bitwiseAnd Failed"); 
        if ((a | b) != bitwiseOr)  $stop("bitwiseOr Failed"); 
      end
      $stop("Normal Termination");   
   end
  
  

endmodule
