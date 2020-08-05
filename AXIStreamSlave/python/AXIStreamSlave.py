#!/usr/bin/env python3 

from pynq import allocate 
from pynq import Overlay
ol = Overlay("AXIStreamSlave.bit")

input_buffer = allocate(shape=(5,),dtype='u4')
input_buffer[:] = [243243,934224324,77,2500,77777777]


dma = ol.axi_dma_0
dma.sendchannel.transfer(input_buffer) 
dma.sendchannel.wait()


