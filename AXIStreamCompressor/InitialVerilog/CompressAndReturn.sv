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



   
   //
   // Select how to route data. 
   // streamToCompressionElementRoute[0] = 0 means data from USEDataInput[0] goes to Compression Element 1. 
   // compressionToStreamElementRoute[0] = 0 is the reverse. 
   //
   reg                                         streamToCompressionElementAssigned  [NUM_UNCOMPRESSED_ELEMENTS-1:0];
   reg  [$clog2(NUM_COMPRESSION_ELEMENTS)-1:0] streamToCompressionElementRoute     [NUM_UNCOMPRESSED_ELEMENTS-1:0]; 
   reg  [$clog2(NUM_COMPRESSION_ELEMENTS)-1:0] compressionToStreamElementRoute     [NUM_UNCOMPRESSED_ELEMENTS-1:0]; 

   
   always @(posedge clk)        
   begin 
     integer streamElement;
     for (streamElement = 0; streamElement < NUM_UNCOMPRESSED_ELEMENTS; streamElement ++) 
     begin 
       streamToCompressionElementRoute[streamElement] = 0; 
       streamToCompressionElementAssigned[streamElement] = 0;
       compressionToStreamElementRoute[streamElement] = 0; 
     end
     streamToCompressionElementAssigned[0] = 1;
     compressionToStreamElementRoute[0] = 0; 
   end 

   
   //
   // We are taking data from the input Stream Elements and routing it to one of N (currently 2) compression elements 
   // and from them to the output FIFO we have. 
   //
     
   wire [MAX_UNCOMPRESSED_BYTES-1:0][7:0]    USEDataMuxedToCompression     [NUM_COMPRESSION_ELEMENTS-1:0];
   wire [$clog2(MAX_UNCOMPRESSED_BYTES)-1:0] USEByteCountMuxedToCompression[NUM_COMPRESSION_ELEMENTS-1:0];


   wire [(MAX_COMPRESSED_BYTES-1):0][7:0]    CSEDataToMux                [NUM_COMPRESSION_ELEMENTS-1:0];
   wire [$clog2(MAX_COMPRESSED_BYTES)-1:0]   CSEByteCountToMux           [NUM_COMPRESSION_ELEMENTS-1:0]; 
   wire                                      CSEShiftToCompressionElement[NUM_COMPRESSION_ELEMENTS-1:0];   
     
   genvar compressionElementIndex; 
   for (compressionElementIndex = 0; compressionElementIndex < NUM_COMPRESSION_ELEMENTS; compressionElementIndex++)
   begin : USETOCOMPRESSIONMUXES
      assign USEDataMuxedToCompression[compressionElementIndex]      = USEDataInput[compressionToStreamElementRoute[compressionElementIndex]];
      assign USEByteCountMuxedToCompression[compressionElementIndex] = USEByteCount[compressionToStreamElementRoute[compressionElementIndex]];
   end


   
   // map the compressor element to the stream element. 
   

   genvar streamElementIndex; 
   for (streamElementIndex = 0; streamElementIndex < NUM_UNCOMPRESSED_ELEMENTS; streamElementIndex++)
      assign USEDataTaken[streamElementIndex] = 
      ((streamToCompressionElementAssigned[streamElementIndex] == 1)
       && (USEByteCount[streamElementIndex] != 0)) ? 1 : 0;

   
    CompressionModule 
    #(.SHIFTLENGTH_BYTES(FIFO_MAX_INGEST_BYTES))  
    CompressionModule_inst
      (.clk(clk),
       .reset(reset),
       .USEData(USEDataMuxedToCompression[0]), 
       .USEByteCount(USEByteCountMuxedToCompression[0]), 
       .CSEData(CSEDataToMux[0]), 
       .CSEByteCount(CSEByteCountToMux[0]), 
       .CSEShift(CSEShiftToCompressionElement[0]));


   reg [$clog2(NUM_COMPRESSION_ELEMENTS):0] CompressionElementToFIFOSelect; 


   always @(posedge clk) begin CompressionElementToFIFOSelect <= 0; end 

   wire [(MAX_COMPRESSED_BYTES-1):0][7:0]    CSEDataMuxToOutFIFO;
   wire [$clog2(MAX_COMPRESSED_BYTES)-1:0]   CSEByteMuxToOutFIFO;
   wire   CSEDataValid;  
   reg                                       CSEShiftFromOutFIFO;   
   // TODO Add more FIFO Inputs. 
   
   assign CSEDataMuxToOutFIFO = CSEDataToMux[CompressionElementToFIFOSelect];
   assign CSEByteMuxToOutFIFO = CSEByteCountToMux[CompressionElementToFIFOSelect];

   for (compressionElementIndex = 0; compressionElementIndex < NUM_COMPRESSION_ELEMENTS; compressionElementIndex++)
     assign CSEShiftToCompressionElement[compressionElementIndex] =  (CompressionElementToFIFOSelect == compressionElementIndex) ? CSEShiftFromOutFIFO : 0; 
   
   assign CSEDataValid = (CSEByteMuxToOutFIFO == 0) ? 0 : 1;
  
   ReturnFIFO  
   #(
    .NUM_UNCOMPRESSED_ELEMENTS(MAX_UNCOMPRESSED_BYTES),
    .NUM_BYTES_INPUT_WIDTH(16),
    .FIFO_DEPTH(64),
    .NUM_BYTES_OUTPUT_WIDTH(8)
   )
   ReturnFIFO_inst
   (
   .clk(clk), 
   .reset(reset), 
   .dataIn(CSEDataMuxToOutFIFO[(FIFO_MAX_INGEST_BYTES)-1:0]),
   .dataInBytesValid(CSEByteMuxToOutFIFO),
   .dataInShift(CSEShiftFromOutFIFO), 
   .endOfStream(0),
   .dataOut(dataBus),
   .dataOutValid(dataValid)
   );

endmodule 




