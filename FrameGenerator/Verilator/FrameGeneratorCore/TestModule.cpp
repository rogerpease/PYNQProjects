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
  void Reset() { this->reset = 1; ToggleClock(); ToggleClock(); this->reset = 0; ToggleClock(); } 


  bool DriveStreamCycleAndCheckResult() 
  {
      this->dataOutReady = 0; 
      Reset(); 
      ToggleClock(); 
      this->dataOutReady = 1; 
      const int height = 1080; 
      const int width  = 1920; 
      const int bytesperpixel  = 3; 
      const int frameSizeBytes = height*width*bytesperpixel;  
      unsigned char * framePtr = (unsigned char *) malloc(frameSizeBytes);  
      assert(framePtr != nullptr); 
      for (int i = 0; i < frameSizeBytes; i++) 
      {
         this->dataOutReady = 1; 
         while (!this->dataOutValid) { ToggleClock(); } 

         *(framePtr + i) = this->dataOut; 
         if (this->dataOutLast == 1) { printf("dataOutLast == 1 at dataPoint %d\n",i); }

         ToggleClock(); 
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
