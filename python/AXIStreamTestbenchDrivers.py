#!/usr/bin/env python3 

import sys

# Meant to receive data from the Master. 
# WriteTask(taskTag,hierarchy): 
#
# Usage Example: 
#    WriteTask("Master1","DUT.AXIStreamInterface1.M00_AXIS_0"): 
#
#

def WriteAXIMasterStreamTestbenchDriver(taskTag,hierarchy): 
  
    result  = "  # Written by AXIMasterStreamTestbenchDriver.py "+taskTag+" " + hierarchy + "\n"
    result += "  reg [7:0]  " + taskTag + "ReceivedDataCount;\n" 
    result += "  reg [31:0] " + taskTag + "DataCaptured [0:7];\n"
    result += "  reg "+taskTag+ "_Tready;\n"
    result += "  assign  "+hierarchy+"_tready = "+taskTag+"_Tready; \n" 
    result += "  task ReceiveMasterData();  " 
    result += "  begin   \n" 
    result += "    receivedDataCount = 0;\n"
    result += "    masterTready = 0; \n"
    result += "    #300;\n" 
    result += "    while (receivedDataCount < 8) begin\n"
    result += "      @(posedge clock);\n" 
    result += "      "+taskTag+"_Tready = 1;\n"
    result += "      if ( "+hierarchy+"_tready == 1) begin\n"; 
    result += "          "+taskTag+"DataCaptured[receivedDataCount] = "+hierarchy+"_tdata\n";
    result += "          "+taskTag+"ReceivedDataCount = "+taskTag+"ReceivedDataCount + 1;\n" 
    result += "      end\n" 
    result += "    end\n" 
    result += "    "+taskTag+"_Tready = 0;\n"
    result += "  end\n"
    result += "  endtask\n"
    return result 

  
def WriteAXISlaveStreamTestbench(tagName,hierarchy):
    result  = "   reg [7:0] "+tagName +"_dataCount;\n"
    result .= "   reg "+tagName +"_tvalid;\n"
    result .= "   reg "+tagName +"_tlast;\n"
    result .= "   reg [31:0] "+tagName +"_tdata;\n"
    result .= "   reg  [3:0] "+tagName +"_tstrb;\n"
    result .= "   assign  "+hierarchy+"_tvalid   = "+tagName +"_tvalid;\n"
    result .= "   assign  "+hierarchy+"_tlast    = "+tagName +"_tlast;\n"
    result .= "   assign  "+hierarchy+"_tdata    = "+tagName +"_tdata;\n"
    result .= "   assign  "+hierarchy+"_tstrb    = "+tagName +"_tstrb;\n"
    result .= "\n"
    result .= "   initial\n"
    result .= "    begin\n"
    result .= "      "+tagName +"_dataCount = 0;\n"
    result .= "      "+tagName +"_tdata = 0;\n"
    result .= "      "+tagName +"_tvalid = 0;\n"
    result .= "      "+tagName +"_tlast = 0;\n"
    result .= "      "+tagName +"_tstrb = 0;\n"
    result .= "      #300;\n"
    result .= "      while (dataCount < 8) begin\n"
    result .= "        @(posedge clock);\n"
    result .= "        tvalid = 1;\n"
    result .= "        if ( DUT.AXIStreamSlave_v0_1_bfm_1_i.S00_AXIS_0_tready == 1) begin\n"
    result .= "           dataCount = dataCount + 1;\n"
    result .= "           tdata = {dataCount[7:0],dataCount[7:0],dataCount[7:0],dataCount[7:0]};\n"
    result .= "           tstrb = 'hF;\n"
    result .= "           if ("+tagName +"_dataCount == 7)\n"
    result .= "              "+tagName +"_tlast = 1;\n"
    result .= "           else\n"
    result .= "              "+tagName +"_tlast = 0;\n"
    result .= "        end\n"
    result .= "       tvalid = 0;\n"
    result .= "    end \n"

    return result 


