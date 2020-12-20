#!/usr/bin/env python3

from pynq.overlays.base import BaseOverlay
base = BaseOverlay("base.bit")
pAudio = base.audio

#%matplotlib inline

import matplotlib.pyplot as plt
import math
import time


pAudio.load("/home/xilinx/jupyter_notebooks/base/audio/recording_0.wav")

Channels = 2 
SampFreq = 48000 

numSeconds = len(pAudio.buffer)/(Channels*SampFreq) 

print (numSeconds) 

for i in range(0,len(pAudio.buffer),2):
  second = i/(Channels*SampFreq)
  denom = 120/(second+ 1)
  pAudio.buffer[i]   = (math.sin(i/denom)+1) *  1000000
  pAudio.buffer[i+1] = (math.sin(i/denom)+1) *  1000000

pAudio.play()
