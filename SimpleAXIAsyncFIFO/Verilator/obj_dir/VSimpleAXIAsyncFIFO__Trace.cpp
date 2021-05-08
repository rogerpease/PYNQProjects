// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "VSimpleAXIAsyncFIFO__Syms.h"


void VSimpleAXIAsyncFIFO::traceChgTop0(void* userp, VerilatedVcd* tracep) {
    VSimpleAXIAsyncFIFO__Syms* __restrict vlSymsp = static_cast<VSimpleAXIAsyncFIFO__Syms*>(userp);
    VSimpleAXIAsyncFIFO* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Variables
    if (VL_UNLIKELY(!vlSymsp->__Vm_activity)) return;
    // Body
    {
        vlTOPp->traceChgSub0(userp, tracep);
    }
}

void VSimpleAXIAsyncFIFO::traceChgSub0(void* userp, VerilatedVcd* tracep) {
    VSimpleAXIAsyncFIFO__Syms* __restrict vlSymsp = static_cast<VSimpleAXIAsyncFIFO__Syms*>(userp);
    VSimpleAXIAsyncFIFO* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    vluint32_t* const oldp = tracep->oldp(vlSymsp->__Vm_baseCode + 1);
    if (false && oldp) {}  // Prevent unused
    // Body
    {
        if (VL_UNLIKELY(vlTOPp->__Vm_traceActivity[1U])) {
            tracep->chgQData(oldp+0,(vlTOPp->SimpleAXIAsyncFIFO__DOT__FrameBuffer[0]),33);
            tracep->chgQData(oldp+2,(vlTOPp->SimpleAXIAsyncFIFO__DOT__FrameBuffer[1]),33);
            tracep->chgQData(oldp+4,(vlTOPp->SimpleAXIAsyncFIFO__DOT__FrameBuffer[2]),33);
            tracep->chgQData(oldp+6,(vlTOPp->SimpleAXIAsyncFIFO__DOT__FrameBuffer[3]),33);
            tracep->chgQData(oldp+8,(vlTOPp->SimpleAXIAsyncFIFO__DOT__FrameBuffer[4]),33);
            tracep->chgQData(oldp+10,(vlTOPp->SimpleAXIAsyncFIFO__DOT__FrameBuffer[5]),33);
            tracep->chgQData(oldp+12,(vlTOPp->SimpleAXIAsyncFIFO__DOT__FrameBuffer[6]),33);
            tracep->chgQData(oldp+14,(vlTOPp->SimpleAXIAsyncFIFO__DOT__FrameBuffer[7]),33);
            tracep->chgQData(oldp+16,(vlTOPp->SimpleAXIAsyncFIFO__DOT__FrameBuffer[8]),33);
            tracep->chgQData(oldp+18,(vlTOPp->SimpleAXIAsyncFIFO__DOT__FrameBuffer[9]),33);
            tracep->chgQData(oldp+20,(vlTOPp->SimpleAXIAsyncFIFO__DOT__FrameBuffer[10]),33);
            tracep->chgQData(oldp+22,(vlTOPp->SimpleAXIAsyncFIFO__DOT__FrameBuffer[11]),33);
            tracep->chgQData(oldp+24,(vlTOPp->SimpleAXIAsyncFIFO__DOT__FrameBuffer[12]),33);
            tracep->chgQData(oldp+26,(vlTOPp->SimpleAXIAsyncFIFO__DOT__FrameBuffer[13]),33);
            tracep->chgQData(oldp+28,(vlTOPp->SimpleAXIAsyncFIFO__DOT__FrameBuffer[14]),33);
            tracep->chgQData(oldp+30,(vlTOPp->SimpleAXIAsyncFIFO__DOT__FrameBuffer[15]),33);
            tracep->chgQData(oldp+32,(vlTOPp->SimpleAXIAsyncFIFO__DOT__FrameBuffer[16]),33);
            tracep->chgQData(oldp+34,(vlTOPp->SimpleAXIAsyncFIFO__DOT__FrameBuffer[17]),33);
            tracep->chgQData(oldp+36,(vlTOPp->SimpleAXIAsyncFIFO__DOT__FrameBuffer[18]),33);
            tracep->chgQData(oldp+38,(vlTOPp->SimpleAXIAsyncFIFO__DOT__FrameBuffer[19]),33);
            tracep->chgQData(oldp+40,(vlTOPp->SimpleAXIAsyncFIFO__DOT__FrameBuffer[20]),33);
            tracep->chgQData(oldp+42,(vlTOPp->SimpleAXIAsyncFIFO__DOT__FrameBuffer[21]),33);
            tracep->chgQData(oldp+44,(vlTOPp->SimpleAXIAsyncFIFO__DOT__FrameBuffer[22]),33);
            tracep->chgQData(oldp+46,(vlTOPp->SimpleAXIAsyncFIFO__DOT__FrameBuffer[23]),33);
            tracep->chgQData(oldp+48,(vlTOPp->SimpleAXIAsyncFIFO__DOT__FrameBuffer[24]),33);
            tracep->chgQData(oldp+50,(vlTOPp->SimpleAXIAsyncFIFO__DOT__FrameBuffer[25]),33);
            tracep->chgQData(oldp+52,(vlTOPp->SimpleAXIAsyncFIFO__DOT__FrameBuffer[26]),33);
            tracep->chgQData(oldp+54,(vlTOPp->SimpleAXIAsyncFIFO__DOT__FrameBuffer[27]),33);
            tracep->chgQData(oldp+56,(vlTOPp->SimpleAXIAsyncFIFO__DOT__FrameBuffer[28]),33);
            tracep->chgQData(oldp+58,(vlTOPp->SimpleAXIAsyncFIFO__DOT__FrameBuffer[29]),33);
            tracep->chgQData(oldp+60,(vlTOPp->SimpleAXIAsyncFIFO__DOT__FrameBuffer[30]),33);
            tracep->chgQData(oldp+62,(vlTOPp->SimpleAXIAsyncFIFO__DOT__FrameBuffer[31]),33);
            tracep->chgCData(oldp+64,(vlTOPp->SimpleAXIAsyncFIFO__DOT__FIFOEnd),5);
        }
        tracep->chgBit(oldp+65,(vlTOPp->streamdatain_aclk));
        tracep->chgBit(oldp+66,(vlTOPp->streamdatain_aresetn));
        tracep->chgBit(oldp+67,(vlTOPp->streamdatain_tready));
        tracep->chgIData(oldp+68,(vlTOPp->streamdatain_tdata),32);
        tracep->chgCData(oldp+69,(vlTOPp->streamdatain_tstrb),4);
        tracep->chgBit(oldp+70,(vlTOPp->streamdatain_tlast));
        tracep->chgBit(oldp+71,(vlTOPp->streamdatain_tvalid));
        tracep->chgBit(oldp+72,(vlTOPp->streamdataout_aclk));
        tracep->chgBit(oldp+73,(vlTOPp->streamdataout_aresetn));
        tracep->chgBit(oldp+74,(vlTOPp->streamdataout_tvalid));
        tracep->chgIData(oldp+75,(vlTOPp->streamdataout_tdata),32);
        tracep->chgCData(oldp+76,(vlTOPp->streamdataout_tstrb),4);
        tracep->chgBit(oldp+77,(vlTOPp->streamdataout_tlast));
        tracep->chgBit(oldp+78,(vlTOPp->streamdataout_tready));
        tracep->chgCData(oldp+79,(vlTOPp->SimpleAXIAsyncFIFO__DOT__FIFOStart),5);
        tracep->chgBit(oldp+80,(vlTOPp->SimpleAXIAsyncFIFO__DOT__unnamedblk1__DOT__twoMoreSlots));
    }
}

void VSimpleAXIAsyncFIFO::traceCleanup(void* userp, VerilatedVcd* /*unused*/) {
    VSimpleAXIAsyncFIFO__Syms* __restrict vlSymsp = static_cast<VSimpleAXIAsyncFIFO__Syms*>(userp);
    VSimpleAXIAsyncFIFO* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    {
        vlSymsp->__Vm_activity = false;
        vlTOPp->__Vm_traceActivity[0U] = 0U;
        vlTOPp->__Vm_traceActivity[1U] = 0U;
    }
}
