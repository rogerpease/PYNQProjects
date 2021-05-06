read_verilog [ glob ./Verilog/module/*.v ./Verilog/module/*.sv ]
#read_xdc ./scripts/bft_full.xdc
# Run synthesis
synth_design -top SBNModule -part xc7z020clg400-1 -flatten_hierarchy rebuilt
create_clock -period 10.000 -name sys_clk_100mhz -waveform {0.000 5.000} [get_ports sbndatapath_aclk]
# Write design checkpoint
write_checkpoint -force synthesis/post_synth
# Write report utilization and timing estimates
write_verilog -force synthesis/netlist.v
report_utilization -force -file synthesis/utilization.txt
report_timing -file synthesis/timing.t
