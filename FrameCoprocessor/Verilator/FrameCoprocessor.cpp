// SystemC global header
//#include <systemc.h>

// Include common routines
#include <verilated.h>
#include <VFrameCoprocessor.h>


#define PASSORDIE(x,y) { if (x) { printf("PASS Step %s\n",y); } else {printf("Failed step %s",y);  exit(1); } }

void ToggleClock (const std::unique_ptr<VFrameCoprocessor> & top) { top->masterClock = 1; top->eval(); top->masterClock = 0; top->eval(); } 

bool TestPipeline(const std::unique_ptr<VFrameCoprocessor> & top) 
{
    const int numElements = 3000; 
    
    for (int i = 0; i < numElements; i++) 
    { 

   
    } 

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
  top->eval();
}

int main(int argc, char **argv) 
{

  Verilated::commandArgs(argc,argv); 

  const std::unique_ptr<VerilatedContext> contextp{new VerilatedContext};
  const std::unique_ptr<VFrameCoprocessor> top{new VFrameCoprocessor{contextp.get(), "VFrameCoprocessor"}};
  
  Reset(top);
  PASSORDIE(CheckRegistersReset(top)     ,"Check Registers were Reset"); 
  PASSORDIE(CheckRegistersProgrammed(top),"Check Registers were programmed"); 
  Reset(top);
  PASSORDIE(CheckRegistersReset(top)     ,"Check Registers were Reset second time"); 

  printf("All tests passed!\n"); 
  return 0; 

}
