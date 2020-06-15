`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Roger D. Pease
// 
// Create Date: 06/14/2020 06:10:29 PM
// Design Name: Add Subtract Multiply And Or function 
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


module AddSubMulAndOr(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum,
    output [31:0] difference,
    output [31:0] productLSB,
    output [31:0] productMSB,
    output [31:0] bitwiseAnd,
    output [31:0] bitwiseOr
    );
    wire [63:0] product;
    assign sum = a+b;
    assign difference = a-b;
    assign product = a*b;
    assign productLSB = product[31:0];
    assign productMSB = product[63:32];
    assign bitwiseAnd = a & b;
    assign bitwiseOr  = a | b; 
endmodule
