module tb_AddSubMulAndOr();

   reg [31:0] a;
   reg [31:0] b; 
   wire [31:0] sum;
   wire [31:0] difference;
   wire [31:0] product; 
   wire [31:0] bitwiseAnd;
   wire [31:0] bitwiseOr;

AddSubMulAndOr AddSubMulAndOr_inst(
    .a(a),
    .b(b),
    .sum(sum),
    .difference(difference),
    .product(product),
    .bitwiseAnd(bitwiseAnd),
    .bitwiseOr(bitwiseOr)
    );
      
    
  initial begin : TESTBLOCK
   integer i,j; 
   for (i = 0; i < 32; i=i+1)
      for (j = 0; j < 32; j=j+1)
      begin  
        a = (1<<i)+ ('ha0a0a0a0);
        b = (1<<j)+ ('hF);
        #5
        if (sum != a + b) $stop("Sum Failed"); 
        if (difference != a - b) $stop("Difference Failed"); 
        if (product != a * b) $stop("Multiplier Failed"); 
        if ((a & b) != bitwiseAnd) $stop("bitwiseAnd Failed"); 
        if ((a | b) != bitwiseOr)  $stop("bitwiseOr Failed"); 
      end
      $stop("Normal Termination");   
   end
  
  
  
  
  
  

endmodule