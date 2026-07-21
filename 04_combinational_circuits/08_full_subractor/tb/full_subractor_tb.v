//==============================================================================
// Module Name : full_sub_tb
// Description :
// -----------------------------------------------------------------------------
// Automated verification testbench for the Full Subtractor.
//
// This testbench performs exhaustive functional verification by automatically
// applying every possible input combination to the Design Under Test (DUT).
//
// Since the Full Subtractor has three input signals:
//
//      • A      (Minuend)
//      • B      (Subtrahend)
//      • B_in   (Borrow-In)
//
// the total number of possible input combinations is:
//
//      Total Test Cases = 2³ = 8
//
// Instead of manually assigning each test case, a for loop together with
// vector concatenation is used to generate every possible input combination.
//
// Test Methodology:
//
//      Generate Inputs
//             │
//             ▼
//      Apply to DUT
//             │
//             ▼
//      Observe Outputs
//             │
//             ▼
//      Repeat for all 8 combinations
//
// Vector Concatenation:
//
//      {A, B, B_in} = i;
//
// where
//
//      A      → Bit [2]
//      B      → Bit [1]
//      B_in   → Bit [0]
//
// This technique provides a simple, scalable, and efficient method for
// exhaustive functional verification while eliminating repetitive manual
// input assignments.
//
// Simulation Features:
//
//      • Automated input generation
//      • Exhaustive verification (8 test cases)
//      • VCD waveform generation
//      • GTKWave compatible output
//      • Simulation progress messages
//      • Configurable simulation delay using localparam
//
// This testbench focuses on validating the functional behavior of the Full
// Subtractor through simulation and waveform analysis before implementing
// self-checking verification.
//
// New Concepts Reinforced:
//
//      • Automated Testbench Development
//      • Integer Variables
//      • for Loop
//      • Vector Concatenation
//      • localparam
//      • VCD Dump Generation
//      • Functional Verification
//
// Applications:
//
//      • RTL Functional Verification
//      • Simulation Automation
//      • FPGA Verification
//      • ASIC Verification
//      • Digital Design Validation
//
// Author      : Padma Charan S S
// Repository  : Verilog Fundamentals
// Project     : 05 - Full Subtractor
//==============================================================================


`timescale 1ns/1ps

module full_sub_tb;

reg a;
reg b;
reg b_in;

wire d;
wire b_out;

full_sub dut(
    .a(a),
    .b(b),
    .b_in(b_in),

    .d(d),
    .b_out(b_out)
);

integer i;
localparam total_test_case = 8 ;
localparam delay =10 ;
initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0,full_sub_tb);

    $display("========== Full Subractor Automated Test Started ==========");

    for (i =0;i<total_test_case;i=i+1) begin
        
        {a,b,b_in}=i;

        #delay;
    end

    $display("========== Test Completed Successfully ==========");

    $finish;

end

initial begin
    
    $monitor("Time=%0t A=%b B=%b Borrow_in=%b Difference=%b Borrow_out=%b ",$time,a,b,b_in,d,b_out);
end

endmodule