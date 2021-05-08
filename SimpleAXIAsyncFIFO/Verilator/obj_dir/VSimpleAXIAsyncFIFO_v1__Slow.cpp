// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VSimpleAXIAsyncFIFO_v1.h for the primary calling header

#include "VSimpleAXIAsyncFIFO_v1.h"
#include "VSimpleAXIAsyncFIFO_v1__Syms.h"

//==========

VSimpleAXIAsyncFIFO_v1::VSimpleAXIAsyncFIFO_v1(VerilatedContext* _vcontextp__, const char* _vcname__)
    : VerilatedModule{_vcname__}
 {
    VSimpleAXIAsyncFIFO_v1__Syms* __restrict vlSymsp = __VlSymsp = new VSimpleAXIAsyncFIFO_v1__Syms(_vcontextp__, this, name());
    VSimpleAXIAsyncFIFO_v1* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Reset internal values
    
    // Reset structure values
    _ctor_var_reset();
}

void VSimpleAXIAsyncFIFO_v1::__Vconfigure(VSimpleAXIAsyncFIFO_v1__Syms* vlSymsp, bool first) {
    if (false && first) {}  // Prevent unused
    this->__VlSymsp = vlSymsp;
    if (false && this->__VlSymsp) {}  // Prevent unused
    vlSymsp->_vm_contextp__->timeunit(-9);
    vlSymsp->_vm_contextp__->timeprecision(-12);
}

VSimpleAXIAsyncFIFO_v1::~VSimpleAXIAsyncFIFO_v1() {
    VL_DO_CLEAR(delete __VlSymsp, __VlSymsp = nullptr);
}

void VSimpleAXIAsyncFIFO_v1::_eval_initial(VSimpleAXIAsyncFIFO_v1__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VSimpleAXIAsyncFIFO_v1::_eval_initial\n"); );
    VSimpleAXIAsyncFIFO_v1* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vclklast__TOP__streamdataout_aclk = vlTOPp->streamdataout_aclk;
    vlTOPp->__Vclklast__TOP__streamdatain_aclk = vlTOPp->streamdatain_aclk;
}

void VSimpleAXIAsyncFIFO_v1::final() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VSimpleAXIAsyncFIFO_v1::final\n"); );
    // Variables
    VSimpleAXIAsyncFIFO_v1__Syms* __restrict vlSymsp = this->__VlSymsp;
    VSimpleAXIAsyncFIFO_v1* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
}

void VSimpleAXIAsyncFIFO_v1::_eval_settle(VSimpleAXIAsyncFIFO_v1__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VSimpleAXIAsyncFIFO_v1::_eval_settle\n"); );
    VSimpleAXIAsyncFIFO_v1* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
}

void VSimpleAXIAsyncFIFO_v1::_ctor_var_reset() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VSimpleAXIAsyncFIFO_v1::_ctor_var_reset\n"); );
    // Body
    streamdatain_aclk = VL_RAND_RESET_I(1);
    streamdatain_aresetn = VL_RAND_RESET_I(1);
    streamdatain_tready = VL_RAND_RESET_I(1);
    streamdatain_tdata = VL_RAND_RESET_I(32);
    streamdatain_tstrb = VL_RAND_RESET_I(4);
    streamdatain_tlast = VL_RAND_RESET_I(1);
    streamdatain_tvalid = VL_RAND_RESET_I(1);
    streamdataout_aclk = VL_RAND_RESET_I(1);
    streamdataout_aresetn = VL_RAND_RESET_I(1);
    streamdataout_tvalid = VL_RAND_RESET_I(1);
    streamdataout_tdata = VL_RAND_RESET_I(32);
    streamdataout_tstrb = VL_RAND_RESET_I(4);
    streamdataout_tlast = VL_RAND_RESET_I(1);
    streamdataout_tready = VL_RAND_RESET_I(1);
    for (int __Vi0=0; __Vi0<32; ++__Vi0) {
        SimpleAXIAsyncFIFO__DOT__FrameBuffer[__Vi0] = VL_RAND_RESET_Q(33);
    }
    SimpleAXIAsyncFIFO__DOT__FIFOStart = VL_RAND_RESET_I(5);
    SimpleAXIAsyncFIFO__DOT__FIFOEnd = VL_RAND_RESET_I(5);
    SimpleAXIAsyncFIFO__DOT__unnamedblk1__DOT__twoMoreSlots = VL_RAND_RESET_I(1);
    __Vdlyvdim0__SimpleAXIAsyncFIFO__DOT__FrameBuffer__v0 = 0;
    __Vdlyvval__SimpleAXIAsyncFIFO__DOT__FrameBuffer__v0 = VL_RAND_RESET_Q(33);
    __Vdlyvset__SimpleAXIAsyncFIFO__DOT__FrameBuffer__v0 = 0;
    __Vdly__SimpleAXIAsyncFIFO__DOT__FIFOEnd = VL_RAND_RESET_I(5);
    __Vdly__SimpleAXIAsyncFIFO__DOT__FIFOStart = VL_RAND_RESET_I(5);
    for (int __Vi0=0; __Vi0<2; ++__Vi0) {
        __Vm_traceActivity[__Vi0] = VL_RAND_RESET_I(1);
    }
}
