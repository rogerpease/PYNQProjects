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
#include <VSimpleAXIAsyncFIFO.h>


#define PASSORDIE(x,y) { if (x) { printf("PASS Step %s\n",y); } else {printf("Failed step %s",y);  exit(1); } }

void ToggleClock (const std::unique_ptr<VSimpleAXIAsyncFIFO> & top) 
{ 
   top->streamdatain_aclk = 1; top->streamdataout_aclk = 1; 
   Verilated::timeInc(5); top->eval(); 
   top->streamdatain_aclk = 0; top->streamdataout_aclk = 0; 
   Verilated::timeInc(5); top->eval();
} 



void Reset(const std::unique_ptr<VSimpleAXIAsyncFIFO> & top) 
{
  ToggleClock(top);  
  top->streamdatain_aresetn = 0; 
  top->streamdataout_aresetn = 0; 
  ToggleClock(top);  
  ToggleClock(top);  
  ToggleClock(top);  
  top->streamdatain_aresetn = 1; 
  top->streamdataout_aresetn = 1; 
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
  const std::unique_ptr<VSimpleAXIAsyncFIFO> top{new VSimpleAXIAsyncFIFO{contextp.get(), "VSimpleAXIAsyncFIFO"}};

  Verilated::traceEverOn(true);
  Verilated::commandArgs(argc,argv); 

  
  StreamIn  StreamInModule (&top->streamdatain_tdata, &top->streamdatain_tvalid , &top->streamdatain_tready , &top->streamdatain_tlast ,  &GeneratorFunction); 
  StreamOut  StreamOutModule (&top->streamdataout_tdata, &top->streamdataout_tvalid , &top->streamdataout_tready , &top->streamdataout_tlast ); 

  StreamOutModule.periodicStallNumerator   = 2; 
  StreamOutModule.periodicStallDenominator = 5; 

  Reset(top);

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
