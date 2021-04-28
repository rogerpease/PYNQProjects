create_project FPGAImage /home/rpease/PYNQProjects/SimpleAXICommandLine/FPGAImage -part xc7z020clg400-1
set_property board_part tul.com.tw:pynq-z2:part0:1.0 [current_project]
create_bd_design "block_design_1"
update_compile_order -fileset sources_1
set_property  ip_repo_paths  /home/rpease/PYNQProjects/SimpleAXICommandLine/verilog/module [current_project]
update_ip_catalog
startgroup
create_bd_cell -type ip -vlnv user.org:user:myip_v1_0:1.0 myip_v1_0_0
endgroup
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 processing_system7_0
endgroup
apply_bd_automation -rule xilinx.com:bd_rule:processing_system7 -config {make_external "FIXED_IO, DDR" apply_board_preset "1" Master "Disable" Slave "Disable" }  [get_bd_cells processing_system7_0]
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config { Clk_master {Auto} Clk_slave {Auto} Clk_xbar {Auto} Master {/processing_system7_0/M_AXI_GP0} Slave {/myip_v1_0_0/s00_axi} ddr_seg {Auto} intc_ip {New AXI Interconnect} master_apm {0}}  [get_bd_intf_pins myip_v1_0_0/s00_axi]
make_wrapper -files [get_files /home/rpease/PYNQProjects/SimpleAXICommandLine/FPGAImage/FPGAImage.srcs/sources_1/bd/block_design_1/block_design_1.bd] -top
add_files -norecurse /home/rpease/PYNQProjects/SimpleAXICommandLine/FPGAImage/FPGAImage.gen/sources_1/bd/block_design_1/hdl/block_design_1_wrapper.v
launch_runs impl_1 -to_step write_bitstream -jobs 2
wait_on_run impl_1
