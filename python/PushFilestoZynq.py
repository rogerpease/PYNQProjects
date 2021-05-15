#!/usr/bin/env python3 

import sys
import json
from os import path 
import os 
  

configDirectory = "."
configFileName = "config.json"

with open(configFileName,"r") as fp:
  config = json.load(fp)



PYNQBitstreamName = config["BitStreamName"]
userFiles = config["UserFiles"]


  
fileSet = [ 
 [configDirectory+"/images/"+PYNQBitstreamName+".bit", "/home/xilinx/pynq/overlays/"+PYNQBitstreamName+"/"],
 [configDirectory+"/images/"+PYNQBitstreamName+".hwh", "/home/xilinx/pynq/overlays/"+PYNQBitstreamName+"/"]]

for userFile in userFiles:  
  pair = [configDirectory+"/"+userFile, "/home/xilinx/"+PYNQBitstreamName+"/" ] 
  fileSet += [pair]

print (fileSet)


hostip = "192.168.1.128"
commands= []
commands.append("ssh xilinx@"+hostip+"  mkdir /home/xilinx/pynq/overlays/"+PYNQBitstreamName )
commands.append("ssh xilinx@"+hostip+"  mkdir /home/xilinx/"+PYNQBitstreamName )

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
