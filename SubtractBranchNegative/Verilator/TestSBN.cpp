// SystemC global header
//#include <systemc.h>
#include <iostream> 
#include "verilated_vcd_c.h"
#include <stdexcept> 

#include <boost/property_tree/ptree.hpp>
#include <boost/property_tree/json_parser.hpp>
#include <boost/foreach.hpp>


// Include common routines
#include <verilated.h>
#include <VSBNDatapath.h>


#include <iostream>
#include <fstream>

#define TOPCLK top->clk
#define TOPRESET top->reset
#define TOPEVAL top->eval(); 

#define PASSORDIE(x,y) { if (x) { printf("PASS Step %s\n",y); } else {printf("Failed step %s",y);  exit(1); } }

void ToggleClock (const std::unique_ptr<VSBNDatapath> & top) 
{ 
   TOPCLK = 1; Verilated::timeInc(5); TOPEVAL
   TOPCLK = 0; Verilated::timeInc(5); TOPEVAL 
} 



void Reset(const std::unique_ptr<VSBNDatapath> & top) 
{
  ToggleClock(top);  
  top->enable = 0; 
  top->reset = 1; 
  ToggleClock(top);  
  ToggleClock(top);  
  ToggleClock(top);  
  top->reset = 0; 
  ToggleClock(top);  
}


void parseJsonGolden(std::string name,std::vector<unsigned int> & Registers)
{

  std::stringstream ss;
  std::fstream fs;
  try { 
    fs.open (name, std::fstream::in | std::fstream::app);
    ss << fs.rdbuf(); 
    fs.close();
  } 
  catch (...) 
  { 
    throw std::runtime_error("Could not open "+name); 
  }
  
  boost::property_tree::ptree pt;
  boost::property_tree::read_json(ss, pt);
  BOOST_FOREACH(boost::property_tree::ptree::value_type &v, pt.get_child("Registers"))
  {
    Registers.push_back(atoi(v.second.data().c_str())); 
  }

}
void parseJsonSetup(std::string name,std::vector<unsigned int> & Registers, std::vector<unsigned int> & Instructions)
{

  std::stringstream ss;
  std::fstream fs;
  try { 
    fs.open (name, std::fstream::in | std::fstream::app);
    ss << fs.rdbuf(); 
    fs.close();
  } 
  catch (...) 
  { 
    throw std::runtime_error("Could not open "+name); 
  }
  
  boost::property_tree::ptree pt;
  boost::property_tree::read_json(ss, pt);
  BOOST_FOREACH(boost::property_tree::ptree::value_type &v, pt.get_child("Registers"))
  {
    Registers.push_back(atoi(v.second.data().c_str())); 
  }
  BOOST_FOREACH(boost::property_tree::ptree::value_type &v, pt.get_child("Instructions"))
  {
    Instructions.push_back(atoi(v.second.data().c_str())); 
  }

  
}

bool RunTest(const std::unique_ptr<VSBNDatapath> & top, std::string testAssembledFileName, std::string testResultFileName) 
{

  std::vector<unsigned int> RegisterValues; 
  std::vector<unsigned int> GoldenRegisterValues; 
  std::vector<unsigned int> InstructionValues; 

  try { 
    parseJsonSetup(testAssembledFileName,RegisterValues,InstructionValues);
    parseJsonGolden(testResultFileName,GoldenRegisterValues);
  }
  catch (std::exception & e) 
  { 
    std::cout << "Test " << testAssembledFileName << " FAILED! " << e.what() << std::endl;  
    return false;  
  } 
   
  
  Reset(top);
  for (int instr = 0; instr < InstructionValues.size(); instr++)  
    *(top->instructions + instr)     = InstructionValues[instr]; 

  ToggleClock(top);  
  ToggleClock(top);  

  for (int regAddr= 0; regAddr < RegisterValues.size(); regAddr++)  
  {
    top->regAddr         = regAddr; 
    top->regWriteData = RegisterValues[regAddr]; 
    top->regWriteEnable  = 1; 
    ToggleClock(top);  
  }

  top->enable = 1; 
  int timedOut = 0; 
  int cycleCount = 0; 
  while ((!timedOut) && (!top->done))
  {
    ToggleClock(top);
    cycleCount++;
    if (cycleCount > 500) timedOut = 1;  
  }

  bool failed = false; 
  if (timedOut == 1) { printf("FAILED-- timed out!"); failed = true; } 
  for (int regAddr= 0; regAddr < RegisterValues.size(); regAddr++)  
  {
    top->regAddr         = regAddr; 
    top->regWriteEnable  = 0; 
    ToggleClock(top);  

    if ((top->regReadData && 0xFFFF) != (GoldenRegisterValues[regAddr] && 0xFFFF)) 
    {
      std::cout << "Readback Register "<< regAddr <<" Expected " << GoldenRegisterValues[regAddr] << " Actual " << top->regReadData << std::endl;     
      failed = true; 
    }
      
  }
  if (failed) return false; 

  
  return true; 
  
}

int main(int argc, char **argv) 
{

  const std::unique_ptr<VerilatedContext> contextp{new VerilatedContext};
  const std::unique_ptr<VSBNDatapath> top{new VSBNDatapath{contextp.get(), "VSBNDatapath"}};

  Verilated::traceEverOn(true);
  Verilated::commandArgs(argc,argv); 
  
  assert(RunTest(top, "../testcases/testAssembled/Multiply4And3.sbn.json", "../testcases/testResults/Multiply4And3.result.json")); 
  assert(RunTest(top, "../testcases/testAssembled/Divide300By7.sbn.json", "../testcases/testResults/Divide300By7.result.json")); 

  printf("All tests passed!\n"); 

  return 0; 

}
