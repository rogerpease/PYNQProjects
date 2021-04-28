#-----------------------------------------------------------
# Vivado v2020.2 (64-bit)
# SW Build 3064766 on Wed Nov 18 09:12:47 MST 2020
# IP Build 3064653 on Wed Nov 18 14:17:31 MST 2020
# Start of session at: Wed Apr 28 00:04:28 2021
# Process ID: 23339
# Current directory: /home/rpease/PYNQProjects/SimpleAXICommandLine
# Command line: vivado
# Log file: /home/rpease/PYNQProjects/SimpleAXICommandLine/vivado.log
# Journal file: /home/rpease/PYNQProjects/SimpleAXICommandLine/vivado.jou
#-----------------------------------------------------------
create_project project_1 /home/rpease/PYNQProjects/SimpleAXICommandLine/project_1 -part xc7vx485tffg1157-1
ipx::infer_core -vendor user.org -library user -taxonomy /UserIP /home/rpease/PYNQProjects/SimpleAXICommandLine/verilog/module
ipx::edit_ip_in_project -upgrade true -name edit_ip_project -directory /home/rpease/PYNQProjects/SimpleAXICommandLine/project_1/project_1.tmp /home/rpease/PYNQProjects/SimpleAXICommandLine/verilog/module/component.xml
ipx::current_core /home/rpease/PYNQProjects/SimpleAXICommandLine/verilog/module/component.xml
update_compile_order -fileset sources_1
close_project
ipx::infer_core -vendor user.org -library user -taxonomy /UserIP /home/rpease/PYNQProjects/SimpleAXICommandLine/verilog/module
ipx::edit_ip_in_project -upgrade true -name edit_ip_project -directory /home/rpease/PYNQProjects/SimpleAXICommandLine/project_1/project_1.tmp /home/rpease/PYNQProjects/SimpleAXICommandLine/verilog/module/component.xml
ipx::current_core /home/rpease/PYNQProjects/SimpleAXICommandLine/verilog/module/component.xml
update_compile_order -fileset sources_1
ipx::package_project -root_dir /home/rpease/PYNQProjects/SimpleAXICommandLine/verilog/module -vendor user.org -library user -taxonomy /UserIP -force
ipx::merge_project_changes hdl_parameters [ipx::current_core]
set_property core_revision 2 [ipx::current_core]
ipx::create_xgui_files [ipx::current_core]
ipx::update_checksums [ipx::current_core]
ipx::check_integrity [ipx::current_core]
ipx::save_core [ipx::current_core]
set_property  ip_repo_paths  /home/rpease/PYNQProjects/SimpleAXICommandLine/verilog/module [current_project]
update_ip_catalog
