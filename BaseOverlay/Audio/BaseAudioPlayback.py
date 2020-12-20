#!/usr/bin/env python3 


#
# Copied from Jupyter Notebooks. 
#
#
from pynq.overlays.base import BaseOverlay
base = BaseOverlay("base.bit")


pAudio = base.audio
pAudio.select_microphone()
pAudio.load("/home/xilinx/jupyter_notebooks/base/audio/recording_0.wav")
pAudio.play()




