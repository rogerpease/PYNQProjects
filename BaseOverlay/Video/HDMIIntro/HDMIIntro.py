#!/usr/bin/env python3

import time

from pynq import Overlay
from pynq.lib.video import *

base = Overlay('base.bit')
hdmi_in = base.video.hdmi_in
hdmi_out = base.video.hdmi_out

hdmi_in.configure()
hdmi_out.configure(hdmi_in.mode)

hdmi_in.start()
hdmi_out.start()

startTime = time.time()
lastFrameTime = time.time()
timedOut = 0
frameDelay = 16.67
# Simple loop to read a frame, wait an amount of time, and write it out. 
while timedOut == 0:
  while (((time.time() - lastFrameTime) * 1000) < frameDelay):  
    pass
  lastFrameTime = time.time()
  frame = hdmi_in.readframe()
  hdmi_out.writeframe(frame)
  timedOut = (time.time()-startTime > 10)

hdmi_out.start()
hdmi_out.stop()
