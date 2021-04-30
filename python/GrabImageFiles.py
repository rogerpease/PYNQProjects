#!/usr/bin/env python3 

import sys
import os 
import json 


#
# Find a 
#
configFileName = "config.json"

try:
  with open(configFileName,"r") as fp:
    config = json.load(fp)
except:
  exit("Could not open config.json") 

configDirectory = "."
  
# This is to get the directory that the program  
# is currently running in. 
FPGAImagePath    = config["FPGAImagePath"]
PYNQBitstreamName = config["BitStreamName"] 

if not os.path.exists(FPGAImagePath): 
  print ("Could not find FPGA Image Path " + FPGAImagePath) 


dir_path = os.path.realpath(FPGAImagePath)
print ("Dirname: ",dir_path);
  
for root, dirs, files in os.walk(dir_path): 
    for file in files:  
        if file.endswith('.bit'): 
            bitsource = root+'/'+str(file) 
        if file.endswith('.hwh'): 
            hwhsource = root+'/'+str(file) 

try:
  hwhsource
except:
  print("Could not find HWH file") 

if not os.path.exists("images"):
  os.system("mkdir images") 

hostip = "192.168.1.128"
commands = []
commands.append("cp "+bitsource+" "+configDirectory+"/images/"+PYNQBitstreamName+".bit")
commands.append("cp "+hwhsource+" "+configDirectory+"/images/"+PYNQBitstreamName+".hwh")

print (commands)
for command in commands:
  os.system(command)
