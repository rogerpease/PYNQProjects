#include <iostream>
#include "VAXIStreamCompressor.h"
#include <memory> 

#define MAX_WORDLIST_LEN      (34)
#define DELIMITER             (0x2c)
#define NUMBYTESPASTDELIMITER (17)

#define NUMSTREAMLENGTHS      (10) 


class NextStreamDataInClass  {
  public:
   unsigned int NextByteOrWord; 
   char LastByteOrWord; 

};

class StreamCompressorDataClass
{ 
  int StreamLengths[10] = { 23,19,18,34,21,  // Third one must be short so 0x2c does not get confused with delimiter.  
                            22,31,31,19,22 }; 
  int totalNumStreamBytes; 
  unsigned char * StreamBytes; 
  int byteIndex; 
  public: 
    // First BytePosition is what is passed to the 
    StreamCompressorDataClass()
    { 
      totalNumStreamBytes = 0; 
      for (int i = 0; i < NUMSTREAMLENGTHS;i++) 
        totalNumStreamBytes += StreamLengths[i]; 

      printf("TotalNumStreamBytes %d\n",totalNumStreamBytes); 

      StreamBytes = (unsigned char*) malloc(totalNumStreamBytes);

      int streamLengthIndex = 0;  
      int streamByteIndex = 0;  

      while (streamLengthIndex < NUMSTREAMLENGTHS) 
      {
         int streamLength = StreamLengths[streamLengthIndex]; 
         int delimiterPosition = streamLength - NUMBYTESPASTDELIMITER - 1; 
         int streamByteWithinStream = 0;
         while (streamByteWithinStream < streamLength)
         {
           if (streamByteWithinStream == delimiterPosition)
              *(StreamBytes + streamByteIndex) = DELIMITER;
           else if (streamByteWithinStream == 0)                    // First Byte
              *(StreamBytes + streamByteIndex) = streamLengthIndex;
           else if (streamByteWithinStream == 1)  
              *(StreamBytes + streamByteIndex) = streamLength;
           else if (streamByteWithinStream < delimiterPosition) // Pre-delimiter
              *(StreamBytes + streamByteIndex) = streamByteWithinStream;
           else                                                 // Post Delimiter
              *(StreamBytes + streamByteIndex) = (0xA<<4) + streamByteWithinStream-delimiterPosition-1; 
           
           streamByteWithinStream++; 
           streamByteIndex++; 
         } 
         streamLengthIndex ++; 
      }
      assert (*(StreamBytes + 5) == DELIMITER); 
      assert (*(StreamBytes + 23) == 1);   
      assert (*(StreamBytes + 24) == 0x2c); 
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
     printf("Clock Toggled\n"); 
    
  } 
  void Reset() { this->reset = 1; ToggleClock(); ToggleClock(); this->reset = 0; ToggleClock(); } 


  void DriveStreamCycleAndCheckResult() 
  {
      ToggleClock(); 
      StreamCompressorDataClass Data;
      NextStreamDataInClass streamDataObject; 
      streamDataObject.LastByteOrWord = false; 

      while (streamDataObject.LastByteOrWord == false)
      { 
        streamDataObject = Data.GetNextWord();
        this->dataIn     = streamDataObject.NextByteOrWord;  
        streamDataObject = Data.GetNextWord();
        this->dataIn    |= ((unsigned long int) streamDataObject.NextByteOrWord << 32);  
        this->dataInValid = 1;

        std::cout << "Test: DataIn: " <<  std::hex << this->dataIn << std::dec << " Data In Valid " << (int) this->dataInValid << std::endl;

        ToggleClock(); 
        if (this->dataOutValid) { printf("DATA OUT: %lx\n",this->dataOut);  } 
      }

      this->dataInValid = 0;

    
      if (debug) std::cout << "Test: ************************************** END TEST ************************************" <<std::endl;       
  } 



};


int main(int argc, char **argv) 
{

   Verilated::commandArgs(argc,argv); 


   AXIStreamCompressorWrapperClass AXIStreamCompressorWrapper; 
   //
   // We are running the following tests:
   //  1) Test from reset state (Token In defaults on)  
   //
   
   
   AXIStreamCompressorWrapper.Reset();  
   AXIStreamCompressorWrapper.DriveStreamCycleAndCheckResult();  


}
