#include "StreamInOut.h"
#include <iostream>
#include <sstream>

StreamIn::StreamIn (IData * dataBus, CData* dataTValid, CData* dataTReady, CData* dataTLast, NextStreamValueClass (*GeneratorFunction)(int))
{
    this->dataBus           = dataBus;
    this->dataTValid        = dataTValid;
    this->dataTReady        = dataTReady;
    this->dataTLast         = dataTLast; 
    this->GeneratorFunction = GeneratorFunction; 
    this->enabled           = true;
    this->periodicStallNumerator    = 0; 
    this->periodicStallDenominator  = 10; 
    this->done              = false;
    this->absCycle          = 0;
    this->writeCycle        = 0;
}

void StreamIn::StreamCycle() 
{
   bool ready = ((dataTReady == NULL) || (*dataTReady));
   bool stallCycle = !((periodicStallDenominator == 0) || ((absCycle %periodicStallDenominator) >= periodicStallNumerator));

   if ((ready) && (!done) && (!stallCycle))
   {
      NextStreamValueClass newdata = (*GeneratorFunction)(writeCycle++);
      *dataBus = (IData) newdata.Value;
      dataPushed.push_back(newdata.Value);
      *dataTLast = newdata.EndOfFrame; 
      *dataTValid = 1; 
      this->done = newdata.EndOfTest;
   }
   else if (stallCycle)
   { 
      *dataTValid = 0; 
   } 
   else if (!ready)  
   {
   } 
   else if (done) 
   { 
      *dataTValid = 0; 
   } 

   absCycle++; 

}


StreamOut::StreamOut (IData * dataBus, CData * dataTValid, CData * dataTReady, CData * dataTLast)
{
    this->dataBus                   = dataBus;
    this->dataTValid                = dataTValid;
    this->dataTReady                = dataTReady;
    this->dataTLast                 = dataTLast;
    this->periodicStallNumerator    = 1; 
    this->periodicStallDenominator  = 0; 
    this->absCycle                  = 0; 
}

void StreamOut::StreamCycle()
{
    if ((*dataTValid) && ((dataTReady == NULL) || *dataTReady))
    { 
      std::cout << "Receiving " << std::hex <<  *dataBus <<  std::dec <<  " Last: " << *dataTLast <<  std::endl;; 
      dataReceived.push_back((int) *dataBus); 
    } 
  
    if (dataTReady != NULL) 
    {
      if ((periodicStallDenominator == 0) || ((absCycle %periodicStallDenominator) >= periodicStallNumerator))
        *dataTReady = 1; 
      else 
        *dataTReady = 0; 
    } 
    absCycle++; 

}



StreamComparisonResultClass StreamOut::CompareDataReceived(std::vector<unsigned long int> goldenData)
{
   printf("Comparing data\n"); 
   StreamComparisonResultClass result; 
   result.Pass = true; 
   if (goldenData.size() != this->dataReceived.size()) 
   { 
     std::stringstream note; 
     note  << "Golden Data Size mismatch " << goldenData.size() << " " << dataReceived.size() << std::endl; 
     result.Notes.push_back(note.str()); 
     result.Pass = false; 
   } 
   for (int index = 0; index < std::min(goldenData.size(),dataReceived.size()); index++)
   {
     if (goldenData[index] != dataReceived[index]) 
     { 
       std::stringstream note; 
       note << "Index " << index << " " << std::hex << goldenData[index] << " " << dataReceived[index] << std::dec << std::endl;   
       result.Notes.push_back(note.str()); 
       result.Pass = false;  
     } 
   } 

   return result; 
}

