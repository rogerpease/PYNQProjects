#!/usr/bin/env python3 

#
# NOTE: This script is my own, but most of the verilog code is from auto-generated from an AXI Peripheral TB which I adapted to my needs. 
# NOTE: Normally I'd do this with a makefile but this is more for notes/education purposes so drawing out the steps makes more sense. 
#
# Quick script to capture how to compile verilog for simulation on the command line with Vivado. 
#
#


import os 

os.environ["LD_LIBRARY_PATH"]= "/tools/Xilinx/.xinstall/Vivado_2020.2/lib/lnx64.o:/tools/Xilinx/Vivado/2020.2/lib/lnx64.o:/tools/Xilinx/.xinstall/Vivado_2020.2/lib/lnx64.o/SuSE/"

VIVADO_BIN = "/tools/Xilinx/Vivado/2020.2/bin"


import json
with open("config.json","r") as fp:
  config = json.load(fp)

TopLevelTB = config["TopLevelTB"] 

if (TopLevelTB == ""):
  print("TopLevelTB not found") 



#
# Make sure to use 
#    "-L uva -L axi_vip_v1_1_8 -L xilinx_vip" for all the axi libraries and 
#    --sv for systemverilog
#

os.system("rm -rf xsim.dir") 



VerilogFiles = []
SVFiles      = []
import os
for subdir in ["module","tb"]:
  for file in os.listdir("Verilog/"+subdir):
    if file.endswith(".v"):
        VerilogFiles.append(os.path.join("Verilog/"+subdir, file))
    if file.endswith(".sv"):
        SVFiles.append(os.path.join("Verilog/"+subdir, file))


import subprocess
def Run(commandString):
  result = subprocess.Popen(commandString)
  text = result.communicate()[0]
  return_code = result.returncode  
  print(commandString, " Returning ",return_code)


print ("Running Verilog compile") 
if (len(VerilogFiles)): 
  command = [VIVADO_BIN + "/xvlog", "-work","xil_defaultlib", 
     "--include","./Verilog/include","--include","/tools/Xilinx/Vivado/2020.2/data/xilinx_vip/include"]
  Run(command + VerilogFiles) 

 
print ("Running SystemVerilog compile") 
if (len(SVFiles)): 
  command = [VIVADO_BIN + "/xvlog","--sv","-work","xil_defaultlib","-L","uva","-L","axi_vip_v1_1_8","-L","xilinx_vip", 
    "--include", "./Verilog/include", "--include", "/tools/Xilinx/Vivado/2020.2/data/xilinx_vip/include"] 
  Run(command + SVFiles) 
else:
  print ("No SV Files Found ") 


print ("Running xelab compile") 
command = [VIVADO_BIN + "/xelab", "-wto","fa0545d4865e4787811138bb88188e54","--incr","--debug","typical","--relax",
           "--mt","8","-L","xil_defaultlib","-L","axi_infrastructure_v1_1_0","-L","axi_vip_v1_1_8","-L","uvm","-L","xilinx_vip","-L","unisims_ver",
           "-L","unimacro_ver","-L","secureip","-L","xpm","--snapshot",TopLevelTB,"xil_defaultlib."+TopLevelTB,"xil_defaultlib.glbl",
           "-log","elaborate.log" ]
Run(command) 



