#-----------------------------------------------------------
# Vivado v2020.2 (64-bit)
# SW Build 3064766 on Wed Nov 18 09:12:47 MST 2020
# IP Build 3064653 on Wed Nov 18 14:17:31 MST 2020
# Start of session at: Thu Apr 29 11:45:55 2021
# Process ID: 8194
# Current directory: /home/rpease/PYNQProjects/AXIMasterSlaveStream
# Command line: vivado
# Log file: /home/rpease/PYNQProjects/AXIMasterSlaveStream/vivado.log
# Journal file: /home/rpease/PYNQProjects/AXIMasterSlaveStream/vivado.jou
#-----------------------------------------------------------

create_project FPGAImage ./FPGAImage -part xc7z020clg400-1
set_property board_part tul.com.tw:pynq-z2:part0:1.0 [current_project]
set_property  ip_repo_paths  ./Verilog/module [current_project]
update_ip_catalog
create_bd_design "design_1"
update_compile_order -fileset sources_1
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 processing_system7_0
endgroup
startgroup
create_bd_cell -type ip -vlnv rogerpease.com:rogerpease:AXIMasterSlaveStreamIP_v1_0:1.0 AXIMasterSlaveStream_0
endgroup
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_dma:7.1 axi_dma_0
endgroup
apply_bd_automation -rule xilinx.com:bd_rule:processing_system7 -config {make_external "FIXED_IO, DDR" apply_board_preset "1" Master "Disable" Slave "Disable" }  [get_bd_cells processing_system7_0]
startgroup
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config { Clk_master {Auto} Clk_slave {Auto} Clk_xbar {Auto} Master {/processing_system7_0/M_AXI_GP0} Slave {/axi_dma_0/S_AXI_LITE} ddr_seg {Auto} intc_ip {New AXI Interconnect} master_apm {0}}  [get_bd_intf_pins axi_dma_0/S_AXI_LITE]
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config { Clk_master {Auto} Clk_slave {Auto} Clk_xbar {Auto} Master {/processing_system7_0/M_AXI_GP0} Slave {/AXIMasterSlaveStream_0/s00_axi} ddr_seg {Auto} intc_ip {New AXI Interconnect} master_apm {0}}  [get_bd_intf_pins AXIMasterSlaveStream_0/s00_axi]
endgroup
connect_bd_intf_net [get_bd_intf_pins axi_dma_0/M_AXIS_MM2S] [get_bd_intf_pins AXIMasterSlaveStream_0/s00_axis]
connect_bd_intf_net [get_bd_intf_pins AXIMasterSlaveStream_0/m00_axis] [get_bd_intf_pins axi_dma_0/S_AXIS_S2MM]
connect_bd_net [get_bd_pins axi_dma_0/m_axi_sg_aclk] [get_bd_pins processing_system7_0/FCLK_CLK0]
connect_bd_net [get_bd_pins axi_dma_0/m_axi_mm2s_aclk] [get_bd_pins processing_system7_0/FCLK_CLK0]
connect_bd_net [get_bd_pins axi_dma_0/m_axi_s2mm_aclk] [get_bd_pins processing_system7_0/FCLK_CLK0]
connect_bd_net [get_bd_pins AXIMasterSlaveStream_0/s00_axis_aclk] [get_bd_pins processing_system7_0/FCLK_CLK0]
connect_bd_net [get_bd_pins AXIMasterSlaveStream_0/m00_axis_aclk] [get_bd_pins processing_system7_0/FCLK_CLK0]
connect_bd_net [get_bd_pins AXIMasterSlaveStream_0/m00_axis_aresetn] [get_bd_pins axi_dma_0/mm2s_prmry_reset_out_n]
connect_bd_net [get_bd_pins axi_dma_0/s2mm_sts_reset_out_n] [get_bd_pins AXIMasterSlaveStream_0/s00_axis_aresetn]
make_wrapper -files [get_files ./FPGAImage/FPGAImage.srcs/sources_1/bd/design_1/design_1.bd] -top
add_files -norecurse ./FPGAImage/FPGAImage.gen/sources_1/bd/design_1/hdl/design_1_wrapper.v
launch_runs impl_1 -to_step write_bitstream -jobs 2
wait_on_run impl_1
open_run impl_1
