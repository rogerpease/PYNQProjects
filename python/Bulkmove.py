#!/usr/bin/env python3 



import os
import re 
import sys 




def FindFiles(top):
   oldFileNames = []
   for root, dir, files in os.walk(top):
     for filename in files: 
       oldFileNames.append(os.path.join(root,filename))
   print (oldFileNames)     
   return oldFileNames


def ReplaceWithinFile(oldName,newName,oldFileName,newFileName):
  if (oldFileName != newFileName):
    oldFile = open(oldFileName,"r")
    newFile = open(newFileName,"w") 
    for line in oldFile:
      newLine = re.sub(oldName,newName,line)
      newFile.write(newLine)
    newFile.close()
    oldFile.close()

def MakeChangeList(oldName,newName,oldFileNames):
  changeList = [] 
  for oldFileName in oldFileNames:
    newFileName  = re.sub(oldName,newName,oldFileName) 
    if (newFileName != oldFileName): 
      changeList.append([oldFileName, newFileName]) 
  return changeList 

oldName = sys.argv[1]
newName = sys.argv[2]

oldFileNames = FindFiles(".")
changeList = MakeChangeList(oldName,newName,oldFileNames)
for change in changeList: 
  ReplaceWithinFile(oldName,newName,change[0],change[1])

