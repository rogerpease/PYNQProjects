// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "VSimpleAXIAsyncFIFO__Syms.h"


//======================

void VSimpleAXIAsyncFIFO::trace(VerilatedVcdC* tfp, int, int) {
    tfp->spTrace()->addInitCb(&traceInit, __VlSymsp);
    traceRegister(tfp->spTrace());
}

void VSimpleAXIAsyncFIFO::traceInit(void* userp, VerilatedVcd* tracep, uint32_t code) {
    // Callback from tracep->open()
    VSimpleAXIAsyncFIFO__Syms* __restrict vlSymsp = static_cast<VSimpleAXIAsyncFIFO__Syms*>(userp);
    if (!vlSymsp->_vm_contextp__->calcUnusedSigs()) {
        VL_FATAL_MT(__FILE__, __LINE__, __FILE__,
                        "Turning on wave traces requires Verilated::traceEverOn(true) call before time 0.");
    }
    vlSymsp->__Vm_baseCode = code;
    tracep->module(vlSymsp->name());
    tracep->scopeEscape(' ');
    VSimpleAXIAsyncFIFO::traceInitTop(vlSymsp, tracep);
    tracep->scopeEscape('.');
}

//======================


void VSimpleAXIAsyncFIFO::traceInitTop(void* userp, VerilatedVcd* tracep) {
    VSimpleAXIAsyncFIFO__Syms* __restrict vlSymsp = static_cast<VSimpleAXIAsyncFIFO__Syms*>(userp);
    VSimpleAXIAsyncFIFO* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    {
        vlTOPp->traceInitSub0(userp, tracep);
    }
}

void VSimpleAXIAsyncFIFO::traceInitSub0(void* userp, VerilatedVcd* tracep) {
    VSimpleAXIAsyncFIFO__Syms* __restrict vlSymsp = static_cast<VSimpleAXIAsyncFIFO__Syms*>(userp);
    VSimpleAXIAsyncFIFO* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    const int c = vlSymsp->__Vm_baseCode;
    if (false && tracep && c) {}  // Prevent unused
    // Body
    {
        tracep->declBit(c+66,"streamdatain_aclk", false,-1);
        tracep->declBit(c+67,"streamdatain_aresetn", false,-1);
        tracep->declBit(c+68,"streamdatain_tready", false,-1);
        tracep->declBus(c+69,"streamdatain_tdata", false,-1, 31,0);
        tracep->declBus(c+70,"streamdatain_tstrb", false,-1, 3,0);
        tracep->declBit(c+71,"streamdatain_tlast", false,-1);
        tracep->declBit(c+72,"streamdatain_tvalid", false,-1);
        tracep->declBit(c+73,"streamdataout_aclk", false,-1);
        tracep->declBit(c+74,"streamdataout_aresetn", false,-1);
        tracep->declBit(c+75,"streamdataout_tvalid", false,-1);
        tracep->declBus(c+76,"streamdataout_tdata", false,-1, 31,0);
        tracep->declBus(c+77,"streamdataout_tstrb", false,-1, 3,0);
        tracep->declBit(c+78,"streamdataout_tlast", false,-1);
        tracep->declBit(c+79,"streamdataout_tready", false,-1);
        tracep->declBus(c+82,"SimpleAXIAsyncFIFO C_Control_DATA_WIDTH", false,-1, 31,0);
        tracep->declBus(c+82,"SimpleAXIAsyncFIFO C_FIFO_DEPTH", false,-1, 31,0);
        tracep->declBus(c+82,"SimpleAXIAsyncFIFO C_StreamDataIn_TDATA_WIDTH", false,-1, 31,0);
        tracep->declBus(c+82,"SimpleAXIAsyncFIFO C_StreamDataOut_TDATA_WIDTH", false,-1, 31,0);
        tracep->declBus(c+82,"SimpleAXIAsyncFIFO C_StreamDataOut_START_COUNT", false,-1, 31,0);
        tracep->declBit(c+66,"SimpleAXIAsyncFIFO streamdatain_aclk", false,-1);
        tracep->declBit(c+67,"SimpleAXIAsyncFIFO streamdatain_aresetn", false,-1);
        tracep->declBit(c+68,"SimpleAXIAsyncFIFO streamdatain_tready", false,-1);
        tracep->declBus(c+69,"SimpleAXIAsyncFIFO streamdatain_tdata", false,-1, 31,0);
        tracep->declBus(c+70,"SimpleAXIAsyncFIFO streamdatain_tstrb", false,-1, 3,0);
        tracep->declBit(c+71,"SimpleAXIAsyncFIFO streamdatain_tlast", false,-1);
        tracep->declBit(c+72,"SimpleAXIAsyncFIFO streamdatain_tvalid", false,-1);
        tracep->declBit(c+73,"SimpleAXIAsyncFIFO streamdataout_aclk", false,-1);
        tracep->declBit(c+74,"SimpleAXIAsyncFIFO streamdataout_aresetn", false,-1);
        tracep->declBit(c+75,"SimpleAXIAsyncFIFO streamdataout_tvalid", false,-1);
        tracep->declBus(c+76,"SimpleAXIAsyncFIFO streamdataout_tdata", false,-1, 31,0);
        tracep->declBus(c+77,"SimpleAXIAsyncFIFO streamdataout_tstrb", false,-1, 3,0);
        tracep->declBit(c+78,"SimpleAXIAsyncFIFO streamdataout_tlast", false,-1);
        tracep->declBit(c+79,"SimpleAXIAsyncFIFO streamdataout_tready", false,-1);
        tracep->declBus(c+83,"SimpleAXIAsyncFIFO DEBUG", false,-1, 31,0);
        {int i; for (i=0; i<32; i++) {
                tracep->declQuad(c+1+i*2,"SimpleAXIAsyncFIFO FrameBuffer", true,(i+0), 32,0);}}
        tracep->declBus(c+80,"SimpleAXIAsyncFIFO FIFOStart", false,-1, 4,0);
        tracep->declBus(c+65,"SimpleAXIAsyncFIFO FIFOEnd", false,-1, 4,0);
        tracep->declBit(c+81,"SimpleAXIAsyncFIFO unnamedblk1 twoMoreSlots", false,-1);
    }
}

