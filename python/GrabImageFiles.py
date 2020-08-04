#!/usr/bin/env python3 

import sys
import os 
import json 


#
# Find a 
#
configFileName = "config.json"
tries = 0 

configDirectory = "./"
while tries < 6 and not os.path.exists(configDirectory + configFileName):
   configDirectory = "../"+configDirectory
   tries = tries + 1

if (tries == 6):
  print ("Could not find configfile")
  sys.exit();

with open(configFileName,"r") as fp:
  config = json.load(fp)


  
# This is to get the directory that the program  
# is currently running in. 
FPGAFabricPath    = config["FPGAImagePath"]
PYNQBitstreamName = config["BitStreamName"] 

if not os.path.exists(configDirectory+FPGAFabricPath): 
  print ("Could not find FPGA Fabric Path " + configDirectory+FPGAFabricPath) 


dir_path = os.path.realpath(FPGAFabricPath)
print ("Dirname: ",dir_path);
  
for root, dirs, files in os.walk(dir_path): 
    for file in files:  
        if file.endswith('.bit'): 
            bitsource = root+'/'+str(file) 
        if file.endswith('.hwh'): 
            hwhsource = root+'/'+str(file) 

if not os.path.exists(configDirectory+"images"):
  os.system("mkdir "+configDirectory+"images") 

hostip = "192.168.1.128"
commands = []
commands.append("cp "+bitsource+" "+configDirectory+"/images/"+PYNQBitstreamName+".bit")
commands.append("cp "+hwhsource+" "+configDirectory+"/images/"+PYNQBitstreamName+".hwh")

print (commands)
for command in commands:
  os.system(command)
