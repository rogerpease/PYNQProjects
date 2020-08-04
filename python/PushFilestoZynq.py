#!/usr/bin/env python3 

import sys
import json
from os import path 
import os 
  

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



PYNQBitstreamName = config["BitStreamName"]


  
fileSet = [ 
 [configDirectory+"/images/"+PYNQBitstreamName+".bit", "/home/xilinx/pynq/overlays/"+PYNQBitstreamName+"/"],
 [configDirectory+"/images/"+PYNQBitstreamName+".hwh", "/home/xilinx/pynq/overlays/"+PYNQBitstreamName+"/"],
 [configDirectory+"/python/"+ PYNQBitstreamName+".py", "/home/xilinx" ] ]; 

hostip = "192.168.1.128"
commands= []
commands.append("ssh xilinx@"+hostip+"  mkdir /home/xilinx/pynq/overlays/"+PYNQBitstreamName )

for filePair in fileSet:
  localFile = filePair[0]
  remoteFile = filePair[1]
  if not path.exists(localFile): 
    print ("Could not find "+localFile); 
  else: 
    commands.append("scp " + localFile + " xilinx@"+hostip+':'+remoteFile) 


print (commands)
for command in commands:
  os.system(command)
