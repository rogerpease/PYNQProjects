#include <iostream>
#include "VFrameGeneratorCore.h"
#include <memory> 
#include <sstream> 
#include <fstream>

// Drive a stream element and compare results. 
//
//

class FrameGeneratorCoreWrapperClass : VFrameGeneratorCore
{

  public:
  bool debug = false;  
  
  FrameGeneratorCoreWrapperClass () 
  {  
    const std::unique_ptr<VerilatedContext> contextp{new VerilatedContext};
    VFrameGeneratorCore{contextp.get(), "VFrameGeneratorCore"};
  } 

  void ToggleClock() { 
     this->clk = 1; this->eval(); this->clk = 0; this->eval(); 
     if (debug) printf("Clock Toggled\n"); 
    
  } 
  void Reset() { this->reset = 0; ToggleClock(); ToggleClock(); this->reset = 1; ToggleClock(); } 


  bool DriveStreamCycleAndCheckResult() 
  {
      this->dataOutReady = 0; 
      Reset(); 
      ToggleClock(); 
      this->dataOutReady = 1; 
#define DATAOUTPERIOD (256) 
      this->dataOutLastPeriod = DATAOUTPERIOD-1; 
      const int height = 1080; 
      const int width  = 1920; 
      const int bytesperpixel  = 3; 
      const int frameSizeBytes = height*width*bytesperpixel;  
  
      this->controlRegister = 1; 
  
      unsigned char * framePtr = (unsigned char *) malloc(frameSizeBytes);  
      assert(framePtr != nullptr); 
      int cycle = 0; 
      for (int i = 0; i < frameSizeBytes; i++) 
      {
         this->dataOutReady = 1; 
         while (!this->dataOutValid) { ToggleClock(); } 
         *(framePtr + i) = this->dataOut;
         if (this->dataOutLast == 1) { if (cycle != 0) { if ((cycle % DATAOUTPERIOD) == 0) { } else { printf("dataOutLast should be low cycle %d",cycle); exit(1); } } } 
         else                        { if (cycle != 0) { if ((cycle % DATAOUTPERIOD) != 0) { } else { printf("dataOutLast should be high cycle %d",cycle); exit(1);} } } 

         ToggleClock(); cycle ++; 
      } 
 
      std::ofstream f("outfile.bin"); 
      f.write((const char *) framePtr,frameSizeBytes); 
      f.close(); 
      return true; 
  } 
};


int main(int argc, char **argv) 
{
   int arg = 0; 
   const bool debug = false; 


   FrameGeneratorCoreWrapperClass FrameGeneratorCoreWrapper; 
   FrameGeneratorCoreWrapper.Reset();  
   assert (FrameGeneratorCoreWrapper.DriveStreamCycleAndCheckResult());  
   std::cout << "Test: ************************************** PASS!!!!  ************************************" <<std::endl;       

}
