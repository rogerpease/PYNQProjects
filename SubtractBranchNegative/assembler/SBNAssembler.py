#!/usr/bin/env python3 


#
#
#  Roger D. Pease  -- Subtract and Branch if Negative assembler. 
#
#
#
# Instructions take the form: 
#   .setreg  R1  0x1234    # Set Register 1 to 0x1234 
#   # Comment- ignored 
#   SBN R4, R3, R1,4      # R4=R3-R1, Branch by 4 if R3-R1 < 0
#   SBN R3, R3, 14,2      # R3=R3-R1, Branch by 2 if R3-1 < 0
#
#
# Obvious TODOs include
#    * Bombproofing/error checking.
#

import re
import sys 
import json

def usage():
  print("Usage:  SBNAssembler.py  filename.sbn [outfilename]") 
  print("  Outputs filename.sbn.json (unless an outfilename is specified)") 

def ParseField(val):
  IsConst = 1
  if (val.startswith("R")):
    IsConst = 0
    val = re.sub("R","",val)
  return (IsConst,int(val))

#
#
#
#

def AssembleInstruction(instruction):
  result = {"IsComment":0,"IsSet": 0, "Opcode": 0,"Min": 0, "MinIsConst": 0,"Subtr":0, "SubtrIsConst":0,"DestReg":0,"DestSetVal": 0,"IsInstr": 0}
  opcode = 0
  instruction = re.sub("#.*","",instruction)
  instruction = re.sub("^ *","",instruction)
  if (instruction == ""):
    result["IsComment"] = 1 
    return result 
  if (instruction.startswith (".setreg")):
    instruction = re.sub("^\.setreg *","",instruction)
    instruction = re.sub(" +"," ",instruction) # Make everything one space
    reg,val = instruction.split(" ") 
    reg = re.sub("R","",reg) # remove R 
    result["IsSet"] = 1
    result["DestReg"] = int(reg)  
    result["DestSetVal"] = int(val)  
    return result 
     
  if (instruction.startswith ("SBN ")):
    result["IsInstr"] = 1 
    instruction = re.sub("SBN *","",instruction)
    instruction = re.sub(" +","",instruction)
    fields = instruction.split(",")
    isConst,Val = ParseField(fields[2])
    opcode |= (Val & 0xFF)
    opcode |= isConst << 24
    result["Subtr"] = Val 
    result["SubtrIsConst"] = isConst 

    isConst,Val = ParseField(fields[1])
    opcode |= (Val & 0xFF)  << 8
    opcode |= isConst << 25
    result["Min"] = Val 
    result["MinIsConst"] = isConst

    # Target Register 
    isConst,Val = ParseField(fields[0])
    result["Rdiff"] = Val 
    opcode |= Val<< 16

    # Branch (if negative) 
    isConst,Val = ParseField(fields[3])
    opcode |= (Val & 0xF) << 28
    result["Opcode"] = opcode 
    return result 
  return result     

def ParseAssemblyFile(filename):
  resultFile = ""
  opcodes = [] 
  registerVals = [0 for x in range(0,15)] 
  f = open(filename,"r")
  for line in f:
     result = AssembleInstruction(line)
     if (result["IsSet"] == 1):
       registerVals[result["DestReg"]] = result["DestSetVal"]
     elif (result["IsInstr"] == 1):
       opcodes.append(result["Opcode"])
     elif not (result["IsComment"]):
       print("Unrecognized instruction "+line)
       exit(1) 
  resultFile = "{ \"Instructions\": ["
  opcodesStrs = [str(x) for x in opcodes]
  resultFile += ",".join(opcodesStrs)
  resultFile += "],\"Registers\": ["
  registerValsHex = [str(x) for x in registerVals]
  resultFile += ",".join(registerValsHex)
  resultFile += "]}"
  return resultFile 


def Test():
  assert(AssembleInstruction("# Comment")["IsComment"] == 1); 
  assert(AssembleInstruction("SBN R4,R3,8,4")["SubtrIsConst"] == 1) 
  assert(AssembleInstruction("SBN R4,R3,R2,4")["SubtrIsConst"] == 0) 
  assert(AssembleInstruction("SBN R4,R3,12,4")["SubtrIsConst"] == 1) 
  assert(AssembleInstruction("SBN R4,17,R1,4")["MinIsConst"] == 1) 
  assert(AssembleInstruction("SBN R4,R3,R1,4")["MinIsConst"] == 0) 
  assert(AssembleInstruction("SBN R4,R3,R1,4")["IsSet"] == 0) 
  assert(AssembleInstruction("SBN R4,R3,R1,4")["IsInstr"] == 1) 
  assert(AssembleInstruction(".setreg R6 4494")["IsSet"] == 1) 
  assert(AssembleInstruction(".setreg R6 4494")["IsInstr"] == 0) 
  assert(AssembleInstruction(".setreg R6 4494")["DestReg"] == 6) 
  assert(AssembleInstruction(".setreg R6 4494")["DestSetVal"] == 4494) 

  Test1JSONString = ParseAssemblyFile("testSourceData/Test1.sbn") 
  file = json.loads(Test1JSONString)
  assert(file["Registers"][0] == 0) 
  assert(file["Registers"][1] == 0) 
  assert(file["Registers"][2] == 2042) 
  assert(file["Registers"][7] == 2048) 
  assert(file["Instructions"][0] == int("40030201",16)) 
  assert(file["Instructions"][1] == int("43030201",16)) 


#  assert(file.opcode[0] == 
#
#  Main Routine:  
#
#


if __name__ == "__main__":
  if (len(sys.argv) < 2):
    # If no command line arguments specified, do a development self-test and show usage. 
    Test() 
    usage()
    exit()
  else:
    # Parse file and write JSON. 
    resultFile = ParseAssemblyFile(sys.argv[1]) 
    resultFN = sys.argv[1]+".json"
    if len(sys.argv) == 3: 
      resultFN = sys.argv[2]
    resultFileFH = open(resultFN,"w")
    resultFileFH.write(resultFile) 
    resultFileFH.close()
