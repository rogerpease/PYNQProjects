/////////////////////////////////////////////////////////////////////
//
//
//  StreamElement takes in data from data_in. 
//  A token is passed between the different stream elements indicating which one
//  is responsible for taking data from data_in. 
// 
//   Consider a 23-byte Stream element coming in.
//   The delimiter would be at 23-FIXEDFIELD_LENGTH_BYTES (say, 6).
//   Now suppose the token comes in with firstByteOffset set to 3. 
//   
//  First, USEStreamByteFifo[0-7] will take data_in[0-7]... Stream Bytes 0-4 will be in data[3-7]. Rest is ignored. USEStartByte = 3. 
//         USEStreamByteFifo[8-15] will take data_in[0-7]... Stream Bytes 5-12 will be in data[0-7].  Delimiter will be found here and end will be computed. 
//         USEStreamByteFifo[16-23] will take data_in[0-7]... Stream Bytes 13-20 will be in data[0-7].  
//         USEStreamByteFifo[24-31] will take data_in[0-7]... Stream Bytes 21-22 will be in data[0-1]. 
//                           We tell the next stream element to start at byte 2 and pass it the token.
//  Then we shift down by 3. Shift by 2 on the first cycle and 1 on the second. USEStartByte is decremented with each shift. 
//
//  Then we set USEStreamByteLengthOut. Once the data is taken (USEStreamDataTaken==1), USEStreamByteLengthOut 
//    is set to 0. 
// 
//  
//

