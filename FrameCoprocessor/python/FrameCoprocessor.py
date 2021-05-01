#!/usr/bin/env python3 

import time 
import sys
from pynq import Overlay
from pynq import allocate
ol = Overlay("FrameCoprocessor.bit") 

#
# Send data to the peripheral. 
#
dma = ol.axi_dma_0

def CompareLists(a,b):
   if (set(a) != set(b)): 
     return 0
   return 1

if CompareLists([1,2],[3,4]) == 1:
   print ("COMPARELISTS BROKEN") 
   exit(0)

def TestStreamSlave(depth):

  # Send MM2S data from CPU Memory to Stream by DMA. 


  sendBuffer = allocate(shape=(depth,),dtype='u4')
  sendBuffer[:] = [100+i for i in range(0,depth)] 
  recvBuffer = allocate(shape=(depth,),dtype='u4')
  recvBuffer[:] = 0 

  dma.recvchannel.start() 
  dma.recvchannel.transfer(recvBuffer)
  dma.sendchannel.start() 
  dma.sendchannel.transfer(sendBuffer)
  dma.sendchannel.wait()
  dma.sendchannel.stop() 
  dma.recvchannel.wait()
  dma.recvchannel.stop() 
  CompareLists(sendBuffer,recvBuffer)

#
# Basic Test 
#


if (TestStreamSlave(400) == 0):
   print("FAILED!")
   exit(1)

print ("PASS")
