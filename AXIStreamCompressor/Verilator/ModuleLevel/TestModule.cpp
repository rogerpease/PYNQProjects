#include <iostream>
#include "VAXIStreamCompressor.h"
#include <memory> 
#include <sstream> 

#define MAX_WORDLIST_LEN      (34)
#define DELIMITER             (0x2c)
#define NUMBYTESPASTDELIMITER (17)
#define NUMSTREAMLENGTHS      (20) 
#define FIFO_OUT_WIDTH_BYTES  (8)   // Width of FIFO in Bytes


class NextStreamDataInClass  {
  public:
   unsigned int NextByteOrWord; 
   char LastByteOrWord; 

};

class StreamCompressorDataClass
{ 
  int StreamLengths[NUMSTREAMLENGTHS] = { 23,19,21,34,21,22,31,31,19,22,
                                          31,19,19,21,33,22,22,23,23,24 }; 

  int totalNumStreamBytes; 
  unsigned char * StreamBytes; 

  int byteIndex; 

  public: 
    // First BytePosition is what is passed to the 
    StreamCompressorDataClass()
    { 
      // Compute all stream bytes. 
      totalNumStreamBytes = 0; 
      for (int i = 0; i < NUMSTREAMLENGTHS;i++) 
        totalNumStreamBytes += StreamLengths[i]; 

      printf("TotalNumStreamBytes %d\n",totalNumStreamBytes); 

      StreamBytes = (unsigned char*) malloc(totalNumStreamBytes);
      assert(StreamBytes != nullptr); 
 
      int streamLengthIndex = 0;  
      int streamByteIndex = 0;  

      //
      // Initialize stream data. Given the number of streamLengths, compute where the delimiter token will be. 
      //   Then start Filling in bytes.
      // 
      //  A full stream should look like (lowest byte to the left): 
      //           ID Len                Delim
      //           00  16  02  03  04  05  2C  A0 A1 A2 ... B0
      //
      // And the IDs keep incrementing (2c is skipped) 
      // 
      while (streamLengthIndex < NUMSTREAMLENGTHS) 
      {
         
         int streamLength = StreamLengths[streamLengthIndex]; 
         int delimiterBytePosition = streamLength - NUMBYTESPASTDELIMITER - 1; 
         assert(delimiterBytePosition > 0); 
         int streamByteWithinStream = 0;
         while (streamByteWithinStream < streamLength)
         {
           if (streamByteWithinStream == delimiterBytePosition)         // Delimiter 
              *(StreamBytes + streamByteIndex) = DELIMITER;
           else if (streamByteWithinStream == 0)                    // First Byte
              *(StreamBytes + streamByteIndex) = streamLengthIndex;
           else if (streamByteWithinStream == 1)  
              *(StreamBytes + streamByteIndex) = streamLength;
           else if (streamByteWithinStream < delimiterBytePosition) // Pre-delimiter
              *(StreamBytes + streamByteIndex) = streamByteWithinStream;
           else                                                 // Post Delimiter
              *(StreamBytes + streamByteIndex) = (0xA<<4) + streamByteWithinStream-delimiterBytePosition-1; 
           
           streamByteWithinStream++; 
           streamByteIndex++; 
         } 
         streamLengthIndex ++; 
      }
      assert (*(StreamBytes + 5)  == DELIMITER); 
      assert (*(StreamBytes + 23) ==         1); // Stream ID of second stream.   
      assert (*(StreamBytes + 24) ==      0x2c); // Delimiter Position of 2nd stream.
      byteIndex = 0; 
    }

    NextStreamDataInClass GetNextByte()
    {
      NextStreamDataInClass result; 
      result.NextByteOrWord = (byteIndex < totalNumStreamBytes) ? *(StreamBytes + byteIndex) : 0xFF;  
      result.LastByteOrWord = (byteIndex < totalNumStreamBytes) ? 0:1;
      byteIndex++; 
      return result; 
    } 
    NextStreamDataInClass GetNextWord()
    {
       NextStreamDataInClass streamByte; 
       NextStreamDataInClass result; 
       streamByte = GetNextByte(); result.NextByteOrWord  =  streamByte.NextByteOrWord;
       streamByte = GetNextByte(); result.NextByteOrWord |= (streamByte.NextByteOrWord << 8);
       streamByte = GetNextByte(); result.NextByteOrWord |= (streamByte.NextByteOrWord << 16);
       streamByte = GetNextByte(); result.NextByteOrWord |= (streamByte.NextByteOrWord << 24);
       result.LastByteOrWord = streamByte.LastByteOrWord; 
       return result; 
    }  
    void ResetByteIndex() { byteIndex = 0; } 

}; 