void VSimpleAXIAsyncFIFO::traceRegister(VerilatedVcd* tracep) {
    // Body
    {
        tracep->addFullCb(&traceFullTop0, __VlSymsp);
        tracep->addChgCb(&traceChgTop0, __VlSymsp);
        tracep->addCleanupCb(&traceCleanup, __VlSymsp);
    }
}

void VSimpleAXIAsyncFIFO::traceFullTop0(void* userp, VerilatedVcd* tracep) {
    VSimpleAXIAsyncFIFO__Syms* __restrict vlSymsp = static_cast<VSimpleAXIAsyncFIFO__Syms*>(userp);
    VSimpleAXIAsyncFIFO* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    {
        vlTOPp->traceFullSub0(userp, tracep);
    }
}

void VSimpleAXIAsyncFIFO::traceFullSub0(void* userp, VerilatedVcd* tracep) {
    VSimpleAXIAsyncFIFO__Syms* __restrict vlSymsp = static_cast<VSimpleAXIAsyncFIFO__Syms*>(userp);
    VSimpleAXIAsyncFIFO* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    vluint32_t* const oldp = tracep->oldp(vlSymsp->__Vm_baseCode);
    if (false && oldp) {}  // Prevent unused
    // Body
    {
        tracep->fullQData(oldp+1,(vlTOPp->SimpleAXIAsyncFIFO__DOT__FrameBuffer[0]),33);
        tracep->fullQData(oldp+3,(vlTOPp->SimpleAXIAsyncFIFO__DOT__FrameBuffer[1]),33);
        tracep->fullQData(oldp+5,(vlTOPp->SimpleAXIAsyncFIFO__DOT__FrameBuffer[2]),33);
        tracep->fullQData(oldp+7,(vlTOPp->SimpleAXIAsyncFIFO__DOT__FrameBuffer[3]),33);
        tracep->fullQData(oldp+9,(vlTOPp->SimpleAXIAsyncFIFO__DOT__FrameBuffer[4]),33);
        tracep->fullQData(oldp+11,(vlTOPp->SimpleAXIAsyncFIFO__DOT__FrameBuffer[5]),33);
        tracep->fullQData(oldp+13,(vlTOPp->SimpleAXIAsyncFIFO__DOT__FrameBuffer[6]),33);
        tracep->fullQData(oldp+15,(vlTOPp->SimpleAXIAsyncFIFO__DOT__FrameBuffer[7]),33);
        tracep->fullQData(oldp+17,(vlTOPp->SimpleAXIAsyncFIFO__DOT__FrameBuffer[8]),33);
        tracep->fullQData(oldp+19,(vlTOPp->SimpleAXIAsyncFIFO__DOT__FrameBuffer[9]),33);
        tracep->fullQData(oldp+21,(vlTOPp->SimpleAXIAsyncFIFO__DOT__FrameBuffer[10]),33);
        tracep->fullQData(oldp+23,(vlTOPp->SimpleAXIAsyncFIFO__DOT__FrameBuffer[11]),33);
        tracep->fullQData(oldp+25,(vlTOPp->SimpleAXIAsyncFIFO__DOT__FrameBuffer[12]),33);
        tracep->fullQData(oldp+27,(vlTOPp->SimpleAXIAsyncFIFO__DOT__FrameBuffer[13]),33);
        tracep->fullQData(oldp+29,(vlTOPp->SimpleAXIAsyncFIFO__DOT__FrameBuffer[14]),33);
        tracep->fullQData(oldp+31,(vlTOPp->SimpleAXIAsyncFIFO__DOT__FrameBuffer[15]),33);
        tracep->fullQData(oldp+33,(vlTOPp->SimpleAXIAsyncFIFO__DOT__FrameBuffer[16]),33);
        tracep->fullQData(oldp+35,(vlTOPp->SimpleAXIAsyncFIFO__DOT__FrameBuffer[17]),33);
        tracep->fullQData(oldp+37,(vlTOPp->SimpleAXIAsyncFIFO__DOT__FrameBuffer[18]),33);
        tracep->fullQData(oldp+39,(vlTOPp->SimpleAXIAsyncFIFO__DOT__FrameBuffer[19]),33);
        tracep->fullQData(oldp+41,(vlTOPp->SimpleAXIAsyncFIFO__DOT__FrameBuffer[20]),33);
        tracep->fullQData(oldp+43,(vlTOPp->SimpleAXIAsyncFIFO__DOT__FrameBuffer[21]),33);
        tracep->fullQData(oldp+45,(vlTOPp->SimpleAXIAsyncFIFO__DOT__FrameBuffer[22]),33);
        tracep->fullQData(oldp+47,(vlTOPp->SimpleAXIAsyncFIFO__DOT__FrameBuffer[23]),33);
        tracep->fullQData(oldp+49,(vlTOPp->SimpleAXIAsyncFIFO__DOT__FrameBuffer[24]),33);
        tracep->fullQData(oldp+51,(vlTOPp->SimpleAXIAsyncFIFO__DOT__FrameBuffer[25]),33);
        tracep->fullQData(oldp+53,(vlTOPp->SimpleAXIAsyncFIFO__DOT__FrameBuffer[26]),33);
        tracep->fullQData(oldp+55,(vlTOPp->SimpleAXIAsyncFIFO__DOT__FrameBuffer[27]),33);
        tracep->fullQData(oldp+57,(vlTOPp->SimpleAXIAsyncFIFO__DOT__FrameBuffer[28]),33);
        tracep->fullQData(oldp+59,(vlTOPp->SimpleAXIAsyncFIFO__DOT__FrameBuffer[29]),33);
        tracep->fullQData(oldp+61,(vlTOPp->SimpleAXIAsyncFIFO__DOT__FrameBuffer[30]),33);
        tracep->fullQData(oldp+63,(vlTOPp->SimpleAXIAsyncFIFO__DOT__FrameBuffer[31]),33);
        tracep->fullCData(oldp+65,(vlTOPp->SimpleAXIAsyncFIFO__DOT__FIFOEnd),5);
        tracep->fullBit(oldp+66,(vlTOPp->streamdatain_aclk));
        tracep->fullBit(oldp+67,(vlTOPp->streamdatain_aresetn));
        tracep->fullBit(oldp+68,(vlTOPp->streamdatain_tready));
        tracep->fullIData(oldp+69,(vlTOPp->streamdatain_tdata),32);
        tracep->fullCData(oldp+70,(vlTOPp->streamdatain_tstrb),4);
        tracep->fullBit(oldp+71,(vlTOPp->streamdatain_tlast));
        tracep->fullBit(oldp+72,(vlTOPp->streamdatain_tvalid));
        tracep->fullBit(oldp+73,(vlTOPp->streamdataout_aclk));
        tracep->fullBit(oldp+74,(vlTOPp->streamdataout_aresetn));
        tracep->fullBit(oldp+75,(vlTOPp->streamdataout_tvalid));
        tracep->fullIData(oldp+76,(vlTOPp->streamdataout_tdata),32);
        tracep->fullCData(oldp+77,(vlTOPp->streamdataout_tstrb),4);
        tracep->fullBit(oldp+78,(vlTOPp->streamdataout_tlast));
        tracep->fullBit(oldp+79,(vlTOPp->streamdataout_tready));
        tracep->fullCData(oldp+80,(vlTOPp->SimpleAXIAsyncFIFO__DOT__FIFOStart),5);
        tracep->fullBit(oldp+81,(vlTOPp->SimpleAXIAsyncFIFO__DOT__unnamedblk1__DOT__twoMoreSlots));
        tracep->fullIData(oldp+82,(0x20U),32);
        tracep->fullIData(oldp+83,(1U),32);
    }
}
