// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Primary design header
//
// This header should be included by all source files instantiating the design.
// The class here is then constructed to instantiate the design.
// See the Verilator manual for examples.

#ifndef VERILATED_VSIMPLEAXIASYNCFIFO_H_
#define VERILATED_VSIMPLEAXIASYNCFIFO_H_  // guard

#include "verilated_heavy.h"

//==========

class VSimpleAXIAsyncFIFO__Syms;
class VSimpleAXIAsyncFIFO_VerilatedVcd;


//----------

VL_MODULE(VSimpleAXIAsyncFIFO) {
  public:
    
    // PORTS
    // The application code writes and reads these signals to
    // propagate new values into/out from the Verilated model.
    VL_IN8(streamdatain_aclk,0,0);
    VL_IN8(streamdataout_aclk,0,0);
    VL_IN8(streamdatain_aresetn,0,0);
    VL_OUT8(streamdatain_tready,0,0);
    VL_IN8(streamdatain_tstrb,3,0);
    VL_IN8(streamdatain_tlast,0,0);
    VL_IN8(streamdatain_tvalid,0,0);
    VL_IN8(streamdataout_aresetn,0,0);
    VL_OUT8(streamdataout_tvalid,0,0);
    VL_OUT8(streamdataout_tstrb,3,0);
    VL_OUT8(streamdataout_tlast,0,0);
    VL_IN8(streamdataout_tready,0,0);
    VL_IN(streamdatain_tdata,31,0);
    VL_OUT(streamdataout_tdata,31,0);
    
    // LOCAL SIGNALS
    // Internals; generally not touched by application code
    CData/*4:0*/ SimpleAXIAsyncFIFO__DOT__FIFOStart;
    CData/*4:0*/ SimpleAXIAsyncFIFO__DOT__FIFOEnd;
    CData/*0:0*/ SimpleAXIAsyncFIFO__DOT__unnamedblk1__DOT__twoMoreSlots;
    QData/*32:0*/ SimpleAXIAsyncFIFO__DOT__FrameBuffer[32];
    
    // LOCAL VARIABLES
    // Internals; generally not touched by application code
    CData/*4:0*/ __Vdlyvdim0__SimpleAXIAsyncFIFO__DOT__FrameBuffer__v0;
    CData/*0:0*/ __Vdlyvset__SimpleAXIAsyncFIFO__DOT__FrameBuffer__v0;
    CData/*4:0*/ __Vdly__SimpleAXIAsyncFIFO__DOT__FIFOEnd;
    CData/*4:0*/ __Vdly__SimpleAXIAsyncFIFO__DOT__FIFOStart;
    CData/*0:0*/ __Vclklast__TOP__streamdataout_aclk;
    CData/*0:0*/ __Vclklast__TOP__streamdatain_aclk;
    QData/*32:0*/ __Vdlyvval__SimpleAXIAsyncFIFO__DOT__FrameBuffer__v0;
    CData/*0:0*/ __Vm_traceActivity[2];
    
    // INTERNAL VARIABLES
    // Internals; generally not touched by application code
    VSimpleAXIAsyncFIFO__Syms* __VlSymsp;  // Symbol table
    
    // CONSTRUCTORS
  private:
    VL_UNCOPYABLE(VSimpleAXIAsyncFIFO);  ///< Copying not allowed
  public:
    /// Construct the model; called by application code
    /// If contextp is null, then the model will use the default global context
    /// If name is "", then makes a wrapper with a
    /// single model invisible with respect to DPI scope names.
    VSimpleAXIAsyncFIFO(VerilatedContext* contextp, const char* name = "TOP");
    VSimpleAXIAsyncFIFO(const char* name = "TOP")
      : VSimpleAXIAsyncFIFO(nullptr, name) {}
    /// Destroy the model; called (often implicitly) by application code
    ~VSimpleAXIAsyncFIFO();
    /// Trace signals in the model; called by application code
    void trace(VerilatedVcdC* tfp, int levels, int options = 0);
    
    // API METHODS
    /// Return current simulation context for this model.
    /// Used to get to e.g. simulation time via contextp()->time()
    VerilatedContext* contextp();
    /// Evaluate the model.  Application must call when inputs change.
    void eval() { eval_step(); }
    /// Evaluate when calling multiple units/models per time step.
    void eval_step();
    /// Evaluate at end of a timestep for tracing, when using eval_step().
    /// Application must call after all eval() and before time changes.
    void eval_end_step() {}
    /// Simulation complete, run final blocks.  Application must call on completion.
    void final();
    
    // INTERNAL METHODS
    static void _eval_initial_loop(VSimpleAXIAsyncFIFO__Syms* __restrict vlSymsp);
    void __Vconfigure(VSimpleAXIAsyncFIFO__Syms* symsp, bool first);
  private:
    static QData _change_request(VSimpleAXIAsyncFIFO__Syms* __restrict vlSymsp);
    static QData _change_request_1(VSimpleAXIAsyncFIFO__Syms* __restrict vlSymsp);
    void _ctor_var_reset() VL_ATTR_COLD;
  public:
    static void _eval(VSimpleAXIAsyncFIFO__Syms* __restrict vlSymsp);
  private:
#ifdef VL_DEBUG
    void _eval_debug_assertions();
#endif  // VL_DEBUG
  public:
    static void _eval_initial(VSimpleAXIAsyncFIFO__Syms* __restrict vlSymsp) VL_ATTR_COLD;
    static void _eval_settle(VSimpleAXIAsyncFIFO__Syms* __restrict vlSymsp) VL_ATTR_COLD;
    static void _sequent__TOP__1(VSimpleAXIAsyncFIFO__Syms* __restrict vlSymsp);
    static void _sequent__TOP__2(VSimpleAXIAsyncFIFO__Syms* __restrict vlSymsp);
    static void _sequent__TOP__3(VSimpleAXIAsyncFIFO__Syms* __restrict vlSymsp);
    static void _sequent__TOP__4(VSimpleAXIAsyncFIFO__Syms* __restrict vlSymsp);
  private:
    static void traceChgSub0(void* userp, VerilatedVcd* tracep);
    static void traceChgTop0(void* userp, VerilatedVcd* tracep);
    static void traceCleanup(void* userp, VerilatedVcd* /*unused*/);
    static void traceFullSub0(void* userp, VerilatedVcd* tracep) VL_ATTR_COLD;
    static void traceFullTop0(void* userp, VerilatedVcd* tracep) VL_ATTR_COLD;
    static void traceInitSub0(void* userp, VerilatedVcd* tracep) VL_ATTR_COLD;
    static void traceInitTop(void* userp, VerilatedVcd* tracep) VL_ATTR_COLD;
    void traceRegister(VerilatedVcd* tracep) VL_ATTR_COLD;
    static void traceInit(void* userp, VerilatedVcd* tracep, uint32_t code) VL_ATTR_COLD;
} VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);

//----------


#endif  // guard
