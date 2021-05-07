#!/usr/bin/env python3 

#
# NOTE: This script is my own, but most of the verilog code is from auto-generated from an AXI Peripheral TB which I adapted to my needs. 
# NOTE: Normally I'd do this with a makefile but this is more for notes/education purposes so drawing out the steps makes more sense. 
#
# Quick script to capture how to compile verilog for simulation on the command line with Vivado. 
# In a "Real" simulation environment I would make this into an object and allow for multiple configurations, snapshots, do directory searches
#  for testcases, run jobs in parallel on servers, etc.. 
#
#


import os 
import subprocess
import json

os.environ["LD_LIBRARY_PATH"]= "/tools/Xilinx/.xinstall/Vivado_2020.2/lib/lnx64.o:/tools/Xilinx/Vivado/2020.2/lib/lnx64.o:/tools/Xilinx/.xinstall/Vivado_2020.2/lib/lnx64.o/SuSE/"

VIVADO_BIN = "/tools/Xilinx/Vivado/2020.2/bin/"


rootDirectory=os.getcwd()+"/" 
runDirectory =os.getcwd()+"/simulation" 
os.system("rm -rf "+runDirectory+"/xsim.dir") 


#
# Make sure to use 
#    "-L uva -L axi_vip_v1_1_8 -L xilinx_vip" for all the axi libraries and 
#    --sv for systemverilog
#





def Run(commandString):
  os.chdir(runDirectory)
  print("Running: "," ".join(commandString))
  result = subprocess.Popen(commandString)
  text = result.communicate()[0]
  return_code = result.returncode  
  print("Returning ",return_code)
  if (return_code != 0):
    exit(1)
   


def RunVerilogCompile(VerilogFiles): 
  print ("Running Verilog compile") 
  if (len(VerilogFiles)): 
    command = [VIVADO_BIN + "xvlog", "-work","xil_defaultlib", 
       "--include",rootDirectory+"/Verilog/include","--include","/tools/Xilinx/Vivado/2020.2/data/xilinx_vip/include"]
    fullPathVerilogFiles = [rootDirectory+VerilogFile for VerilogFile in VerilogFiles] 
    Run(command + fullPathVerilogFiles) 

 
def RunSVCompile(SVFiles): 
  print ("Running SystemVerilog compile") 
  if (len(SVFiles)): 
    command = [VIVADO_BIN + "xvlog","--sv","-work","xil_defaultlib","-L","uva","-L","axi_vip_v1_1_8","-L","xilinx_vip", 
      "--include", rootDirectory+"/Verilog/include", "--include", "/tools/Xilinx/Vivado/2020.2/data/xilinx_vip/include"] 
    fullPathSVFiles = [rootDirectory+SVFile for SVFile in SVFiles] 
    Run(command + fullPathSVFiles) 
  else:
    print ("No SV Files Found ") 


def RunElab(topLevelTB,snapshot): 
  print ("RunElab"," Top: ", topLevelTB," Snap: ", snapshot)
  command = [VIVADO_BIN + "xelab", "-wto","fa0545d4865e4787811138bb88188e54","--incr","--debug","typical","--relax",
           "--mt","8",
           "-L","xil_defaultlib","-L","axi_infrastructure_v1_1_0","-L","axi_vip_v1_1_8","-L","uvm","-L","xilinx_vip","-L","unisims_ver",
           "-L","unimacro_ver","-L","secureip","-L","xpm",
           "--snapshot",snapshot,"xil_defaultlib."+topLevelTB,"xil_defaultlib.glbl",
           "-log","elaborate.log" ]
  Run(command) 


def RunSim(Snapshot,testcase): 
  os.chdir(rootDirectory+"simulation/") 
  command = [VIVADO_BIN + "xsim", Snapshot,"--tclbatch",rootDirectory+"/simulation/scripts/simulation."+Snapshot+"."+testcase+".tcl"] 
  Run(command) 
  os.chdir(rootDirectory) 

if __name__ == "__main__":
  with open("config.json","r") as fp:
    config = json.load(fp)

  try:
    TopLevelTB = config["TopLevelTB"] 
    config["VerilogFiles"]  
    config["SVFiles"]  
  except KeyError:
    print("config TopLevelTB not found")
    exit() 


  try:
    config["Simulations"]  
  except KeyError:
    Snapshots = ["default"]
  else: 
    Snapshots = config["Simulations"] 
  for snapshotName in Snapshots:
    print("Snapshot : "+ snapshotName) 
    for testcaseName in Snapshots[snapshotName]["Testcases"]:
      print("  testcase: "+ testcaseName) 

  RunVerilogCompile(config["VerilogFiles"])
  RunSVCompile(config["SVFiles"])
  for snapshotName in Snapshots:
    RunElab(TopLevelTB,snapshotName) 
    for testcaseName in Snapshots[snapshotName]["Testcases"]:
      RunSim(snapshotName,testcaseName) 


