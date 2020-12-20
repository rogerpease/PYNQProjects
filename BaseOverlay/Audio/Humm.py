#!/usr/bin/env python3

import math

from pynq.overlays.base import BaseOverlay
base = BaseOverlay("base.bit")
pAudio = base.audio


char_buffer = [int((math.sin(x/1000)+1)*255) for x in range(100000)] 
print (char_buffer) 
uint_buffer = pAudio._ffi.cast('unsigned int*', char_buffer)

pAudio._libaudio.play(length(uint_buffer), uint_buffer,
                            pAudio.sample_len, pAudio.uio_index, pAudio.iic_index)

