module CompressAndReturn
#( 
   parameter DATA_BUS_WIDTH_BYTES = 8,
   parameter NUM_UNCOMPRESSED_ELEMENTS = 1,
   parameter NUM_COMPRESSION_ELEMENTS = 1,
   parameter COMPRESSIONALGORITHM = 0,
   parameter FIFO_MAX_INGEST_BYTES=16,
   parameter MAX_UNCOMPRESSED_BYTES=34,
   parameter MAX_COMPRESSED_BYTES=34,
   parameter FIFO_DEPTH=4
)
(
   input wire clk, 
   input wire reset, 
   input wire [MAX_UNCOMPRESSED_BYTES-1:0][7:0]    USEDataInput[NUM_UNCOMPRESSED_ELEMENTS-1:0], 
   input wire [$clog2(MAX_UNCOMPRESSED_BYTES)-1:0] USEByteCount[NUM_UNCOMPRESSED_ELEMENTS-1:0], 
   output wire                                     USEDataTaken[NUM_UNCOMPRESSED_ELEMENTS-1:0], 

   output reg [(DATA_BUS_WIDTH_BYTES-1):0][7:0] dataBus, 
   output reg                                    dataValid 
);




endmodule 




