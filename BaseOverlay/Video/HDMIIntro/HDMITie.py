#!/usr/bin/env python3
#
# Simple script copied from Jupyter Notebook to tie HDMI in to out. 
#
# You need to have a signal source going to HDMI in and a monitor tied to HDMI Out. 
#  
#

import time
from time import sleep 

from pynq import Overlay
from pynq.lib.video import *

base = Overlay('base.bit')
hdmi_in = base.video.hdmi_in
hdmi_out = base.video.hdmi_out

hdmi_in.configure()
hdmi_out.configure(hdmi_in.mode)

hdmi_in.start()
hdmi_out.start()

hdmi_in.tie(hdmi_out)
sleep(10)
hdmi_out.start()
hdmi_out.stop()
