read_verilog [ glob ./Verilog/module/*.v ./Verilog/module/*.sv ]

# Run synthesis
synth_design -top SimpleAXIFIFO_v1_0 -part xc7z020clg400-1 -flatten_hierarchy rebuilt
# Write design checkpoint
write_checkpoint -force synthesis/post_synth
# Write report utilization and timing estimates
write_verilog -force synthesis/roger.v
report_utilization -file synthesis/utilization.txt
report_timing > synthesis/timing.t
