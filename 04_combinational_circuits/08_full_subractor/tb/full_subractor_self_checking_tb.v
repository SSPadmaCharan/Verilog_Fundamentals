//==============================================================================
// Module Name : full_sub_self_checking_tb
// Description :
// -----------------------------------------------------------------------------
// Self-checking verification testbench for the Full Subtractor.
//
// This testbench performs exhaustive functional verification by automatically
// applying every possible input combination to the Design Under Test (DUT)
// and comparing the DUT outputs against the expected outputs calculated using
// the Boolean equations of the Full Subtractor.
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
// Instead of manually assigning each input combination, a for loop together
// with vector concatenation is used to generate all possible test cases.
//
// Test Methodology:
//
//      Generate Inputs
//             │
//             ▼
//      Apply to DUT
//             │
//             ▼
//      Calculate Expected Outputs
//             │
//             ▼
//      Compare Expected vs Actual
//             │
//             ▼
//      Report PASS / FAIL
//             │
//             ▼
//      Repeat for all 8 combinations
//
// Expected outputs are calculated using the Boolean equations:
//
//      Difference = A ^ B ^ B_in
//
//      Borrow-Out = (~A & B)
//                 | (~A & B_in)
//                 | (B & B_in)
//
// The expected outputs are then compared with the DUT outputs.
//
//      Expected  → {expected_b, expected_d}
//
//      DUT       → {b_out, d}
//
// If a mismatch is detected, the testbench reports:
//
//      • Test Case Number
//      • Applied Inputs
//      • Expected Outputs
//      • Actual Outputs
//
// At the end of the simulation, a final summary reports whether all test
// cases passed or the number of failed test cases.
//
// This verification methodology removes the need for manual waveform
// inspection and provides immediate feedback on the correctness of the
// hardware implementation.
//
// New Concepts Introduced:
//
//      • Self-Checking Testbench
//      • Expected Output Calculation
//      • Boolean Verification
//      • PASS / FAIL Reporting
//      • Error Counter
//      • Verification Automation
//      • Exhaustive Functional Verification
//
// Applications:
//
//      • RTL Functional Verification
//      • FPGA Verification
//      • ASIC Verification
//      • Digital Design Validation
//      • Automated Regression Testing
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
reg [0:0]expected_d;
reg [0:0]expected_b;


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
integer f_count;

initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0,full_sub_tb);

    $display("========== Full Subractor Automated Test Started ==========");
    f_count=0;


    for (i =0;i<total_test_case;i=i+1) begin
        
        {a,b,b_in}=i;

        #delay;

    
        expected_d = a ^ b ^ b_in;
        expected_b = (~a & b) | (~a & b_in) | (b & b_in);
        
        if ({expected_b,expected_d}=={b_out,d}) begin
            //tests passed    
            $display("PASS : Test Case %0d", i); 
        end

        else
        begin
            
            $display("--------------------------------------");
            $display("FAIL : Test Case %0d", i);
            $display("A         = %b", a);
            $display("B         = %b", b);
            $display("b_in      = %b" ,b_in);
            $display("Expected  = %b", {expected_b,expected_d});
            $display("Received  = %b", {b_out,d});
            $display("--------------------------------------");

    f_count=f_count + 1;

        end
    end

    if (f_count == 0)
    $display("RESULT : ALL TEST CASES PASSED");
else
    $display("RESULT : %0d TEST CASE(S) FAILED", f_count);

$display("======================================");
$display("========== Full subractor Automated Test finished ==========");
$finish;

end
endmodule

