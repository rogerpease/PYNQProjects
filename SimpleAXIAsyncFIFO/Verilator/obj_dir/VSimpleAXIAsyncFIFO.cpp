// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VSimpleAXIAsyncFIFO.h for the primary calling header

#include "VSimpleAXIAsyncFIFO.h"
#include "VSimpleAXIAsyncFIFO__Syms.h"

//==========

VerilatedContext* VSimpleAXIAsyncFIFO::contextp() {
    return __VlSymsp->_vm_contextp__;
}

void VSimpleAXIAsyncFIFO::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate VSimpleAXIAsyncFIFO::eval\n"); );
    VSimpleAXIAsyncFIFO__Syms* __restrict vlSymsp = this->__VlSymsp;  // Setup global symbol table
    VSimpleAXIAsyncFIFO* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
#ifdef VL_DEBUG
    // Debug assertions
    _eval_debug_assertions();
#endif  // VL_DEBUG
    // Initialize
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) _eval_initial_loop(vlSymsp);
    // Evaluate till stable
    int __VclockLoop = 0;
    QData __Vchange = 1;
    do {
        VL_DEBUG_IF(VL_DBG_MSGF("+ Clock loop\n"););
        vlSymsp->__Vm_activity = true;
        _eval(vlSymsp);
        if (VL_UNLIKELY(++__VclockLoop > 100)) {
            // About to fail, so enable debug to see what's not settling.
            // Note you must run make with OPT=-DVL_DEBUG for debug prints.
            int __Vsaved_debug = Verilated::debug();
            Verilated::debug(1);
            __Vchange = _change_request(vlSymsp);
            Verilated::debug(__Vsaved_debug);
            VL_FATAL_MT("../Verilog/module/SimpleAXIAsyncFIFO.sv", 4, "",
                "Verilated model didn't converge\n"
                "- See DIDNOTCONVERGE in the Verilator manual");
        } else {
            __Vchange = _change_request(vlSymsp);
        }
    } while (VL_UNLIKELY(__Vchange));
}

void VSimpleAXIAsyncFIFO::_eval_initial_loop(VSimpleAXIAsyncFIFO__Syms* __restrict vlSymsp) {
    vlSymsp->__Vm_didInit = true;
    _eval_initial(vlSymsp);
    vlSymsp->__Vm_activity = true;
    // Evaluate till stable
    int __VclockLoop = 0;
    QData __Vchange = 1;
    do {
        _eval_settle(vlSymsp);
        _eval(vlSymsp);
        if (VL_UNLIKELY(++__VclockLoop > 100)) {
            // About to fail, so enable debug to see what's not settling.
            // Note you must run make with OPT=-DVL_DEBUG for debug prints.
            int __Vsaved_debug = Verilated::debug();
            Verilated::debug(1);
            __Vchange = _change_request(vlSymsp);
            Verilated::debug(__Vsaved_debug);
            VL_FATAL_MT("../Verilog/module/SimpleAXIAsyncFIFO.sv", 4, "",
                "Verilated model didn't DC converge\n"
                "- See DIDNOTCONVERGE in the Verilator manual");
        } else {
            __Vchange = _change_request(vlSymsp);
        }
    } while (VL_UNLIKELY(__Vchange));
}

VL_INLINE_OPT void VSimpleAXIAsyncFIFO::_sequent__TOP__1(VSimpleAXIAsyncFIFO__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VSimpleAXIAsyncFIFO::_sequent__TOP__1\n"); );
    VSimpleAXIAsyncFIFO* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vdly__SimpleAXIAsyncFIFO__DOT__FIFOStart 
        = vlTOPp->SimpleAXIAsyncFIFO__DOT__FIFOStart;
    if ((1U & (~ (IData)(vlTOPp->streamdataout_aresetn)))) {
        vlTOPp->streamdataout_tstrb = 1U;
    }
    vlTOPp->streamdataout_tstrb = 0xfU;
}

