# Building Steps


These are the major steps I followed to building a PS IP to the PL on my Zynq 7000 TUL-2 Board.  

## Build base RTL Module. 

In this case I built an RTL project called "SimpleLogicModule" initial IP Module and testbench (SimpleLogicModule project).  This is a simple module which takes two 32-bit numbers and adds, subtracts,and performs basic logic functions on them.  

## Build an AXI Slave project.

I named mine "SimpleLogicModuleAXISlave" project. Create it as an RTL project and include the AddSubMulAndOrIP.v file. 
    - Go to Tools->CreateAndPackageNewIP, create a new AXI Peripheral. Name it 'SimpleLogicModuleAXIIP' and Make the version 1_0 (there were some files issues I encountered numbering it  1.0)
    - I used AXI Lite Interface in Slave mode because this is a simple slave module. 
    - Use an address space of 8 32-bit addresses. 
    - Select "Edit IP" at the next window. 
    - There are two levels to the instanced AXI IP- A "top level" if you want to connect any external inputs/outputs (HDMI/etc) and an interface level which holds the state machine to interface to your IP. 
    - Instance your Step 1 IP where it says "Add IP Here". 
      - For inputs (a,b), add these lines just above your IP instance: 
        .a(slv_reg0) (write address offset 0x00) 
        .b(slv_reg1) (address offset 0x04). 
      - Also add wire declarations for the outputs: 
        wire [31:0] sum;
        wire [31:0] difference;
        wire [31:0] bitwiseAnd;
        wire [31:0] bitwiseOr;
        wire [31:0] bitwiseXor;
        wire [31:0] bitwiseXNor;
              
      - Find the Verilog process for updating slv__reg0-7 . Take the outputs for slv_reg2-7 .. then add these (outside the "if wren" statement
                slv_reg2 <=  sum;         //(Address 0x08) 
                slv_reg3 <=  difference;  //(Address 0x0C) 
                slv_reg4 <=  bitwiseAnd;  //(Address 0x10) 
                slv_reg5 <=  bitwiseOr;  //(Address 0x14) 
                slv_reg6 <=  bitwiseXor; //(Address 0x18) 
                slv_reg7 <=  bitwiseXnor; //(Address 0x1C) 

	Don't forget to delete the case entries for h'2 through h'7 (including the defaults). 

    - Go back to the packaging window and Package the IP. BE SURE THE SimpleLogicModule.v file IS IN THE LIST OF EXPORTED FILES.  
    - Close the AddSubMulAndOrAXISlave IP project.  
   
## Build FPGA Overlay

Start a new project called "SimpleLogicModuleFPGAOverlay". It's also an RTL project.  Don't add any RTL but do be sure to select the correct board. Then go to "Create Block Design".... Name your Design "SimpleLogicModuleFPGAOverlayDesign". 
 
Use the schematic viewer to instance two Blocks:  
- Your IP (You may need to go to Settings->IP Repository to add your ip repository to the "IP Repository Catalog"). 
- The ZYNQ processing subsystem. 

Options will appear at the top of the Diagram window: 
   - Run Block Automation
   - Run Connection Automation 
Run both of them. 
   - Right-Click on the FPGA_wrapper.bd file and select "Create HDL Wrapper". 
   - Click on "Generate Bitstream" to generate the bitstream.

## Collect Bit and HWH Files
Once you have built your FPGA Image, collect the following: 

    * The .hwh file (it will be named after your project, like SimpleLogicModuleA.hwh). Rename it to SimpleLogicModule.hwh 
    * The .bit file (it will be named after your wrapper, like SimpleLogicModule_wrapper.bit). Rename it to SimpleLogicModule.bit
    * SimpleLogicModule.py (included in python/) 

And copy them to your Zynq board.  
    Move the .hwh and .bit into pynq/overlays/SimpleLogicModule (you may need to make this directory). 

## Test in Perl

  Run SimpleLogicModule.py to test (you may need to be root)



#Gotchas: 

- Be sure IP of all source files (including your module) is exported when you do AXI peripheral packaging. 
   see: https://forums.xilinx.com/t5/Design-Entry/Can-t-get-custom-IP-with-FIFO-to-synthesize-in-the-top-level/m-p/564966
  Otherwise the FPGA Implementation step will not be able to find the proper IP and adding it afterwards doesn't seem to work.

- Be sure to make a design wrapper HDL out of the top level. Use "Create Design Wrapper" by right-clicking on the top level of the 
  FPGAImplementation. The bitstream program can't make 

- Don't put slv__reg2 <= sum and slv_reg3 <= product into the case statement for the AXI write. I did this and realized I needed 
     to initiate a ghost write cycle to those addresses to make the write happen.


#References:

1. http://www.tul.com.tw/ProductsPYNQ-Z2.html
 
