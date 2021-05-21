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


  
fileSet = [ configDirectory+"/images/"+PYNQBitstreamName+".bit", configDirectory+"/images/"+PYNQBitstreamName+".hwh"]

for userFile in userFiles:  
  fileSet += [configDirectory+"/"+userFile]

print (fileSet)

hostip = "192.168.1.128"
commands= []
commands.append("ssh xilinx@"+hostip+"  mkdir /home/xilinx/"+PYNQBitstreamName )

for localFile in fileSet:
  if not path.exists(localFile): 
    print ("Could not find "+localFile); 

commands.append("scp " + " ".join(fileSet) + " xilinx@"+hostip+':/home/xilinx/'+PYNQBitstreamName) 


print (commands)
for command in commands:
  os.system(command)