VL_INLINE_OPT void VSimpleAXIAsyncFIFO::_sequent__TOP__2(VSimpleAXIAsyncFIFO__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VSimpleAXIAsyncFIFO::_sequent__TOP__2\n"); );
    VSimpleAXIAsyncFIFO* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vdly__SimpleAXIAsyncFIFO__DOT__FIFOEnd 
        = vlTOPp->SimpleAXIAsyncFIFO__DOT__FIFOEnd;
    vlTOPp->__Vdlyvset__SimpleAXIAsyncFIFO__DOT__FrameBuffer__v0 = 0U;
    if (VL_LIKELY(vlTOPp->streamdatain_aresetn)) {
        vlTOPp->SimpleAXIAsyncFIFO__DOT__unnamedblk1__DOT__twoMoreSlots 
            = ((((IData)(2U) + (IData)(vlTOPp->SimpleAXIAsyncFIFO__DOT__FIFOEnd)) 
                == (IData)(vlTOPp->SimpleAXIAsyncFIFO__DOT__FIFOStart)) 
               | (((IData)(1U) + (IData)(vlTOPp->SimpleAXIAsyncFIFO__DOT__FIFOEnd)) 
                  == (IData)(vlTOPp->SimpleAXIAsyncFIFO__DOT__FIFOStart)));
        if (VL_UNLIKELY(((IData)(vlTOPp->streamdatain_tvalid) 
                         & (IData)(vlTOPp->streamdatain_tready)))) {
            vlTOPp->__Vdlyvval__SimpleAXIAsyncFIFO__DOT__FrameBuffer__v0 
                = (((QData)((IData)(vlTOPp->streamdataout_tlast)) 
                    << 0x20U) | (QData)((IData)(vlTOPp->streamdatain_tdata)));
            vlTOPp->__Vdlyvset__SimpleAXIAsyncFIFO__DOT__FrameBuffer__v0 = 1U;
            vlTOPp->__Vdlyvdim0__SimpleAXIAsyncFIFO__DOT__FrameBuffer__v0 
                = vlTOPp->SimpleAXIAsyncFIFO__DOT__FIFOEnd;
            vlTOPp->__Vdly__SimpleAXIAsyncFIFO__DOT__FIFOEnd 
                = (0x1fU & ((IData)(1U) + (IData)(vlTOPp->SimpleAXIAsyncFIFO__DOT__FIFOEnd)));
            VL_WRITEF("Took in Data %10# %2#\n",32,
                      vlTOPp->streamdatain_tdata,5,
                      (IData)(vlTOPp->SimpleAXIAsyncFIFO__DOT__FIFOEnd));
        }
        if (vlTOPp->SimpleAXIAsyncFIFO__DOT__unnamedblk1__DOT__twoMoreSlots) {
            VL_WRITEF("Data In Ready = 0\n");
            vlTOPp->streamdatain_tready = 0U;
        } else {
            VL_WRITEF("Data In Ready = 1\n");
            vlTOPp->streamdatain_tready = 1U;
        }
    } else {
        VL_WRITEF("Reset\n");
        vlTOPp->__Vdly__SimpleAXIAsyncFIFO__DOT__FIFOEnd = 0U;
        vlTOPp->streamdatain_tready = 0U;
    }
}

VL_INLINE_OPT void VSimpleAXIAsyncFIFO::_sequent__TOP__3(VSimpleAXIAsyncFIFO__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VSimpleAXIAsyncFIFO::_sequent__TOP__3\n"); );
    VSimpleAXIAsyncFIFO* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    if (vlTOPp->streamdataout_aresetn) {
        vlTOPp->streamdataout_tdata = (IData)(vlTOPp->SimpleAXIAsyncFIFO__DOT__FrameBuffer
                                              [vlTOPp->SimpleAXIAsyncFIFO__DOT__FIFOStart]);
        vlTOPp->streamdataout_tlast = (1U & (IData)(
                                                    (vlTOPp->SimpleAXIAsyncFIFO__DOT__FrameBuffer
                                                     [vlTOPp->SimpleAXIAsyncFIFO__DOT__FIFOStart] 
                                                     >> 0x20U)));
        vlTOPp->__Vdly__SimpleAXIAsyncFIFO__DOT__FIFOStart 
            = (0x1fU & (((IData)(vlTOPp->streamdataout_tready) 
                         & ((IData)(vlTOPp->SimpleAXIAsyncFIFO__DOT__FIFOStart) 
                            != (IData)(vlTOPp->SimpleAXIAsyncFIFO__DOT__FIFOEnd)))
                         ? ((IData)(1U) + (IData)(vlTOPp->SimpleAXIAsyncFIFO__DOT__FIFOStart))
                         : (IData)(vlTOPp->SimpleAXIAsyncFIFO__DOT__FIFOStart)));
        vlTOPp->streamdataout_tvalid = ((IData)(vlTOPp->SimpleAXIAsyncFIFO__DOT__FIFOStart) 
                                        != (IData)(vlTOPp->SimpleAXIAsyncFIFO__DOT__FIFOEnd));
    } else {
        vlTOPp->__Vdly__SimpleAXIAsyncFIFO__DOT__FIFOStart = 0U;
        vlTOPp->streamdataout_tlast = 0U;
        vlTOPp->streamdataout_tvalid = 0U;
    }
    vlTOPp->SimpleAXIAsyncFIFO__DOT__FIFOStart = vlTOPp->__Vdly__SimpleAXIAsyncFIFO__DOT__FIFOStart;
}

