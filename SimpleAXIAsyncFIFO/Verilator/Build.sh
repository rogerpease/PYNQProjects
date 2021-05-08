verilator --cc --exe --trace --build  -j TestSimpleAXIAsyncFIFO.cpp ../Verilog/module/SimpleAXIAsyncFIFO.sv StreamInOut.cpp 
#CC=/usr/bin/g++ make -j -C obj_dir -f VFrameCoprocessor.mk FrameCoprocessor
