#!/usr/bin/env python3 
#
# To Run: 
#     ./RunSBNOverlay  
#

from pynq import Overlay 
import sys
import json 
import time 


ol = Overlay("SubtractBranchNegative.bit") 
sbn=ol.SBNModule_0

CONTROL   = 16<<2
REGADDR   = 17<<2
REGWRDATA = 18<<2 
REGRDDATA = 19<<2 
IP        = 20<<2 


#
# Load the assembled file: 
#

if (len(sys.argv)) > 1: 
  with open(sys.argv[1]) as f: 
    data = f.read()
  sbnconfig = json.loads(data)

#
# Load the resultsfile: 
#

sbnresults = [] 

if (len(sys.argv)) > 2: 
  with open(sys.argv[2]) as f: 
    data = f.read()
  sbnresults = json.loads(data)


#
# Reset the device 
#
sbn.write(CONTROL,0x1) 
sbn.write(CONTROL,0x0) 

for i in range(len(sbnconfig["Instructions"])):
  sbn.write(i<<2,sbnconfig["Instructions"][i]); 


#
# Populate the Register File in the datapath
#

for i in range(len(sbnconfig["Registers"])):
  sbn.write(REGADDR,(0x000)+i) 
  sbn.write(REGWRDATA,sbnconfig["Registers"][i]) 
  sbn.write(REGADDR,(0x0100)+i) 
  sbn.write(REGADDR,(0x000)+i) 


#
# Run the program 
#
sbn.write(CONTROL,0x2) 

#
# Wait 1 second 
#
time.sleep(1) 
#
#
print("CONTROL Reads " + hex(sbn.read(CONTROL))) 
#
for i in range(0,32):
  print("Control Register " + str(i) + " " + hex(sbn.read(i<<2)))

fail = 0
for i in range(len(sbnconfig["Registers"])):
  sbn.write(REGADDR,i) 
  if (len(sbnresults)):
    actual  = sbn.read(REGRDDATA)
    expected = sbnresults["Registers"][i]
    print("Datapath Register " + str(i) + " Actual  " + hex(sbn.read(REGRDDATA)) + " Expected " + hex(sbnresults["Registers"][i]))
    if ((actual & 0xFFFF) != (expected & 0xFFFF)):
      print ("FAIL!")  
      fail = 1
  else: 
    print("Datapath Register " + str(i) + " Actual  " + hex(sbn.read(REGRDDATA)))

if (fail):
  exit(1)
else:
  if (len(sbnresults)):
    print("PASS!")
  exit(0)
