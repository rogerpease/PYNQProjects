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

rm -rf FPGAImage 
mkdir FPGAImage 
$VIVADO_BIN/vivado -mode batch -source scripts/makeimage.tcl
echo "Run the following: "
echo "   ssh xilinx@192.168.1.128  "
echo "    (on xilinx board) mkdir /home/xilinx/pynq/overlays/SimpleAXICommandLine "
echo "   scp ./FPGAImage/FPGAImage.runs/impl_1/block_design_1_wrapper.bit xilinx@192.168.1.128:/home/xilinx/pynq/overlays/SimpleAXICommandLine "
echo "   scp ./FPGAImage/FPGAImage.gen/sources_1/bd/block_design_1/hw_handoff/block_design_1.hwh xilinx@192.168.1.128:/home/xilinx/pynq/overlays/SimpleAXICommandLine "  
