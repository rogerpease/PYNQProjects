read_verilog [ glob ./Verilog/module/*.v ./Verilog/module/*.sv ]
#read_xdc ./scripts/bft_full.xdc
# Run synthesis
synth_design -top SBNDatapath -part xc7z020clg400-1 -flatten_hierarchy rebuilt
# Write design checkpoint
write_checkpoint -force outputDir/post_synth
# Write report utilization and timing estimates
write_verilog roger.v
report_utilization -file utilization.txt
report_timing > timing.t
