read_verilog [ glob ./Verilog/module/*.v ./Verilog/module/*.sv ]
# Run synthesis
synth_design -top SBNDatapath -part xc7z020clg400-1 -flatten_hierarchy rebuilt
create_clock -period 10.000 -name sys_clk_100mhz -waveform {0.000 5.000} [get_ports clk]
# Write design checkpoint
write_checkpoint -force synthesis/datapath/post_synth
# Write report utilization and timing estimates
write_verilog -force synthesis/datapath/netlist.v
report_utilization -force -file synthesis/datapath/utilization.txt
report_timing -file synthesis/datapath/timing.t
