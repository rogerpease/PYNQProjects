verilator -Wall --sc --exe VStreamElement.cpp ../../InitialVerilog/StreamElement.sv 
make -j -C obj_dir -f VStreamElement.mk VStreamElement 
