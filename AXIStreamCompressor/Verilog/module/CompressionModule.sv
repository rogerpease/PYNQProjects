`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/31/2020 07:55:22 AM
// Design Name: 
// Module Name: CompressionModule
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


module CompressionModule 
#(
   parameter MAX_UNCOMPRESSED_STREAM_ELEMENT_LENGTH_BYTES = 34, 
   parameter MAX_COMPRESSED_STREAM_ELEMENT_LENGTH_BYTES = 34, 
   parameter COMPRESSIONALGORITHM = 0,
   parameter SHIFTLENGTH_BYTES  = 8 
)
(
   input                                                                 clk,
   input                                                                 reset,

   input wire [MAX_UNCOMPRESSED_STREAM_ELEMENT_LENGTH_BYTES-1:0][7:0]    USEData ,  
   input wire [$clog2(MAX_UNCOMPRESSED_STREAM_ELEMENT_LENGTH_BYTES)-1:0] USEByteCount , 

   output reg [(MAX_COMPRESSED_STREAM_ELEMENT_LENGTH_BYTES-1):0][7:0]    CSEData      , 
   output reg [$clog2(MAX_COMPRESSED_STREAM_ELEMENT_LENGTH_BYTES)-1:0]   CSEByteCount, 
   input  wire                                                           CSEShift
);

   wire [(MAX_COMPRESSED_STREAM_ELEMENT_LENGTH_BYTES-1):0][7:0]    CSEData_d; 
   wire [$clog2(MAX_COMPRESSED_STREAM_ELEMENT_LENGTH_BYTES)-1:0]   CSEByteCount_d; 


   genvar CSEByteNumber;
   for (CSEByteNumber = 0; CSEByteNumber < MAX_COMPRESSED_STREAM_ELEMENT_LENGTH_BYTES; CSEByteNumber++)
      assign CSEData_d[CSEByteNumber] = (reset) ? 0 : 
                                (USEByteCount != 0) ? USEData[CSEByteNumber] : 
                                 (CSEShift) ? CSEData[(CSEByteNumber + SHIFTLENGTH_BYTES)%MAX_COMPRESSED_STREAM_ELEMENT_LENGTH_BYTES] :
                                              CSEData[CSEByteNumber]; 
                                              
   assign CSEByteCount_d = (reset) ? 0: 
                           (USEByteCount != 0 )  ? USEByteCount :
                           (CSEShift) ? ((CSEByteCount > SHIFTLENGTH_BYTES) ? (CSEByteCount - SHIFTLENGTH_BYTES): 0) :
                           CSEByteCount; 
       
    
    always @(posedge clk) CSEData <= CSEData_d;
    always @(posedge clk) CSEByteCount = CSEByteCount_d; 
    

endmodule 
