#!/usr/bin/env python3 

#
# Simple Audio player. The reference material doesn't go much into 
#   Audio channels so I try to address that gap here. 
# 
#  There are two audio jacks... 
#     this program writes to the HP+MIC one on the longer side of the TUL-2 board. 
#
#
from pynq.overlays.base import BaseOverlay

import numpy as np
import math

adc_sample_freq = 48000             # Number of samples we need to provide per second. 

base = BaseOverlay("base.bit")
pAudio = base.audio

pAudio.configure(sample_rate=adc_sample_freq)
pAudio.select_microphone()

num_samples = adc_sample_freq*2*10  # 10-seconds of dual-channel audio

#
# Build an array in numpy of int32s.
# The DAC is only 24 bits wide (actually wide for a DAC)
#  so they range from +2^13 (about 8 million) to -2^13 (about -8 million).
#
samples = np.zeros(num_samples).astype(np.int32)
TwoPi = math.pi*2 
amplitude = 500000 

#
# Build two sine-waves. 
#
def MakeSample(sample,tone_freq):
  return int(math.sin((sample*TwoPi)*tone_freq/adc_sample_freq)*amplitude)

for sample in range(0,num_samples,2): 
  # Make a rising/falling frequency between 300 and 700. 
  # Divide sample number by 2 because we have one sample for each channel. 
  tone_freq = 200*math.cos((sample/2)*TwoPi/(2*adc_sample_freq)) + 500
  samples[sample] = MakeSample(sample/2,tone_freq)

  # Make a 'siren' sound. Should switch every quarter second. 
  if (((sample/2) % adc_sample_freq) > (adc_sample_freq/2)):  
     tone_freq = 1200
  else:
     tone_freq = 800 
  samples[sample+1] = MakeSample(sample/2,tone_freq)

pAudio.buffer     = samples
pAudio.sample_len = num_samples

# Should hear a tone which rises and falls in one ear and a 'siren' in the other. 
print("Playing")
pAudio.play()
print("Stopped Playing")

