verilator --cc --exe --trace --build  -j TestFrameCoprocessor.cpp ../InitialVerilog/FrameCoprocessor.sv StreamInOut.cpp 
#CC=/usr/bin/g++ make -j -C obj_dir -f VFrameCoprocessor.mk FrameCoprocessor
