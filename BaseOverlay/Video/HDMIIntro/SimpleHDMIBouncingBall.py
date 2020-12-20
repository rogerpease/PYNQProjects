#!/usr/bin/env python3 
#
# Requires base layer. Make sure HDMI cable is plugged into (upper) port of TUL-2 board. 
#
#

import time
import numpy as np
import cv2 
from pynq.overlays.base import BaseOverlay 
from pynq.lib.video import * 

base = BaseOverlay("base.bit")
hdmi_out = base.video.hdmi_out
hdmi_out.configure(VideoMode(640,480,24),pixelformat=PIXEL_BGR)
hdmi_out.start() 
newframe = hdmi_out.newframe()
for x in range (0,470,10):
  newframe[:] = [255,255,255]
  newframe = cv2.circle(newframe,(x,x),(5),(255,0,0),10)
  newframe.coherent = True
  for i in range(0,10): 
    hdmi_out.writeframe(newframe)  

hdmi_out.close()
