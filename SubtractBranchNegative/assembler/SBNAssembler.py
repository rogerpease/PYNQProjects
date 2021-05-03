#!/usr/bin/env python3 


#
# Instructions take the form: 
#   .setreg  1  0x1234    # Set Register 1 to 0x1234 
#   # Comment- ignored 
#   SBN R4, R3, R1,4      # R4=R3-R1, Branch by 4 if R3-R1 < 0
#   SBN R3, R3, 14,2      # R3=R3-R1, Branch by 2 if R3-1 < 0
#

import re

def AssembleInstruction(instruction):
  result = {"IsComment":0,"IsSet": 0, "Opcode": 0 }
  
  instruction = re.sub("#.*","",instruction)
  instruction = re.sub("^ *","",instruction)
  if (instruction == ""):
    result["IsComment"] = 1 
    return result 
  if (instruction.startswith ("SBN ")):
    instruction = re.sub("#.*","",instruction)
    return result 
     


def Test():
  assert(AssembleInstruction("# Comment")["IsComment"] == 1); 
  assert(AssembleInstruction("# Comment")["IsComment"] == 0); 
   


if __name__ == "__main__":
  Test() 
