//==============================================================================
// Module Name : half_subtractor_self_checking_tb
// Description :
// -----------------------------------------------------------------------------
// Self-checking verification testbench for the Half Subtractor.
//
// Unlike a conventional testbench that requires manual observation of output
// waveforms, this testbench automatically verifies the functionality of the
// Design Under Test (DUT) by comparing its outputs with internally generated
// expected results.
//
// The testbench exhaustively applies every possible input combination using
// a for loop and vector concatenation.
//
// Inputs:
//
//      • A (Minuend)
//      • B (Subtrahend)
//
// Total Test Cases:
//
//      2² = 4
//
// Verification Flow:
//
//      Generate Inputs
//             │
//             ▼
//      Apply Inputs to DUT
//             │
//             ▼
//      Wait for DUT Output
//             │
//             ▼
//      Calculate Expected Result
//             │
//             ▼
//      Compare
//             │
//      ┌──────┴──────┐
//      │             │
//     PASS         FAIL
//                    │
//                    ▼
//          Print Debug Information
//
// The expected outputs are calculated using the Half Subtractor Boolean
// equations:
//
//      Expected Difference = A ^ B
//
//      Expected Borrow     = ~A & B
//
// The expected outputs are compared with the DUT outputs:
//
//      {Expected Borrow, Expected Difference}
//
//                ==
//
//      {Borrow, Difference}
//
// If both values match, the test case passes.
//
// If a mismatch occurs, the testbench reports:
//
//      • Test Case Number
//      • Input Values
//      • Expected Difference
//      • Expected Borrow
//      • DUT Difference
//      • DUT Borrow
//
// allowing rapid debugging of design errors.
//
// At the end of simulation, a verification summary is displayed indicating
// whether all test cases passed successfully or how many test cases failed.
//
// Simulation Features:
//
//      • Exhaustive Verification
//      • Automatic Expected Result Generation
//      • PASS / FAIL Reporting
//      • Failure Counter
//      • Verification Summary
//      • VCD Waveform Generation
//
// Although this project contains only four possible test cases, the same
// verification methodology scales to much larger digital systems such as
// adders, subtractors, ALUs, finite state machines, and processors.
//
// New Concepts Reinforced:
//
//      • Self-Checking Testbench
//      • Automatic Verification
//      • Expected Result Generation
//      • Conditional Statements (if-else)
//      • PASS / FAIL Reporting
//      • Verification Summary
//      • Debug Information Printing
//
// Applications:
//
//      • RTL Functional Verification
//      • FPGA Verification
//      • ASIC Verification
//      • Automated Regression Testing
//      • Digital Design Validation
//
// Author      : Padma Charan S S
// Repository  : Verilog Fundamentals
// Project     : 04 - Half Subtractor
//==============================================================================

`timescale 1ns/1ps

module half_sub_tb;

reg a;
reg b;
reg [1:0]expected;


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
integer f_count;

initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0,half_sub_tb);

    $display("========== Half Subractor Automated Test Started ==========");
    f_count=0;


    for (i =0;i<total_test_case;i=i+1) begin
        
        {a,b}=i;

        #delay;

    
        
        expected= a - b;
        if (expected=={bo,d}) begin
            //tests passed     
        end

        else
        begin
            
            $display("--------------------------------------");
            $display("FAIL : Test Case %0d", i);
            $display("A         = %b", a);
            $display("B         = %b", b);
            $display("Expected  = %b", expected);
            $display("Received  = %b", {bo,d});
            $display("--------------------------------------");

    f_count=f_count + 1;

        end
    end
    


    if (f_count == 0)
    $display("RESULT : ALL TEST CASES PASSED");
else
    $display("RESULT : %0d TEST CASE(S) FAILED", f_count);

$display("======================================");
$display("========== Half subractor Automated Test finished ==========");
$finish;

end
endmodule

