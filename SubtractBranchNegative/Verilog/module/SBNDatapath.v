//
//  Instruction format:
//     32 registers, 32 bits wide, R0 is always 0
//
//   Bits7-0  subtrahend 
//   Bits15-8 minuend  
//   Bits23-16 destination (always a register number)
//   Bits31-28 Branch Offset 
//   Bits24: subtrahend is constant (1), register (0) 
//   Bits25: minuend is constant (1), register (0) 
//    
//   Subtract 0 
// 

module SBNDatapath 
#(
  parameter INSTRUCTIONMEMDEPTH = 32,
  parameter INSTRUCTIONWIDTH = 32,
  parameter REGISTERFILEWIDTH = 16,
  parameter REGISTERFILEDEPTH = 32
)
(
   input clk,
   input reset,
   input enable,

   input       [$clog2(REGISTERFILEDEPTH)-1:0]  regAddr, 
   input       [REGISTERFILEWIDTH-1:0]          regWriteData, 
   input                                        regWriteEnable, 
   output wire [REGISTERFILEWIDTH-1:0]          regReadData, 

   output reg done,
   output wire [$clog2(INSTRUCTIONMEMDEPTH)-1:0] IP, 
   input [INSTRUCTIONMEMDEPTH*INSTRUCTIONWIDTH:0] instructions

);

   parameter DEBUG = 0; 
   parameter REGISTERFILEINDEX = $clog2(REGISTERFILEDEPTH); 
   reg [$clog2(INSTRUCTIONMEMDEPTH)-1:0] InstructionPointer; 
   reg [REGISTERFILEWIDTH-1:0] RegisterFile[REGISTERFILEDEPTH-1:0]; 

   wire [$clog2(INSTRUCTIONMEMDEPTH):0] BranchIP;
   wire [$clog2(INSTRUCTIONMEMDEPTH):0] NextIP;
   wire [INSTRUCTIONWIDTH-1:0]          instruction;
   wire [4:0] target;


   assign target = instruction[20:16];

   assign instruction = instructions[InstructionPointer*INSTRUCTIONWIDTH+31-:32];
  
   /* verilator lint_off width */ 
   assign NextIP = InstructionPointer + 1;
   assign BranchIP = InstructionPointer + {instruction[31],instruction[31:28]}; 
   /* verilator lint_on width */ 
   
    always @(posedge clk)
    begin  : Datapath
      reg[REGISTERFILEWIDTH-1:0] subtrahend;
      reg[REGISTERFILEWIDTH-1:0] minuend;
      reg[REGISTERFILEWIDTH-1:0] destination;
      reg subtrahendConstant;
      reg minuendConstant;
      reg[5:0] offset;
      reg[4:0] registerNum; 
      reg[31:0] difference;
      if (DEBUG) begin 
        $display("Instruction Pointer %h" , InstructionPointer); 
        $display("Instruction         %h" , instruction); 
      end 

      if (reset) 
      begin 
        done = 0;
        // Loops are a pain here because if I declare a reg[5:0] I will get width mismatches.
        // If I declare reg[4:0] I will loop forever trying to hit 32 (I will roll over at 31). 
        RegisterFile[0] = 0; RegisterFile[1] = 0; RegisterFile[2] = 0; RegisterFile[3] = 0; 
        RegisterFile[4] = 0; RegisterFile[5] = 0; RegisterFile[6] = 0; RegisterFile[7] = 0; 
        RegisterFile[8] = 0; RegisterFile[9] = 0; RegisterFile[10] = 0; RegisterFile[11] = 0; 
        RegisterFile[12] = 0; RegisterFile[13] = 0; RegisterFile[14] = 0; RegisterFile[15] = 0; 
        RegisterFile[16] = 0; RegisterFile[17] = 0; RegisterFile[18] = 0; RegisterFile[19] = 0; 
      end 
      else 
      begin 
        if (DEBUG) 
        begin  
          $display("Before"); 
          $display("RegisterFile0: ",RegisterFile[0]); 
          $display("RegisterFile1: ",RegisterFile[1]); 
          $display("RegisterFile2: ",RegisterFile[2]); 
          $display("RegisterFile3: ",RegisterFile[3]); 
        end 
        if (enable && !done) 
        begin 
         // for 10-4, 10 is minuend and 4 is subtrahend. 
          subtrahendConstant = instruction[24];
          minuendConstant    = instruction[25];
          offset             = instruction[31:26];
  
        if (DEBUG) 
        begin  
          $display("subtrahend constant ", subtrahendConstant);
          $display("minuend constant ", minuendConstant); 
        end 
          /* verilator lint_off width */ 

          if (subtrahendConstant) 
            subtrahend = $signed(instruction[7:0]); 
          else 
            subtrahend = RegisterFile[instruction[7:0]];  
  
          if (minuendConstant) 
            minuend = $signed(instruction[15:8]); 
          else 
            minuend = RegisterFile[instruction[15:8]];  
          difference = $signed(minuend) - $signed(subtrahend); 
          $display("SUBTRACT ", $signed(minuend)," - ",$signed(subtrahend), " = ", $signed(difference)," store to R",target);  
           

          if (target != 0) 
            RegisterFile[target] <= difference; 

          if (instruction == 0)
          begin 
            $display("DONE!");
            done = 1; 
          end
          if (!done) 
          begin 
            if (difference[31] == 1) 
            begin 
              InstructionPointer = BranchIP;
              if (DEBUG) $display("Taking Branch");
            end 
            else 
            begin 
              InstructionPointer = NextIP;
              if (DEBUG) $display("Not taking Branch");
            end 
          end 
        // If done, stay at same instruction. 
        /* verilator lint_on width */ 
        end 
        else
        begin 
          InstructionPointer = 0;  
          if ((regWriteEnable) && (regAddr != 0))
            RegisterFile[regAddr] <= regWriteData;
        end 
      end
    end 


    assign regReadData = RegisterFile[regAddr]; 
    assign IP = InstructionPointer;

endmodule
