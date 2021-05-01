#-----------------------------------------------------------
# Vivado v2020.2 (64-bit)
# SW Build 3064766 on Wed Nov 18 09:12:47 MST 2020
# IP Build 3064653 on Wed Nov 18 14:17:31 MST 2020
# Start of session at: Thu Apr 29 22:14:02 2021
# Command line: vivado
#-----------------------------------------------------------
create_project FPGAImage ./FPGAImage -part xc7z020clg400-1
set_property board_part tul.com.tw:pynq-z2:part0:1.0 [current_project]
update_ip_catalog -rebuild
set_property  ip_repo_paths  ./Verilog/module [current_project]
update_ip_catalog
create_bd_design "design_1"
update_compile_order -fileset sources_1
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 processing_system7_0
endgroup
startgroup
create_bd_cell -type ip -vlnv user.org:user:SimpleAXIFIFO_v1_0:1.0 SimpleAXIFIFO_v1_0_0
endgroup
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_dma:7.1 axi_dma_0
endgroup
set_property -dict [list CONFIG.PCW_USE_S_AXI_HP0 {1}] [get_bd_cells processing_system7_0]
apply_bd_automation -rule xilinx.com:bd_rule:processing_system7 -config {make_external "FIXED_IO, DDR" apply_board_preset "1" Master "Disable" Slave "Disable" }  [get_bd_cells processing_system7_0]
startgroup
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config { Clk_master {Auto} Clk_slave {Auto} Clk_xbar {Auto} Master {/processing_system7_0/M_AXI_GP0} Slave {/axi_dma_0/S_AXI_LITE} ddr_seg {Auto} intc_ip {New AXI Interconnect} master_apm {0}}  [get_bd_intf_pins axi_dma_0/S_AXI_LITE]
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config { Clk_master {Auto} Clk_slave {Auto} Clk_xbar {Auto} Master {/processing_system7_0/M_AXI_GP0} Slave {/SimpleAXIFIFO_v1_0_0/control} ddr_seg {Auto} intc_ip {New AXI Interconnect} master_apm {0}}  [get_bd_intf_pins SimpleAXIFIFO_v1_0_0/control]
endgroup
startgroup
set_property -dict [list CONFIG.PCW_USE_S_AXI_HP0 {1}] [get_bd_cells processing_system7_0]
endgroup
connect_bd_intf_net [get_bd_intf_pins SimpleAXIFIFO_v1_0_0/streamdatain] [get_bd_intf_pins axi_dma_0/M_AXIS_MM2S]
startgroup
set_property -dict [list CONFIG.c_include_sg {0} CONFIG.c_sg_include_stscntrl_strm {0} CONFIG.c_include_mm2s_dre {1} CONFIG.c_include_s2mm_dre {1}] [get_bd_cells axi_dma_0]
endgroup
connect_bd_intf_net [get_bd_intf_pins SimpleAXIFIFO_v1_0_0/streamdataout] [get_bd_intf_pins axi_dma_0/S_AXIS_S2MM]
startgroup
apply_bd_automation -rule xilinx.com:bd_rule:clkrst -config { Clk {/processing_system7_0/FCLK_CLK0 (100 MHz)} Freq {100} Ref_Clk0 {} Ref_Clk1 {} Ref_Clk2 {}}  [get_bd_pins SimpleAXIFIFO_v1_0_0/streamdatain_aclk]
apply_bd_automation -rule xilinx.com:bd_rule:clkrst -config { Clk {/processing_system7_0/FCLK_CLK0 (100 MHz)} Freq {100} Ref_Clk0 {} Ref_Clk1 {} Ref_Clk2 {}}  [get_bd_pins SimpleAXIFIFO_v1_0_0/streamdataout_aclk]
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config { Clk_master {Auto} Clk_slave {Auto} Clk_xbar {Auto} Master {/axi_dma_0/M_AXI_MM2S} Slave {/processing_system7_0/S_AXI_HP0} ddr_seg {Auto} intc_ip {New AXI Interconnect} master_apm {0}}  [get_bd_intf_pins processing_system7_0/S_AXI_HP0]
endgroup
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config { Clk_master {/processing_system7_0/FCLK_CLK0 (100 MHz)} Clk_slave {/processing_system7_0/FCLK_CLK0 (100 MHz)} Clk_xbar {/processing_system7_0/FCLK_CLK0 (100 MHz)} Master {/axi_dma_0/M_AXI_S2MM} Slave {/processing_system7_0/S_AXI_HP0} ddr_seg {Auto} intc_ip {/axi_mem_intercon} master_apm {0}}  [get_bd_intf_pins axi_dma_0/M_AXI_S2MM]
save_bd_design
make_wrapper -files [get_files ./FPGAImage/FPGAImage.srcs/sources_1/bd/design_1/design_1.bd] -top
add_files -norecurse ./FPGAImage/FPGAImage.gen/sources_1/bd/design_1/hdl/design_1_wrapper.v
launch_runs impl_1 -to_step write_bitstream -jobs 2
wait_on_run impl_1
