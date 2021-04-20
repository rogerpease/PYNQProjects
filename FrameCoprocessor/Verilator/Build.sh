verilator --cc --exe --build  -j FrameCoprocessor.cpp ../InitialVerilog/FrameCoprocessor.sv
#CC=/usr/bin/g++ make -j -C obj_dir -f VFrameCoprocessor.mk FrameCoprocessor
