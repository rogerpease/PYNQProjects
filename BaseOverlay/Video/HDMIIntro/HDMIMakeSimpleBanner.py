#!/usr/bin/env python3

from time import sleep

from pynq import Overlay
from pynq.lib.video import *
from PIL import ImageFont, ImageDraw, Image


import cv2

base = Overlay('base.bit')
hdmi_out = base.video.hdmi_out




try:
  hdmi_out.configure(VideoMode(640,480,24),pixelformat=PIXEL_RGB)
  hdmi_out.start()
  newframe = hdmi_out.newframe()
  # Set to red. 
  print ("Setting Newframe to white")
  newframe[:] = [0,0,0]  # Set background to black. 

  font = cv2.FONT_HERSHEY_SIMPLEX
  cv2.putText(newframe,
              'Hello World!',
              (220, 220),
              font, 1,
              (255, 255, 255), # Set color to white. 
              2,
              cv2.LINE_4)
#  hdmi_out.writeframe(newframe)
  cv2.imwrite("HelloWorld.png",newframe) 
  sleep(10)
except Exception as e:
  print ("Excepted out!")
  print (e)   

finally: 
  hdmi_out.stop()
