//
// Top level syntheizeable module... instances:

//  (Multiple of) StreamElement.sv 
//  (One of) CompressAndReturn.sv 

module AXIStreamCompressor
  #(
   parameter DATA_BUS_WIDTH_BYTES     = 8,
   parameter NUM_STREAM_ELEMENTS      = 4,
   parameter NUM_COMPRESSION_ELEMENTS = 1,
   parameter MAX_VARIABLEFIELD_LENGTH = 16,
   parameter FIXEDFIELD_LENGTH_BYTES  = 11,
   parameter COMPRESSIONALGORITHM     = 0,
   parameter FIFO_MAX_INGEST_BYTES    = 16,
   parameter MAX_UNCOMPRESSED_BYTES   = 34,
   parameter MAX_COMPRESSED_BYTES     = 34,
   parameter FIFO_DEPTH               = 64
  )
  ( 
      input clk, 
      input reset,
      input wire  [DATA_BUS_WIDTH_BYTES-1:0][7:0] dataIn,
      input wire  dataInValid,
      output wire [DATA_BUS_WIDTH_BYTES-1:0][7:0] dataOut, 
      output wire dataOutValid
  );

  // 
  // Each of these stream Elements can take 
  // 

  wire [MAX_UNCOMPRESSED_BYTES-1:0][7:0]     USEStreamOuts       [NUM_STREAM_ELEMENTS-1:0];
  wire [$clog2(MAX_UNCOMPRESSED_BYTES)-1:0]  USEStreamByteCounts [NUM_STREAM_ELEMENTS-1:0];
  wire                                       USEStreamDataTakens [NUM_STREAM_ELEMENTS-1:0];

  wire                                       tokenChain          [NUM_STREAM_ELEMENTS-1:0]; 
  wire [$clog2(DATA_BUS_WIDTH_BYTES)-1:0]    firstByteOffset     [NUM_STREAM_ELEMENTS-1:0];
  
  genvar streamElement;
  for (streamElement = 0; streamElement < NUM_STREAM_ELEMENTS; streamElement++)
  begin
   StreamElement 
   #(
     .DATA_BUS_WIDTH_BYTES(DATA_BUS_WIDTH_BYTES),
     .VARIABLEFIELD_DELIMITER('h2c),
     .MY_ID(streamElement),         // Do I hold the token on reset or does someone else?
     .RESET_TOKEN_HOLDER_ID(0),    // Do I hold the token on reset or does someone else?
     .FIXEDFIELD_LENGTH_BYTES(FIXEDFIELD_LENGTH_BYTES),
     .MAX_VARIABLEFIELD_LENGTH(MAX_VARIABLEFIELD_LENGTH),
     .MAX_UNCOMPRESSED_BYTES(MAX_UNCOMPRESSED_BYTES)
   ) 
   StreamElement_inst
   (
      .clk(clk),
      .reset(reset),

      .dataIn (dataIn),
      .dataInValid(dataInValid),

      .tokenIn(tokenChain[streamElement]),
      .firstByteOffsetIn(firstByteOffset[streamElement]),

      .tokenOut(tokenChain[(streamElement+1)%NUM_STREAM_ELEMENTS]),
      .firstByteOffsetOut(firstByteOffset[(streamElement+1)%NUM_STREAM_ELEMENTS]),

      .USEStreamOut(USEStreamOuts[streamElement]),
      .USEStreamByteLengthOut(USEStreamByteCounts[streamElement]),
      .USEStreamDataTaken(USEStreamDataTakens[streamElement])
   );

  end 

   
   //
   // Select how to route data. 
   // streamToCompressionElementRoute[0] = 0 means data from USEDataInput[0] goes to Compression Element 1. 
   // compressionToStreamElementRoute[0] = 0 is the reverse. 
   //
   reg                                    streamToCompressionElementAssigned  [NUM_STREAM_ELEMENTS-1:0];
   reg  [$clog2(NUM_STREAM_ELEMENTS)-1:0] streamToCompressionElementRoute     [NUM_STREAM_ELEMENTS-1:0]; 
   reg  [$clog2(NUM_STREAM_ELEMENTS)-1:0] compressionToStreamElementRoute     [NUM_STREAM_ELEMENTS-1:0]; 


   // Pick up to CompressionElement StreamElements.    
   always @(posedge clk)        
   begin 
     integer streamElement = 0;
     integer compressionElement = 0; 
     if (reset) 
     begin  
         for (streamElement = 0; streamElement < NUM_STREAM_ELEMENTS; streamElement ++) 
         begin 
           streamToCompressionElementRoute[streamElement] = 0; 
           streamToCompressionElementAssigned[streamElement] = 0;
         end
         for (compressionElement = 0; compressionElement < NUM_STREAM_ELEMENTS; compressionElement ++) 
         begin 
           compressionToStreamElementRoute[compressionElement] = 0; 
         end
     end
     else 
     begin 
       compressionElement = 0;  
       for (streamElement = 0; streamElement < NUM_STREAM_ELEMENTS; streamElement ++) 
       begin 
         if ((USEStreamByteCounts[streamElement] != 0) && (compressionElement < NUM_COMPRESSION_ELEMENTS))
         begin 
           streamToCompressionElementRoute[streamElement] = compressionElement; 
           streamToCompressionElementAssigned[streamElement] = 1;
           compressionToStreamElementRoute[compressionElement] = streamElement;
           compressionElement++;
         end
         else 
           streamToCompressionElementAssigned[streamElement] = 0;
         end
       end
     end

   
   //
   // We are taking data from the input Stream Elements and routing it to one of N (currently 2) compression elements 
   // and from them to the output FIFO we have. 
   //
     
   wire [MAX_UNCOMPRESSED_BYTES-1:0][7:0]    USEDataMuxedToCompression     [NUM_STREAM_ELEMENTS-1:0];
   wire [$clog2(MAX_UNCOMPRESSED_BYTES)-1:0] USEByteCountMuxedToCompression[NUM_STREAM_ELEMENTS-1:0];


   wire [(MAX_COMPRESSED_BYTES-1):0][7:0]    CSEDataToMux                [NUM_COMPRESSION_ELEMENTS-1:0];
   wire [$clog2(MAX_COMPRESSED_BYTES)-1:0]   CSEByteCountToMux           [NUM_COMPRESSION_ELEMENTS-1:0]; 
   wire                                      CSEShiftToCompressionElement[NUM_COMPRESSION_ELEMENTS-1:0];   
     
   genvar compressionElementIndex; 
   for (compressionElementIndex = 0; compressionElementIndex < NUM_COMPRESSION_ELEMENTS; compressionElementIndex++)
   begin : USETOCOMPRESSIONMUXES
      assign USEDataMuxedToCompression[compressionElementIndex]      = USEStreamOuts[compressionToStreamElementRoute[compressionElementIndex]];
      assign USEByteCountMuxedToCompression[compressionElementIndex] = USEStreamByteCounts[compressionToStreamElementRoute[compressionElementIndex]];
   end


   
   // map the compressor element to the stream element. 
  
   genvar streamElementIndex; 
   for (streamElementIndex = 0; streamElementIndex < NUM_STREAM_ELEMENTS; streamElementIndex++)
      assign USEStreamDataTakens[streamElementIndex] = 
      ((streamToCompressionElementAssigned[streamElementIndex] == 1)
       && (USEStreamByteCounts[streamElementIndex] != 0)) ? 1 : 0;

   
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
