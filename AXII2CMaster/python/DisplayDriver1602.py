#!/usr/bin/env python3 

import time 
from enum import Enum


class DisplayDriver1602:

    def __init__(self,axiIF,Debug=0):
        self.debug = Debug 
        self.axiIF = axiIF 

    # Ref: https://github.com/Freenove/Freenove_Ultimate_Starter_Kit_for_microbit/blob/master/Tutorial.pdf page 222 

    def ECycle (self,DW,RW=0,RS=0,LED=1):
                                               # D7-4       #LED      # E       #RW      #RS
       self.axiIF.InitTransaction(WriteByte = (DW << 4) + (LED<<3) + (0<<2) + (RW<<1) + (RS<<0)) # Set RW and RS
       WaitTime(1000)
       self.axiIF.InitTransaction(WriteByte = (DW << 4) + (LED<<3) + (1<<2) + (RW<<1) + (RS<<0)) # Set RW and RS
       WaitTime(1000)
       self.axiIF.InitTransaction(WriteByte = (DW << 4) + (LED<<3) + (0<<2) + (RW<<1) + (RS<<0)) # Set RW and RS
       WaitTime(1000)

    def Initialize(self):
      # Thanks to http://www.site2241.net/november2014.htm for de-muddying the datasheet. 
      self.ECycle(0x2,RW=0,RS=0) # Function Set
      self.ECycle(0x2,RW=0,RS=0) # Function Set
      self.ECycle(0x8,RW=0,RS=0) # Function Set

      self.ECycle(0x0,RW=0,RS=0) # Set 4-bit mode
      self.ECycle(0xC,RW=0,RS=0) # Set DL=0 L N Mode

      self.ECycle(0x0,RW=0,RS=0) # Set N=0 F=0 Mode
      self.ECycle(0x6,RW=0,RS=0) # Set DL=0 L N Mode
   
      self.ECycle(1,RW=0,RS=0)  # First Line, 1st position
      self.ECycle(1,RW=0,RS=0)

    def WriteLetter(Letter):
      upperNib = ((ord(Letter) >> 4) & 0xF)
      lowerNib = ((ord(Letter))      & 0xF)
      self.ECycle(upperNib,RW=0,RS=1) 
      self.ECycle(lowerNib,RW=0,RS=1) 

    def WriteInstruction(self,dataWord):
      upperNib = ((dataWord >> 4) & 0xF)
      lowerNib = ((dataWord     ) & 0xF)
      self.ECycle(upperNib,RW=0,RS=0) 
      self.ECycle(lowerNib,RW=0,RS=0) 

    #
    # line should be 0 or 1.
    # col should be 0 to 30
    #
    # Ref: https://www.openhacks.com/uploadsproductos/eone-1602a1.pdf
    #
    def SetCursor(self,line,col):
       # Set DDRAM Address.. Bit 7 is 1, address is line * 0x40 + col
       setDdramAddress = 0x40*line + col + (1<<7)
       self.WriteInstruction(setDdramAddress)
   
    def BlankDisplay(self): 
      self.WriteInstruction(1) 

    #
    # my1602.WriteDisplay(["Hello","World"]) 
    #
    def WriteDisplay(self,lines):
      self.WriteInstruction(1)
      lineNum = 0 
      for line in lines: 
        SetCursor(lineNum,0)    
        for character in line:
          WriteLetter(character) 
        lineNum += 1  



#
# Do a self test using the actual driver. This is fine for small projects... if this were a bigger project I would probably
# make a pseudo-driver which just makes sure some basic configuration is sent. 
#

def SelfTest():
   from pynq import Overlay 
   overlay = Overlay("AXII2CMaster.bit") 

   from AXII2CMaster import AXII2CMaster 
   axiIF = AXII2CMaster(overlay.axi_iic_0,0x27) 
   interface = DisplayDriver1602(axiIF,Debug=1)
   interface.WriteDisplay(["I love","Heather Gilligan"]) 




if __name__ == "__main__":
    SelfTest()