VL_INLINE_OPT void VSimpleAXIAsyncFIFO::_sequent__TOP__4(VSimpleAXIAsyncFIFO__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VSimpleAXIAsyncFIFO::_sequent__TOP__4\n"); );
    VSimpleAXIAsyncFIFO* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->SimpleAXIAsyncFIFO__DOT__FIFOEnd = vlTOPp->__Vdly__SimpleAXIAsyncFIFO__DOT__FIFOEnd;
    if (vlTOPp->__Vdlyvset__SimpleAXIAsyncFIFO__DOT__FrameBuffer__v0) {
        vlTOPp->SimpleAXIAsyncFIFO__DOT__FrameBuffer[vlTOPp->__Vdlyvdim0__SimpleAXIAsyncFIFO__DOT__FrameBuffer__v0] 
            = vlTOPp->__Vdlyvval__SimpleAXIAsyncFIFO__DOT__FrameBuffer__v0;
    }
}

void VSimpleAXIAsyncFIFO::_eval(VSimpleAXIAsyncFIFO__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VSimpleAXIAsyncFIFO::_eval\n"); );
    VSimpleAXIAsyncFIFO* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    if (((IData)(vlTOPp->streamdataout_aclk) & (~ (IData)(vlTOPp->__Vclklast__TOP__streamdataout_aclk)))) {
        vlTOPp->_sequent__TOP__1(vlSymsp);
    }
    if (((IData)(vlTOPp->streamdatain_aclk) & (~ (IData)(vlTOPp->__Vclklast__TOP__streamdatain_aclk)))) {
        vlTOPp->_sequent__TOP__2(vlSymsp);
    }
    if (((IData)(vlTOPp->streamdataout_aclk) & (~ (IData)(vlTOPp->__Vclklast__TOP__streamdataout_aclk)))) {
        vlTOPp->_sequent__TOP__3(vlSymsp);
    }
    if (((IData)(vlTOPp->streamdatain_aclk) & (~ (IData)(vlTOPp->__Vclklast__TOP__streamdatain_aclk)))) {
        vlTOPp->_sequent__TOP__4(vlSymsp);
        vlTOPp->__Vm_traceActivity[1U] = 1U;
    }
    // Final
    vlTOPp->__Vclklast__TOP__streamdataout_aclk = vlTOPp->streamdataout_aclk;
    vlTOPp->__Vclklast__TOP__streamdatain_aclk = vlTOPp->streamdatain_aclk;
}

VL_INLINE_OPT QData VSimpleAXIAsyncFIFO::_change_request(VSimpleAXIAsyncFIFO__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VSimpleAXIAsyncFIFO::_change_request\n"); );
    VSimpleAXIAsyncFIFO* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    return (vlTOPp->_change_request_1(vlSymsp));
}

VL_INLINE_OPT QData VSimpleAXIAsyncFIFO::_change_request_1(VSimpleAXIAsyncFIFO__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VSimpleAXIAsyncFIFO::_change_request_1\n"); );
    VSimpleAXIAsyncFIFO* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // Change detection
    QData __req = false;  // Logically a bool
    return __req;
}

#ifdef VL_DEBUG
void VSimpleAXIAsyncFIFO::_eval_debug_assertions() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VSimpleAXIAsyncFIFO::_eval_debug_assertions\n"); );
    // Body
    if (VL_UNLIKELY((streamdatain_aclk & 0xfeU))) {
        Verilated::overWidthError("streamdatain_aclk");}
    if (VL_UNLIKELY((streamdatain_aresetn & 0xfeU))) {
        Verilated::overWidthError("streamdatain_aresetn");}
    if (VL_UNLIKELY((streamdatain_tstrb & 0xf0U))) {
        Verilated::overWidthError("streamdatain_tstrb");}
    if (VL_UNLIKELY((streamdatain_tlast & 0xfeU))) {
        Verilated::overWidthError("streamdatain_tlast");}
    if (VL_UNLIKELY((streamdatain_tvalid & 0xfeU))) {
        Verilated::overWidthError("streamdatain_tvalid");}
    if (VL_UNLIKELY((streamdataout_aclk & 0xfeU))) {
        Verilated::overWidthError("streamdataout_aclk");}
    if (VL_UNLIKELY((streamdataout_aresetn & 0xfeU))) {
        Verilated::overWidthError("streamdataout_aresetn");}
    if (VL_UNLIKELY((streamdataout_tready & 0xfeU))) {
        Verilated::overWidthError("streamdataout_tready");}
}
#endif  // VL_DEBUG
