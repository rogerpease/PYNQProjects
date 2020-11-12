#!/usr/bin/env python3 

# 
# Make sure HDMI-OUT is plugged into HDMI-IN on TUL-2. 
#
#

from pynq import Overlay
overlay = Overlay("StaticLoopbackFPGAImage.bit")

hdmi = overlay.HDMIStaticLoopback_0


def runLoopbackCheck: 
  assert(hdmi.read(0x1c) == 0xdeba7e00)
  for i in range(15): 
    hdmi.write(0x00,i) # Write a value out the HDMI bus 
    assert(hdmi.read (0x04) == i)  # and read it back in. 


runLoopbackCheck()
