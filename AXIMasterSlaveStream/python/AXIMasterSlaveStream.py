#!/usr/bin/env python3 

import sys
from pynq import Overlay
from pynq import allocate
ol = Overlay("AXIMasterSlaveStream.bit") 

input_buffer     = allocate(shape=(8,),dtype='u4')
output_buffer    = allocate(shape=(8,),dtype='u4')
input_buffer[:]  = [100,200,300,400,500,600,700,800]
output_buffer[:] = [0,0,0,0,0,0,0,0]

#
# Send data to the peripheral. 
#
#
dma = ol.axi_dma_0
dma.sendchannel.transfer(input_buffer)
dma.sendchannel.wait()

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
    sys.exit(1) 
#
# Now stream back 8 words of data. 
#
#


# Confiugre the peripheral to send 0xABCDFF00 .. 0xABCDFF07 

ol.AXIMasterSlaveStream_0.write(0x04,0xABCDFF00) 
ol.AXIMasterSlaveStream_0.write(0x00,0x01) 

dma.recvchannel.transfer(output_buffer)
dma.recvchannel.wait()

for i in range(8):
  expected = 0xABCDFF00 + i 
  if not (output_buffer[i] == expected):
    print("Error on output buffer " + str(i) +      \
          " Expected " + "{:x}".format(expected) +  \
          " Actual " + str(output_buffer[i])) 
    sys.exit(1) 


print ("PASS")
