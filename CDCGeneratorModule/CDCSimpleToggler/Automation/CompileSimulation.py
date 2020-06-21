#!/usr/bin/env python3

import os
import sys

VIVADO_PATH = "/tools/Xilinx/Vivado/2019.2/bin/"

def CheckSimulationLog(): 
  f = open("simulation.log")
  for line in f:
    if line.find("PASS") != -1: 
      return 1 
  return 0
 
print ("Running Simulation")
os.system(VIVADO_PATH+"xelab -prj ../CDCSimpleToggler.sim/sim_1/behav/xsim/tb_CDCSimpleToggler_vlog.prj xil_defaultlib.tb_CDCSimpleToggler -s simulationModel -debug all ")
os.system("rm simulation.log") 
os.system(VIVADO_PATH+"xsim simulationModel -t simulation.tcl --log simulation.log") 

if CheckSimulationLog():
   print ("DONE AND PASS") 
   sys.exit(0) 
else:  
   print ("FAILED!")
   print ("Run: \n"+VIVADO_PATH+"xsim simulationModel -t simulation.tcl --log simulation.log --gui \n        to debug") 
   sys.exit(1) 
