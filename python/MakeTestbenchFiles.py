#!/usr/bin/python3 
 
#
# Used to generate simple master stream receivers and slave stream generators. 
#
#  Usage: 
#     
#   <projectarea>/python/MakeTestbenchFiles.py   
#   from: 
#   <projectarea>/Peripheral 
#   with: 
#   <projectarea>/Peripheral/config.json  
#
#
#
#
#
from AXITestbenchGenDrivers import WriteReceiveFromAXIMasterStreamTestbenchDriver
from AXITestbenchGenDrivers import WriteDriveToAXISlaveStreamTestbenchDriver
import sys 

from Config import Config



if len(sys.argv) == 1:  # No arguments- run a test. 
  peripheral = "Peripheral1"
  configFileName = "testConfig.json"
else: 
  peripheral = sys.argv[1]
  configFileName = "config.json"

config = Config(configFileName=configFileName)

print ("Found "+ str(len(config.GetListOfPeripheralInterfaces(peripheral))) + " interfaces")


def WriteStreamModules():

   streamModulesBody  = "    // \n" 
   streamModulesBody += "    // Write Stream Modules Generated code begin "
   streamModulesBody += "    // \n" 
   resetFunctions = []; 

   for interface in config.GetListOfPeripheralInterfaces(peripheral):
     tag = interface 
     masterSlave =  config.GetPeripheralInterfaceInfo(peripheral,interface,"MasterSlave")
     interfaceType =  config.GetPeripheralInterfaceInfo(peripheral,interface,"Type")
     hierarchy = config.GetPeripheralInterfaceInfo(peripheral,interface,"Hierarchy")

     if (interfaceType == "Stream"):
       if (masterSlave == "Master"):
         valid,result,resetFunction = WriteReceiveFromAXIMasterStreamTestbenchDriver(tag,hierarchy)
         streamModulesBody += result
         resetFunctions.append(resetFunction+"();")
       elif (masterSlave == "Slave"):
         valid,result,resetFunction = WriteDriveToAXISlaveStreamTestbenchDriver(tag,hierarchy)
         streamModulesBody += result
         resetFunctions.append(resetFunction+"();")

   # Write the initialization functions.
   streamModulesBody += "\n\n"
   streamModulesBody += "  initial begin\n"
   for func in resetFunctions:
     streamModulesBody += "    "+func+"\n" 
   streamModulesBody += "  end\n"
   streamModulesBody += "\n\n"
   streamModulesBody += "  // \n" 
   streamModulesBody += "  // Write Stream Modules Generated code end\n"
   streamModulesBody += "  // \n" 
   return streamModulesBody


print(WriteStreamModules())
