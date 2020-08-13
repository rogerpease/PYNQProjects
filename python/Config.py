#!/usr/bin/env python3 

#
# Holds configuration information about a project. 
#
#
#
# { "FPGAImagePath": "Hi", "BitStreamName": "bitstreamName", 
#  "Peripherals": { 
#        "Peripheral1": { 
#                "Interfaces": 
#   {
#   "master1":      { "MasterSlave": "Slave", "Type": "Lite", "Hierarchy": "DUT.Peripheral1_inst.S00_AXI_0_"},
#   "masterStream": { "MasterSlave": "Master", "Type": "Stream", "Hierarchy": "DUT.`BD_INST_NAME.AXIMasterSlaveStreamIP_0.m00_axis"},
#   "slaveStream":  { "MasterSlave": "Slave", "Type": "Stream", "Hierarchy": "DUT.`BD_INST_NAME.AXIMasterSlaveStreamIP_0.s00_axis"}
#   } 
#	}
#   } 
# }
#
#
#
import sys
import os 
import json 


class Config:


   def __init__(self,configFileName="config.json"): 
     foundConfigFile = self.findConfigFile(configFileName)
     if foundConfigFile:
       with open(self.configFilePathName,"r") as fp:
         self.config = json.load(fp)
         self.valid  = 1 
     else:
         self.valid  = 0
  

   def findConfigFile(self,configFileName):
     tries = 0 
     configDirectory = "./"
     while tries < 6 and not os.path.exists(configDirectory + configFileName):
        configDirectory = "../"+configDirectory
        tries = tries + 1

     if (tries == 6):
       print ("Could not find "+configFileName)
       return 0
     else:
       self.configFilePathName = configDirectory+configFileName
       self.configDirectory    = configDirectory
       return 1

   def FPGAImagePath(self):
      return self.configDirectory+self.config["FPGAImagePath"] 

   def BitStreamName(self):
      return self.config["BitStreamName"] 

   def ConfigDirectory(self):
      return self.configDirectory

   def GetListOfPeripherals(self):
      return self.config["Peripherals"].keys() 

   def PeripheralConfig(self,peripheral):
      return self.config["Peripherals"][peripheral]  

   def GetListOfPeripheralInterfaces(self,peripheral):
      result = []
      for interface in self.config["Peripherals"][peripheral]["Interfaces"].keys():  
         result.append(interface) 
      return result 
      
   def GetPeripheralInterfaceInfo(self,peripheral,interface,key):
      return self.config["Peripherals"][peripheral]["Interfaces"][interface][key]  

def SelfTest():
   myConfig = Config(configFileName="testConfig.json") 
   assert(myConfig.valid == 1)
   assert(myConfig.config['FPGAImagePath'] == "Hi")
   peripherals = myConfig.GetListOfPeripherals() 
   assert(len(peripherals) == 1) 
   assert(len(myConfig.GetListOfPeripheralInterfaces("Peripheral1")) == 3) 
   assert(myConfig.GetPeripheralInterfaceInfo("Peripheral1","master1","MasterSlave") == "Slave") 
   assert(myConfig.GetPeripheralInterfaceInfo("Peripheral1","masterStream","MasterSlave") == "Master") 
   assert(myConfig.GetPeripheralInterfaceInfo("Peripheral1","slaveStream","MasterSlave") == "Slave") 
   print("PASS") 



#
# SelfTest the module. 
#

if __name__=="__main__":
  SelfTest()



