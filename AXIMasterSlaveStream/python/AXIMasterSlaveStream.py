#!/usr/bin/env python3 

import time 
import sys
from pynq import Overlay
from pynq import allocate
ol = Overlay("AXIMasterSlaveStream.bit") 

#
# Send data to the peripheral. 
#
dma = ol.axi_dma_0

def TestStreamSlave(input_buffer):

  dma.sendchannel.start() 
  dma.sendchannel.transfer(input_buffer)
  dma.sendchannel.wait()
  dma.sendchannel.stop() 

  #
  # Query the peripheral for the data we sent it. 
  #


  for i in range(8):
    ol.AXIMasterSlaveStream_0.write(0x08,i) 
    actual = ol.AXIMasterSlaveStream_0.read(0x0C)
    if (actual != input_buffer[i]): 
      print("Error on data from input buffer " + str(i) + \
            " Actual " +str(actual) +                     \
            " Expected " + str(input_buffer[i])) 
      return 0 



#
# Set the Master Stream to send us 8 words of data and set an output_buffer to receive them. 
#
#

def TestStreamMaster(baseval):

  # Set DMA to write SS2M data to a specifc physical address 
  output_buffer    = allocate(shape=(8,),dtype='u4')
  output_buffer[:] = 0 
  dma.recvchannel.start() 
  dma.recvchannel.transfer(output_buffer)

  # Confiugre the peripheral to send baseval to baseval + 7
  ol.AXIMasterSlaveStream_0.write(0x00,0x02)
  ol.AXIMasterSlaveStream_0.write(0x00,0x00) 
  ol.AXIMasterSlaveStream_0.write(0x04,baseval)
  ol.AXIMasterSlaveStream_0.write(0x00,0x01) 
   
  dma.recvchannel.wait()
  dma.recvchannel.stop() 

  # Check the data matches. 
  for i in range(8):
    expected = baseval + i 
    if not (output_buffer[i] == expected):
      print("TestStreamMaster: Error on output buffer " + str(i) +      \
          " Expected " + "{:x}".format(expected) +  \
          " Actual " + str(output_buffer[i])) 
      return 0 

input_buffer     = allocate(shape=(8,),dtype='u4')
input_buffer[:]  = [x*100 for x in range(8)] 
TestStreamSlave(input_buffer) 
TestStreamMaster(0xABCDEF00) 
input_buffer[:]  = [(x+8)*100 for x in range(8)] 
TestStreamSlave(input_buffer) 
TestStreamMaster(0xDECADE90)

print ("PASS")
