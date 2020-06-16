Steps:

These are the major steps I followed to building a PS IP to the PL. 

1) Built an RTL project called "AddSubMulAndOrIP" initial IP Module and testbench (AddSubMulDiv project). 
    This is a simple module which takes two 32-bit numbers and adds, subtracts, multiples and divides them. 
2) Built a "AddSubMulAndOrAXISlave" project. It's an RTL Project, but once I started it I ran the "Create AXI IP" sequence. 
    It provided an RTL module for AXI interface. 
    - I used AXI Slave because this is a simple slave module. If I wanted to stream data I would need something more complex.  
    - Use an address space of 8 32-bit addresses. 
    - There are two levels to the instanced AXI IP- A "top level" if you want to connect any external inputs/outputs (HDMI/etc) 
         and an interface level which holds the state machine to interface to your IP. 
    - Instance your Step 1 IP where it says "Add IP Here". 
      - For inputs (a,b), tie .a to slv_reg0 (write address offset 0x00) and .b to slv_reg1 (address offset 0x04). 
      - There is a Verilog process for updating slv_reg0-7. 
      Take the outputs (sum,difference,product,quotient,remainder) and connect 
         them as follows:
                slv_reg2 <=  sum;         (Address 0x08) 
                slv_reg3 <=  difference;  (Address 0x0C) 
                slv_reg4 <=  productLSW;  (Address 0x10) 
                slv_reg5 <=  productHSW;  (Address 0x14) 
                slv_reg6 <=  aandb;       (Address 0x18) 
                slv_reg7 <=  aorb;        (Address 0x1C) 

            NOTE: These are assigned inside a "if (wren) statement". Move them outside it, otherwise you'll need a dummy write cycle. 

    - Go back to the packaging window and Package the IP. BE SURE THE RTL OF THE DESIGN IS IN THE LIST OF EXPORTED FILES.  
3) Start a new project called "AddSubMulAndOrFPGAOverlay". It's also an RTL project. 
    Then go to "Create Block Design".... Use the schematic viewer to instance two Blocks:  
	Your IP (You may need to go to settings to add your ip repository to the "IP Repository Catalog"). 
	The ZYNQ processing subsystem. 
    Once you instance your ZYNQ, the tool will offer to add connections and do hookup to your module(s).  
    Be sure to:
	- Add a clock constraint of 125 MHz (8 ns).  
    

   - Click on the FPGA_
   - Click on "Generate Bitstream" to generate the bitstream.

4) Once you have built your FPGA Image, collect the following: 

    * The .hwh file (it will be named after your project, like AddSubMulDivOverlay.hwh). Rename it 
    * The .bit file (it will be named after your wrapper, like AddSubMulDivOverlay_wrapper.bit). Rename it to AddSubMulDivOverlay.bit
    * AddSubMulDiv.py (included in python/) 

   And copy them to your Zynq. 
    Move the .hwh and .bit into pynq/overlays/AddSubMulAndOr (you may need to make this directory). 

5)  Run AddSubMulDiv.py to test (you may need to be root)



Gotchas: 
- Be sure IP of all source files (including your module) is exported when you do AXI peripheral packaging. 
   see: https://forums.xilinx.com/t5/Design-Entry/Can-t-get-custom-IP-with-FIFO-to-synthesize-in-the-top-level/m-p/564966
  Otherwise the FPGA Implementation step will not be able to find the proper IP and adding it afterwards doesn't seem to work.

- Be sure to make a design wrapper HDL out of the top level. Use "Create Design Wrapper" by right-clicking on the top level of the 
  FPGAImplementation. The bitstream program can't make 

- Don't put slv_reg2 <= sum and slv_reg3 <= product into the case statement for the AXI write. I did this and realized I needed 
     to initiate a ghost write cycle to those addresses to make the write happen.

