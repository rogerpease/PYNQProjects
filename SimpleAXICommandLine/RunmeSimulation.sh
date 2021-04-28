#!/bin/sh

#
# NOTE: This script is my own, but most of the verilog code is from auto-generated from an AXI Peripheral TB which I adapted to my needs. 
# NOTE: Normally I'd do this with a makefile but this is more for notes/education purposes so drawing out the steps makes more sense. 
#
# Quick script to capture how to compile verilog for simulation on the command line with Vivado. 
#
#


export LD_LIBRARY_PATH=/tools/Xilinx/.xinstall/Vivado_2020.2/lib/lnx64.o:/tools/Xilinx/Vivado/2020.2/lib/lnx64.o:/tools/Xilinx/.xinstall/Vivado_2020.2/lib/lnx64.o/SuSE/

export VIVADO_BIN=/tools/Xilinx/Vivado/2020.2/bin



#
# Make sure to use 
#    "-L uva -L axi_vip_v1_1_8 -L xilinx_vip" for all the axi libraries and 
#    --sv for systemverilog
#

rm -rf xsim.dir

$VIVADO_BIN/xvlog -work xil_defaultlib \
   --include "./verilog/include"  \
   --include "/tools/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
    "verilog/myip_v1_0_S00_AXI.v" \
    "verilog/myip_v1_0.v" \
    "verilog/myip_v1_0_bfm_1_myip_0_0.v" 


 
$VIVADO_BIN/xvlog --sv -work xil_defaultlib -L uva -L axi_vip_v1_1_8 -L xilinx_vip \
  --include "./verilog/include"  \
  --include "/tools/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"verilog/myip_v1_0_bfm_1_master_0_0_pkg.sv" \
"verilog/myip_v1_0_bfm_1_master_0_0.sv" 


$VIVADO_BIN/xvlog -work xil_defaultlib -L uva -L axi_vip_v1_1_8 -L xilinx_vip \
    --include "./verilog/include"  \
    --include "/tools/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
  "verilog/myip_v1_0_bfm_1.v" \
  "verilog/myip_v1_0_bfm_1_wrapper.v" 

$VIVADO_BIN/xvlog --sv -work xil_defaultlib -L uva -L axi_vip_v1_1_8 -L xilinx_vip \
    --include "./verilog/include"  \
    --include "/tools/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
  "verilog/myip_v1_0_tb.sv"

# compile glbl module

$VIVADO_BIN/xvlog -work xil_defaultlib -L uva -L axi_vip_v1_1_8 -L xilinx_vip  verilog/glbl.v

$VIVADO_BIN/xelab -wto fa0545d4865e4787811138bb88188e54 --incr --debug typical --relax --mt 8 -L xil_defaultlib -L axi_infrastructure_v1_1_0 -L axi_vip_v1_1_8 -L uvm -L xilinx_vip -L unisims_ver -L unimacro_ver -L secureip -L xpm --snapshot myip_v1_0_tb_behav xil_defaultlib.myip_v1_0_tb xil_defaultlib.glbl -log elaborate.log

$VIVADO_BIN/xsim myip_v1_0_tb_behav --tclbatch simulation.tcl


echo "Must show PTGEN_TEST: PASSED!"

