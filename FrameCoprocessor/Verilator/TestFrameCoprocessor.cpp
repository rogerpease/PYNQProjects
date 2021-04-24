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
#include <VFrameCoprocessor.h>


#define PASSORDIE(x,y) { if (x) { printf("PASS Step %s\n",y); } else {printf("Failed step %s",y);  exit(1); } }

void ToggleClock (const std::unique_ptr<VFrameCoprocessor> & top) 
{ 
   top->masterClock = 1; Verilated::timeInc(5); top->eval(); 
   top->masterClock = 0; Verilated::timeInc(5); top->eval();
} 


bool CheckRegistersProgrammed(const std::unique_ptr<VFrameCoprocessor> & top) 
{

  bool result = 1; 

  top->configRegisterWriteEnable = 1; 
  for (int reg = 0; reg < 32; reg++) 
  {
    top->configRegisterAddress = reg; 
    top->configRegisterDataIn  = 0x01010101*reg; 
    ToggleClock(top);  
  } 
  top->configRegisterWriteEnable = 0; 
    
  for (int reg = 0; reg < 32; reg++) 
  {

    top->configRegisterAddress = reg; 
    ToggleClock(top);  
    if (top->configRegisterDataOut != 0x01010101*reg) { printf("CheckRegistersProgrammed: %d\n", top->configRegisterDataOut); result = 0; }  
 
  }
  return result; 

}


bool CheckRegistersReset(const std::unique_ptr<VFrameCoprocessor>  & top) 
{

  for (int reg = 0; reg < 32; reg++) 
  {
    top->configRegisterAddress = reg; 
    ToggleClock(top);  
    assert(top->configRegisterDataOut == 0); 
  } 
  return 1; 
    
}

void Reset(const std::unique_ptr<VFrameCoprocessor> & top) 
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
  const std::unique_ptr<VFrameCoprocessor> top{new VFrameCoprocessor{contextp.get(), "VFrameCoprocessor"}};

  Verilated::traceEverOn(true);
  Verilated::commandArgs(argc,argv); 

  
  StreamIn  StreamInModule (&top->dataIn , &top->dataInTValid , &top->dataInTReady , &top->dataInTLast ,  &GeneratorFunction); 
  StreamOut StreamOutModule(&top->dataOut, &top->dataOutTValid, &top->dataOutTReady, &top->dataOutTLast); 

  StreamOutModule.periodicStallNumerator   = 2; 
  StreamOutModule.periodicStallDenominator = 5; 

  Reset(top);
  PASSORDIE(CheckRegistersReset(top)     ,"Check Registers were Reset"); 
  PASSORDIE(CheckRegistersProgrammed(top),"Check Registers were programmed"); 
  Reset(top);
  PASSORDIE(CheckRegistersReset(top)     ,"Check Registers were Reset second time"); 

  while (!StreamInModule.done) 
  { 
    StreamInModule.StreamCycle(); 
    ToggleClock(top); 
    StreamOutModule.StreamCycle(); 
  } 
  int countDown = 100;
  while (countDown--)
  { 
    StreamInModule.StreamCycle(); 
    ToggleClock(top); 
    StreamOutModule.StreamCycle(); 
  } 
  auto streamcomparison = StreamOutModule.CompareDataReceived(StreamInModule.dataPushed);
  if (!streamcomparison.Pass)
  {
    printf("Failed Data comparison\n"); 
    for (std::vector<std::string>::iterator iter  = streamcomparison.Notes.begin(); 
                                             iter != streamcomparison.Notes.end(); 
                                             iter++)  
      std::cout << *iter << std::endl;
    exit(1); 
  } 

  printf("All tests passed!\n"); 
  return 0; 

}
