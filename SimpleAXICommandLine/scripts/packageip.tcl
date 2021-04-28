#-----------------------------------------------------------
# Vivado v2020.2 (64-bit)
# SW Build 3064766 on Wed Nov 18 09:12:47 MST 2020
# IP Build 3064653 on Wed Nov 18 14:17:31 MST 2020
# Start of session at: Tue Apr 27 23:10:29 2021
# Process ID: 15417
# Current directory: /home/rpease/PYNQProjects/SimpleAXICommandLine/useless
# Command line: vivado
# Log file: /home/rpease/PYNQProjects/SimpleAXICommandLine/useless/vivado.log
# Journal file: /home/rpease/PYNQProjects/SimpleAXICommandLine/useless/vivado.jou
#-----------------------------------------------------------

create_project managed_ip_project ./managed_ip_project -part xc7z020clg400-1 -ip
set_property board_part tul.com.tw:pynq-z2:part0:1.0 [current_project]
set_property target_simulator XSim [current_project]
ipx::infer_core -vendor rogerpease.com -library rpease -taxonomy /UserIP /home/rpease/PYNQProjects/SimpleAXICommandLine/verilog/module
ipx::edit_ip_in_project -upgrade true -name SimpleAXICommandLine -directory ./managed_ip_project/managed_ip_project.tmp /home/rpease/PYNQProjects/SimpleAXICommandLine/verilog/module/component.xml
ipx::current_core /home/rpease/PYNQProjects/SimpleAXICommandLine/verilog/module/component.xml
update_compile_order -fileset sources_1
ipx::merge_project_changes files [ipx::current_core]
set_property core_revision 2 [ipx::current_core]
ipx::update_source_project_archive -component [ipx::current_core]
ipx::create_xgui_files [ipx::current_core]
ipx::update_checksums [ipx::current_core]
ipx::check_integrity [ipx::current_core]
ipx::save_core [ipx::current_core]
ipx::move_temp_component_back -component [ipx::current_core]
close_project -delete
set_property  ip_repo_paths  /home/rpease/PYNQProjects/SimpleAXICommandLine/ip_repo [current_project]
update_ip_catalog