module StreamElement
  #(
    // DATA_BUS_WIDTH must not be larger than (FIXEDFIELD_LENGTH_BYTES + 1)
    parameter DATA_BUS_WIDTH_BYTES=8, // Must be 2**n 
    parameter MAX_VARIABLEFIELD_LENGTH=16,
    parameter VARIABLEFIELD_DELIMITER=8'h2c,
    parameter FIXEDFIELD_LENGTH_BYTES='h11,
    parameter MAX_UNCOMPRESSED_BYTES = 8,
    parameter MY_ID=0,    // Do I hold the token on reset or does someone else? 
    parameter RESET_TOKEN_HOLDER_ID=0    // Do I hold the token on reset or does someone else? 
   )
   ( 
      input clk, 
      input reset, 

      input [(DATA_BUS_WIDTH_BYTES-1):0][7:0] dataIn, 
      input dataInValid, 
   
      input wire tokenIn, 
      input wire [$clog2(DATA_BUS_WIDTH_BYTES)-1:0] firstByteOffsetIn, 

      output reg tokenOut, 
      output reg [$clog2(DATA_BUS_WIDTH_BYTES)-1:0] firstByteOffsetOut, 

      output wire [(MAX_UNCOMPRESSED_BYTES)-1:0][7:0]    USEStreamOut,
      output reg  [$clog2(MAX_UNCOMPRESSED_BYTES)-1:0]   USEStreamByteLengthOut,
      input  wire                                        USEStreamDataTaken
   );  
   
   reg  [$clog2(MAX_USE_BYTES)-1:0]   USEStreamByteLength;

   
    parameter USEStreamState_Empty = 0, 
              USEStreamState_Filling = 1, 
              USEStreamState_Shifting = 2,
              USEStreamState_WaitingForTake = 3; 
    parameter USESTREAMBYTES_BYTE_DEPTH = MAX_USE_BYTES+DATA_BUS_WIDTH_BYTES; 
   
    parameter MAX_USE_BYTES_CLOG2 = $clog2(MAX_USE_BYTES);


    reg [$clog2(DATA_BUS_WIDTH_BYTES)-1:0]           USEStartByte;  
    reg [$clog2(USESTREAMBYTES_BYTE_DEPTH)-1:0]      USECurrentBank;  
    typedef reg[7:0] byteReg;
    byteReg [(USESTREAMBYTES_BYTE_DEPTH-1):0]   USEStreamByteFifo;
    reg                              [1:0]      USEStreamState;  

    //
    //
    // LOOK AT:
    //   delimiterByteNum to figure out where it thinks the delimiter is. 
    //   streamElementLength to figure out where it thinks the last Byte is. 
    

    reg token;
    reg passToken; 
    parameter MAX_USE_BYTES= MAX_VARIABLEFIELD_LENGTH + 
                             FIXEDFIELD_LENGTH_BYTES + 1;

    always @(posedge clk) 
    begin 
      tokenOut <= 0; 
      if (reset) 
        begin 
          if (RESET_TOKEN_HOLDER_ID == MY_ID) 
            token <= 1;
          else  
            token <= 0;
        end 
      else 
        if (tokenIn) 
          token <= 1; 
        else if (passToken)  
        begin
          token <= 0; 
        end
        else 
          token <= token; 
    end
 
    assign tokenOut = passToken;

    //////////////////////////////////////////////////////////////////
    // 
    // Each byte in our chain of bytes gets data from two places: 
    //    
    //   *  
    //    

    logic [USESTREAMBYTES_BYTE_DEPTH-1:0] delimiterByteArray;
    logic [USESTREAMBYTES_BYTE_DEPTH-1:0] delimiterByteNum;

    // Build an array of delimiter detectors. 
    // then pick the smallest. 
    integer i;  
    always_comb 
    begin 
      delimiterByteNum <= 0; 
      for (i = USESTREAMBYTES_BYTE_DEPTH-1;i>=0;i--) 
        if (delimiterByteArray[i] && (i >= USEStartByte)) 
          delimiterByteNum <= i; 
    end 

    // Set the bytelength. Either assume it's the max (so we keep accumulating)
    // or set it to FIXEDFIELD_LENGTH_BYTES past the delimiter. 
    // If VARIABLEFIELD is 10, delimiter will be at byte 10.
    // whch means chain will end at byte 27
    always @(posedge clk)
     USEStreamByteLength = (delimiterByteNum == 0) ? MAX_USE_BYTES : 
         FIXEDFIELD_LENGTH_BYTES + delimiterByteNum + 1 - USEStartByte;  


    genvar streamOutByte; 
    generate 
      for (streamOutByte = 0; streamOutByte < MAX_USE_BYTES; streamOutByte = streamOutByte + 1)          
        assign USEStreamOut[streamOutByte] = USEStreamByteFifo[streamOutByte];
    endgenerate

   // Check each byte to see if it is the delimiter between the variable and fixed fields. 
   // Put the result in an array then pick the lowest result. 
   genvar byteNum; 
   for (byteNum = 0; byteNum < MAX_VARIABLEFIELD_LENGTH+ DATA_BUS_WIDTH_BYTES; byteNum = byteNum + 1)          
       assign delimiterByteArray[byteNum] = (USEStreamByteFifo[byteNum][7:0] == 'h2c) ? 1 : 0;
        
   wire latchDataToSecondBank;
   
   assign latchDataToSecondBank = tokenIn && (firstByteOffsetIn != 0);      
        
   // Make sure we expose the output bytes. 
     always @(posedge clk)
      
     begin 
      integer byteNum; 
      for (byteNum = 0; byteNum < USESTREAMBYTES_BYTE_DEPTH; byteNum = byteNum + 1)             
      begin

        if (reset == 1) begin
        // do nothing. 
          end
        else 
      // If we are in Empty state, always copy in the latest data to the first register. No reason not to. 
          if (USEStreamState == USEStreamState_Empty)
          begin 
            
            if (latchDataToSecondBank)
            begin
              if((byteNum >= (1)*DATA_BUS_WIDTH_BYTES) &&
                 (byteNum  < (2)*DATA_BUS_WIDTH_BYTES)) 
              begin 
                USEStreamByteFifo[byteNum] <= dataIn[byteNum]; 
              end
            end
            else 
              if (byteNum < DATA_BUS_WIDTH_BYTES)
              begin 
                USEStreamByteFifo[byteNum] <= dataIn[byteNum];  
              end
              else 
              begin
                // This looks like an error but it's not... If I'm on byte 0,8, 16, etc I want data_in[0]. 
                USEStreamByteFifo[byteNum] <= USEStreamByteFifo[byteNum%DATA_BUS_WIDTH_BYTES];
              end
          end  
          else if (USEStreamState == USEStreamState_Filling) 
          begin 
            if (latchData && 
                (byteNum >=  USECurrentBank   *DATA_BUS_WIDTH_BYTES) &&
                (byteNum  < (USECurrentBank+1)*DATA_BUS_WIDTH_BYTES)) 
            begin 
              USEStreamByteFifo[byteNum] <= dataIn[byteNum%DATA_BUS_WIDTH_BYTES];  
            end 
          end 
          else 
            // Shift-down 
            if (USEStreamState == USEStreamState_Shifting)
            begin
              if (USEStartByte >= 4) 
                USEStreamByteFifo[byteNum] <= USEStreamByteFifo[(byteNum+4) % USESTREAMBYTES_BYTE_DEPTH]; 
              else
              if (USEStartByte[1] == 1) 
                USEStreamByteFifo[byteNum] <= USEStreamByteFifo[(byteNum+2) % USESTREAMBYTES_BYTE_DEPTH]; 
              else
              if (USEStartByte[0] == 1) 
                USEStreamByteFifo[byteNum] <= USEStreamByteFifo[(byteNum+1) % USESTREAMBYTES_BYTE_DEPTH]; 
            end
        end
    end  
 
    wire latchData;
    assign latchData = (token) && (dataInValid); 


    // Now for the specific controller. 
    //
    always @(posedge clk) 
    begin 
      if (reset) 
      begin 
        USEStreamState         <= USEStreamState_Empty; 
        USEStartByte           <= 0; 
        USEStreamByteLengthOut <= 0;
        USECurrentBank         <= 0; 
        firstByteOffsetOut     <= 0;
        passToken              <= 0;
      end
      else 
      begin    
        passToken <= 0;      
        
        if (USEStreamState == USEStreamState_Empty) 
        begin
           $display("Stream Element ", MY_ID," in Empty"); 

           if ((dataInValid) && ((tokenIn) || (token)))
           begin
              $display("Stream Element ", MY_ID," Transitioning to Filling FirstByteOffsetIn", firstByteOffsetIn); 
              USEStreamState <= USEStreamState_Filling; 
              USEStartByte   <= firstByteOffsetIn;
              if (tokenIn)
              begin 
                 if (firstByteOffsetIn == 0) 
                 begin
                   USECurrentBank <= 1; 
                 end
                 else 
                 begin
                   USECurrentBank <= 2;
                 end
              end               
            end
        end
        else if (USEStreamState == USEStreamState_Filling) 
        begin
           if (latchData) begin     
             $display("Stream Element ", MY_ID," in filling " , USECurrentBank , " latchdata high " );
             $display("Stream Element ", MY_ID," USEStartByte ",USEStartByte, " USEStreamByteLength ", USEStreamByteLength);

             USECurrentBank <= USECurrentBank + 1;  
             // If we have the data we need. 
             if ((USECurrentBank)*DATA_BUS_WIDTH_BYTES >= 
               (USEStreamByteLength+USEStartByte-DATA_BUS_WIDTH_BYTES)) 
             begin
               $display("Stream Element ", MY_ID," passing token and sending to Shifting state." );

               USEStreamState <= USEStreamState_Shifting; 
               passToken <= 1; 
               //
               // If I started at byte 3 and took in a 30 byte message 
               // my new first byte would be at 33%8 = 1 
               //
               firstByteOffsetOut <= (USEStreamByteLength + USEStartByte) % DATA_BUS_WIDTH_BYTES;
             end
           end
        end 
        else if (USEStreamState == USEStreamState_Shifting) 
        begin
             if (USEStartByte >= 4) 
             begin 
                USEStartByte     <= USEStartByte - 4; 
             end
             else
             if (USEStartByte[1] == 1) 
                USEStartByte     <= USEStartByte - 2;
             else
             if (USEStartByte[0] == 1) 
                USEStartByte     <= USEStartByte - 1;
             else             
             begin 
               USEStreamState         <= USEStreamState_WaitingForTake;
               USECurrentBank         <= 0; 
               USEStreamByteLengthOut <= USEStreamByteLength;
             end
        end
        else if (USEStreamState == USEStreamState_WaitingForTake) 
        begin       
          $display("Stream Element ", MY_ID," started in Filling " + USECurrentBank + " latchdata " );
          if (USEStreamDataTaken == 1) 
          begin
             USEStreamByteLengthOut <= 0;
             USEStreamState         <= USEStreamState_Empty;
          end   
        end
      end
    end
    
    
    
endmodule
    
