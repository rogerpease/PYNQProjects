

module StreamElement
  #(
    parameter DATA_BUS_WIDTH_BYTES=8, // Must be 2**n 
    parameter MAX_VARIABLEFIELD_LENGTH=16,
    parameter VARIABLEFIELD_DELIMITER=8'h2c,
    parameter FIXEDFIELD_LENGTH_BYTES='h11,

    parameter MY_ID=0,    // Do I hold the token on reset or does someone else? 
    parameter RESET_TOKEN_HOLDER_ID=0    // Do I hold the token on reset or does someone else? 
   )
   ( 
      input clk, 
      input reset, 

      input [(DATA_BUS_WIDTH_BYTES*8-1):0] data_in, 
      input dataValid, 
   
      input wire tokenIn, 
      input wire [$clog2(DATA_BUS_WIDTH_BYTES)-1:0] firstByteOffsetIn, 

      output reg tokenOut, 
      output reg [$clog2(DATA_BUS_WIDTH_BYTES)-1:0] firstByteOffsetOut, 

      output wire [(MAX_USE_BYTES*8)-1:0]       USEStreamOut,
      output reg  [$clog2(MAX_USE_BYTES)-1:0]   USEStreamByteLengthOut,
      output reg                                USEStreamReadyOut
   );  
   
   
   
    parameter USEStreamState_Empty = 0, 
              USEStreamState_Filling = 1, 
              USEStreamState_Shifting = 2; 

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
     USEStreamByteLengthOut = (delimiterByteNum == 0) ? MAX_USE_BYTES : 
     FIXEDFIELD_LENGTH_BYTES + delimiterByteNum + 1 - USEStartByte;  


    genvar streamOutByte; 
    generate 
      for (streamOutByte = 0; streamOutByte < MAX_USE_BYTES; streamOutByte = streamOutByte + 1)          
        assign USEStreamOut[(streamOutByte*8)+7-:8] = USEStreamByteFifo[streamOutByte];
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
                USEStreamByteFifo[byteNum] <= data_in[(byteNum%DATA_BUS_WIDTH_BYTES)*8+7-:8]; 
              end
            end
            else 
              if (byteNum < DATA_BUS_WIDTH_BYTES)
              begin 
                USEStreamByteFifo[byteNum] <= data_in[(byteNum%DATA_BUS_WIDTH_BYTES)*8+7-:8];  
              end
              else 
              begin
                USEStreamByteFifo[byteNum] <= USEStreamByteFifo[byteNum];
              end
          end  
          else if (USEStreamState == USEStreamState_Filling) 
          begin 
            if (latchData && 
                (byteNum >=  USECurrentBank   *DATA_BUS_WIDTH_BYTES) &&
                (byteNum  < (USECurrentBank+1)*DATA_BUS_WIDTH_BYTES)) 
            begin 
              USEStreamByteFifo[byteNum] <= data_in[(byteNum%DATA_BUS_WIDTH_BYTES)*8+7-:8];  
            end 
          end 
          else if ((USEStreamState == USEStreamState_Shifting) && (USEStartByte > 0) )
              USEStreamByteFifo[byteNum] <= USEStreamByteFifo[(byteNum+1) % USESTREAMBYTES_BYTE_DEPTH]; 
        end
    end  
 
    wire latchData;
    assign latchData = (token) && (dataValid); 
 //    ((USEStreamByteLengthOut == MAX_USE_BYTES) || 
 //     (USECurrentBank*8 < USEStreamByteLengthOut));

    // Now for the specific controller. 

    always @(posedge clk) 
    begin 
      if (reset) 
      begin 
        USEStreamState     <= USEStreamState_Empty; 
        USEStartByte       <= 0; 
        USECurrentBank     <= 0; 
        USEStreamReadyOut  <= 0;
        firstByteOffsetOut <= 0;
      end
      else 
      begin    
        USEStreamReadyOut <= 0; 
        passToken <= 0; 
       
        if (USEStreamState == USEStreamState_Empty) 
        begin
           if ((tokenIn) || (token))
              USEStreamState <= USEStreamState_Filling; 
              USEStartByte   <= firstByteOffsetIn;
           if ((dataValid) && (tokenIn))
            begin 
              if (firstByteOffsetIn == 0) 
               USECurrentBank <= 1; 
              else 
               USECurrentBank <= 2;
            end
        end
        else if (USEStreamState == USEStreamState_Filling) 
          begin
           if (latchData) begin           
             USECurrentBank <= USECurrentBank + 1;  
             // If we have the data we need. 
             if ((USECurrentBank)*DATA_BUS_WIDTH_BYTES >= 
               (USEStreamByteLengthOut+USEStartByte-DATA_BUS_WIDTH_BYTES)) 
             begin
               USEStreamState <= USEStreamState_Shifting; 
               passToken <= 1; 
               //
               // If I started at byte 3 and took in a 30 byte message 
               // my new first byte would be at 33%8 = 1 
               //
               firstByteOffsetOut <= (USEStreamByteLengthOut + USEStartByte) % DATA_BUS_WIDTH_BYTES;
             end
           end
          end 
        else
        begin 
          if (USEStreamState == USEStreamState_Shifting) 
          begin
             if (USEStartByte > 0) 
             begin 
                USEStartByte <= USEStartByte - 1; 
                // Do nothing. Data mux will handle the shift. 
             end
             else
             begin 
               USEStreamState    <= USEStreamState_Empty;
               USEStreamReadyOut <= 1; 
               USECurrentBank    <= 0; 
             end
          end
        end 
      end
    end
    
    
    
    
endmodule
    