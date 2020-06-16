`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Roger D. Pease
// 
// Create Date: 06/14/2020 06:10:29 PM
// Design Name: Simple Logic Module 
// Module Name: AddSubMulAndOr
// Project Name: 
// Target Devices: Zynq 7000 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module SimpleLogicModule (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum,
    output [31:0] difference,
    output [31:0] bitwiseAnd,
    output [31:0] bitwiseOr,
    output [31:0] bitwiseXor,
    output [31:0] bitwiseXNor
    );
    assign sum = a+b;
    assign difference = a-b;
    assign bitwiseAnd = a & b;
    assign bitwiseOr  = a | b; 
    assign bitwiseXor  = a ^  b; 
    assign bitwiseXNor = a ~^ b; 
endmodule
