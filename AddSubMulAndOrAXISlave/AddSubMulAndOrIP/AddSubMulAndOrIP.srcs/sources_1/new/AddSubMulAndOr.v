`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/14/2020 06:10:29 PM
// Design Name: 
// Module Name: AddSubMulAndOr
// Project Name: 
// Target Devices: 
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


module AddSubMulAndOr(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum,
    output [31:0] difference,
    output [31:0] product,
    output [31:0] bitwiseAnd,
    output [31:0] bitwiseOr
    );
    assign sum = a+b;
    assign difference = a-b;
    assign product = a*b;
    assign bitwiseAnd = a & b;
    assign bitwiseOr  = a | b; 
endmodule