//
// Drive a stream element and compare results. 
//
//

class AXIStreamCompressorWrapperClass : VAXIStreamCompressor 
{

  public:
  bool debug = true;  
  
  AXIStreamCompressorWrapperClass () 
  {  
    const std::unique_ptr<VerilatedContext> contextp{new VerilatedContext};
    VAXIStreamCompressor{contextp.get(), "VAXIStreamCompressor"};
  } 

  void ToggleClock() { 
     this->clk = 1; this->eval(); this->clk = 0; this->eval(); 
     if (debug) printf("Clock Toggled\n"); 
    
  } 
  void Reset() { this->reset = 1; ToggleClock(); ToggleClock(); this->reset = 0; ToggleClock(); } 


  bool DriveStreamCycleAndCheckResult() 
  {
      ToggleClock(); 
      StreamCompressorDataClass Data;
      NextStreamDataInClass streamDataObject; 
      streamDataObject.LastByteOrWord = false; 

      std::vector<unsigned long int> sentData; 
      std::vector<unsigned long int> capturedData; 

      while (streamDataObject.LastByteOrWord == false)
      { 
        streamDataObject = Data.GetNextWord();
        this->dataIn     = streamDataObject.NextByteOrWord;  
        streamDataObject = Data.GetNextWord();
        this->dataIn    |= ((unsigned long int) streamDataObject.NextByteOrWord << 32);  

        this->dataInValid = 1;

        sentData.push_back(this->dataIn); 
        std::cout << "Test: DataIn: " <<  std::hex << this->dataIn << std::dec << " Data In Valid " << (int) this->dataInValid << std::endl;

        ToggleClock(); 
        if (this->dataOutValid) 
        {
          capturedData.push_back(this->dataOut); 
          if (debug) printf("DATA OUT: %lx\n",this->dataOut);  
        } 
      }
      // flush for 15 more cycles. 
      int flushCycle = 20;
      while (flushCycle>0)
      {
         this->dataInValid = 0; 
         ToggleClock(); 
         if (this->dataOutValid) 
         {
           capturedData.push_back(this->dataOut); 
           if (debug) printf("DATA OUT: %lx\n",this->dataOut);  
         } 
         flushCycle--;
      }

      //
      // The out fifo only outputs elements 8 at a time, so if there are 7 elements left
      // we won't get them. 
      //
      int numElementsToCompare = std::max(sentData.size(),capturedData.size()); 
          numElementsToCompare -= numElementsToCompare % FIFO_OUT_WIDTH_BYTES; 

      // Sanity check our Stream elements index. 
      assert (numElementsToCompare > (NUMBYTESPASTDELIMITER * NUMSTREAMLENGTHS)/FIFO_OUT_WIDTH_BYTES); 

      bool fail = false; 

      std::stringstream debugString; 

      for (int index = 0; index < numElementsToCompare; index++)
      { 
         if (index < sentData.size())  { debugString << std::hex << sentData[index] << std::dec << " ";  }
         else                          { fail = true; debugString << "----------------"; } 
         if (index < capturedData.size())  { debugString << std::hex << capturedData[index] << std::dec << " ";  }
         else                          { fail = true; debugString << "----------------"; } 
         if (sentData[index] != capturedData[index]) { debugString << " MISMATCH"; fail = true; } 
         debugString << std::endl; 
      } 

      this->dataInValid = 0;

      if (fail) { std::cout << debugString.str(); return false;   } 
      else      { return true;    } 
  } 
};


int main(int argc, char **argv) 
{
   const bool debug = false; 

   printf("FifoOutWidthBytes %d\n", (FIFO_OUT_WIDTH_BYTES));   // Width of FIFO in Bytes

   AXIStreamCompressorWrapperClass AXIStreamCompressorWrapper; 
   AXIStreamCompressorWrapper.Reset();  
   assert (AXIStreamCompressorWrapper.DriveStreamCycleAndCheckResult());  
   std::cout << "Test: ************************************** PASS!!!!  ************************************" <<std::endl;       

}
