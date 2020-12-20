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

img = cv2.imread("./SimplePic.jpg")
smallimg = cv2.resize(img,(100,200)) 
newframe[:] = [255,255,255]
newframe[100:300,100:200] = smallimg
newframe.coherent = True
cv2.imshow('MyImage',newframe) 
cv2.waitKey(0)


#newframe[100:300,100:200] = img[100:300,100:200]
#hdmi_out.writeframe(newframe)  
#time.sleep(1)
#hdmi_out.writeframe(newframe)  
#time.sleep(1)
##hdmi_out.close()
