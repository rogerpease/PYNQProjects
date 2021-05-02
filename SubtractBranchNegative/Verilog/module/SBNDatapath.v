//
//  Instruction format:
//     32 registers, 32 bits wide, R0 is always 0
//
//   Bits7-0  subtrahend 
//   Bits15-8 minuend  
//   Bits23-16 destination (always a register number)
//   Bits31-26 Branch Offset 
//   Bits24: subtrahend is constant (1), register (0) 
//   Bits25: minuend is constant (1), register (0) 
//    
//   Subtract 0 
// 
module SBNDatapath (
   input clk,
   input reset,
   input enable,
   output done,
   output wire IP, 
   input reg [31:0][31:0] instructions, 
);

   reg [31:0] InstructionPointer; 
   
    always @(clk)
      reg[7:0] subtrahend;
      reg[7:0] minuend;
      reg[7:0] destination;
      reg subtrahendConstant;
      reg minuendConstant;
      reg[5:0] offset;
      reg[31:0] difference;
      reg[31:0] instruction;
    begin  
      if (enable) 
      begin 
        instruction = instructions[InstructionPointer][24];
        subtrahendConstant = instruction[24];
        minuendConstant    = instruction[25];
        offset             = instruction[31:26];
        if (subtrahendConstant) 
          subtrahend = RegisterFile[instruction[7:0]];  
        else 
          subtrahend = { {24{instruction[15]}},  8{instruction[15:8]}}; 
        if (minuendConstant) 
          minuend = RegisterFile[instruction[15:8]];  
        else 
          minuend = { {24{instruction[15]}},  8{instruction[15:8]}}; 
        difference = subtrahend-minuend; 
        RegisterFile[instruction[20:16]] = difference; 
        if (instruction == 0)
          done = 1; 
        if (difference[31] == 1) 
          InstructionPointer = InstructionPointer + {{26{instruction[31]},6{instruction[31:26]}}}; 
        else 
          InstructionPointer = InstructionPointer + 1;
         
      end 
      else
      begin 
        InstructionPointer = 0;  
        done = 0; 
      end 
      IP <= InstructionPointer;
    end 

endmodule
