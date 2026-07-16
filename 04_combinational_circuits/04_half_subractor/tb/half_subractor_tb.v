//==============================================================================
// Module Name : half_subtractor_tb
// Description :
// -----------------------------------------------------------------------------
// Automated verification testbench for the Half Subtractor.
//
// This testbench performs exhaustive functional verification by automatically
// applying every possible input combination to the Design Under Test (DUT).
//
// Since the Half Subtractor has two input signals:
//
//      • A (Minuend)
//      • B (Subtrahend)
//
// the total number of possible input combinations is:
//
//      Total Test Cases = 2² = 4
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
//      Repeat for all 4 combinations
//
// Vector Concatenation:
//
//      {A, B} = i;
//
// where
//
//      A → Bit [1]
//      B → Bit [0]
//
// This technique provides a simple and scalable method for exhaustive
// functional verification while avoiding repetitive input assignments.
//
// Simulation Features:
//
//      • Automated input generation
//      • Exhaustive verification (4 test cases)
//      • VCD waveform generation
//      • GTKWave compatible output
//      • Simulation progress messages
//
// This testbench focuses on verifying the functionality of the Half
// Subtractor through simulation and waveform analysis.
//
// New Concepts Reinforced:
//
//      • Automated Testbench Development
//      • Integer Variables
//      • for Loop
//      • Vector Concatenation
//      • VCD Dump Generation
//      • Functional Verification
//
// Applications:
//
//      • RTL Functional Verification
//      • Simulation Automation
//      • FPGA Verification
//      • ASIC Verification
//
// Author      : Padma Charan S S
// Repository  : Verilog Fundamentals
// Project     : 04 - Half Subtractor
//==============================================================================

`timescale 1ns/1ps

module half_sub_tb;

reg a;
reg b;

wire d;
wire bo;

half_sub dut(
    .a(a),
    .b(b),

    .d(d),
    .bo(bo)
);

integer i;
localparam total_test_case = 4 ;
localparam delay =10 ;
initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0,half_sub_tb);

    $display("========== Half Subractor Automated Test Started ==========");

    for (i =0;i<total_test_case;i=i+1) begin
        
        {a,b}=i;

        #delay;
    end

    $display("========== Test Completed Successfully ==========");

    $finish;

end

initial begin
    
    $monitor("Time=%0t A=%b B=%b Difference=%d Borrow=%b ",$time,a,b,d,bo);
end

endmodule