#include <vector> 
#include <verilated.h>
#include <verilated_heavy.h>


class NextStreamValueClass {
 public:
  IData Value; 
  CData EndOfFrame;
  bool EndOfTest;
};

class StreamComparisonResultClass { 
 public:
   StreamComparisonResultClass () { Pass = false; }  
   bool Pass; 
   std::vector<std::string> Notes; 
}; 

class StreamIn { 
   public: 
    StreamIn (IData * dataBus, CData * dataTReady, CData * dataTValid, CData * dataTLast, NextStreamValueClass (*GeneratorFunction)(int ));   
    IData * dataBus;
    CData * dataTValid; 
    CData * dataTReady;  
    CData * dataTLast;  

    NextStreamValueClass (*GeneratorFunction)(int );  
    int periodicStallNumerator; 
    int periodicStallDenominator; 
    int absCycle;
    int writeCycle;
    bool enabled; 
    bool done; 
    bool debug; 
    void StreamCycle(); 
    std::vector<unsigned long int> dataPushed;  // Data which has already been pushed (do not put data to be pushed in here). 
}; 
 
class StreamOut { 
   public: 
    StreamOut (IData * dataBus, CData * dataTReady,CData * dataTValid, CData * dataTLast);   
    IData * dataBus;
    CData * dataTValid;  
    CData * dataTReady;  
    CData * dataTLast;  

    bool done; 
    bool debug; 

    int absCycle;
    int periodicStallNumerator; 
    int periodicStallDenominator; 
    std::vector<unsigned long int> dataReceived; // Data I have received on this interface. 
    void StreamCycle(); 
    StreamComparisonResultClass CompareDataReceived(std::vector<unsigned long int> goldenData); 
}; 




