#!/usr/bin/env python3
#
# Capture a still image from HDMI IN and save it to myPicture.png
#
#
#

import time

from pynq import Overlay
from pynq.lib.video import *

base = Overlay('base.bit')
hdmi_in = base.video.hdmi_in

hdmi_in.configure()

hdmi_in.start()

frame = hdmi_in.readframe()
frame.save("pic.npy")


