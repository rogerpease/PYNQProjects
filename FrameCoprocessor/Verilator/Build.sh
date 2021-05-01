verilator --cc --exe --trace --build  -j TestFrameCoprocessorMain.cpp ../Verilog/module/FrameCoprocessorMain.sv StreamInOut.cpp 
#CC=/usr/bin/g++ make -j -C obj_dir -f VFrameCoprocessor.mk FrameCoprocessor
