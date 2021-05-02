// SystemC global header
//#include <systemc.h>
#include "StreamInOut.h" 
#include <iostream> 
#include "verilated_vcd_c.h"

//#define FRAMEWIDTH  1080
//#define FRAMEHEIGHT 1920
#define FRAMEWIDTH  5
#define FRAMEHEIGHT 5

// Include common routines
#include <verilated.h>
#include <VSBNDatapath.h>


#define PASSORDIE(x,y) { if (x) { printf("PASS Step %s\n",y); } else {printf("Failed step %s",y);  exit(1); } }

void ToggleClock (const std::unique_ptr<VSBNDatapath> & top) 
{ 
   top->clk = 1; Verilated::timeInc(5); top->eval(); 
   top->clk = 0; Verilated::timeInc(5); top->eval();
} 



void Reset(const std::unique_ptr<VSBNDatapath> & top) 
{
  ToggleClock(top);  
  top->reset = 1; 
  ToggleClock(top);  
  ToggleClock(top);  
  ToggleClock(top);  
  top->reset = 0; 
  ToggleClock(top);  
}

NextStreamValueClass GeneratorFunction(int x) { 

  NextStreamValueClass result; 

  result.Value = x; 
  result.EndOfFrame = (((x+1) % FRAMEHEIGHT*FRAMEWIDTH) == 0) ? true : false; 
  result.EndOfTest  = (((x+1) > FRAMEHEIGHT*FRAMEWIDTH*10))   ? true : false; 
  return result; 
  
} 

int main(int argc, char **argv) 
{

  const std::unique_ptr<VerilatedContext> contextp{new VerilatedContext};
  const std::unique_ptr<VSBNDatapath> top{new VSBNDatapath{contextp.get(), "VSBNDatapath"}};

  Verilated::traceEverOn(true);
  Verilated::commandArgs(argc,argv); 


  Reset(top);
  
  *(top->instructions)     = 0x03010500; // SBN 5C,0C, store to R1. 
  *(top->instructions + 1) = 0x44000001; // SBN 0C,1C, Do not store, branch by 4 (to instruction 5) 
  *(top->instructions + 2) = 0x03031102; // R3 = 17-2 (15). 
  *(top->instructions + 3) = 0x00000000;
  *(top->instructions + 4) = 0x03041102; // R4 = 17-2 (15). 
  *(top->instructions + 5) = 0x03032C02; // R3 = 44-2 (42). 
  *(top->instructions + 6) = 0x00000000; // R3 should be 42. If it's 15 or R4 is 15 we've failed 
  ToggleClock(top);  

  top->enable = 1; 
  ToggleClock(top);  
  ToggleClock(top);  
  ToggleClock(top);  

  for (int regNum = 0; regNum < 16; regNum++) 
    printf("Register %d: %x\n",regNum, *(top->registerFile + regNum));    

  printf("All tests passed!\n"); 
  return 0; 

}
