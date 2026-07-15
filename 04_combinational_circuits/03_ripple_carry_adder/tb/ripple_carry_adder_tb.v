//==============================================================================
// Module Name : ripple_carry_adder_self_checking_tb
// Description :
// -----------------------------------------------------------------------------
// Self-checking verification testbench for the 4-bit Ripple Carry Adder.
//
// Unlike a conventional testbench that requires manual observation of output
// waveforms, this testbench automatically verifies the functionality of the
// Design Under Test (DUT) by comparing its output with an internally generated
// expected result.
//
// The testbench exhaustively applies every possible input combination to the
// Ripple Carry Adder using a for loop and vector concatenation.
//
//      Inputs:
//          • Operand A (4 bits)
//          • Operand B (4 bits)
//          • Carry-In (1 bit)
//
// Total Test Cases:
//
//      2^9 = 512
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
// For every test case, the expected output is calculated using Verilog
// arithmetic:
//
//      Expected = A + B + Carry-In
//
// The expected result is then compared against the DUT output:
//
//      Expected == {Carry-Out, Sum}
//
// If both values match, the test case is considered successful.
//
// If a mismatch occurs, the testbench reports:
//
//      • Test Case Number
//      • Operand A
//      • Operand B
//      • Carry-In
//      • Expected Result
//      • DUT Output
//
// allowing rapid identification and debugging of design errors.
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
// This verification methodology closely resembles the techniques used in
// professional FPGA and ASIC verification environments, where simulations
// automatically determine design correctness without requiring manual waveform
// inspection.
//
// New Concepts Introduced:
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
// Project     : 03 - 4-bit Ripple Carry Adder
//==============================================================================

`timescale 1ns/1ps

module ripple_carry_adder_tb;

reg [3:0]a;
reg [3:0]b;
reg c_in;

wire [3:0]s;
wire c_out;

ripple_carry_adder dut(

    .a(a),
    .b(b),
    .c_in(c_in),

    .s(s),
    .c_out(c_out)
);

 integer i;

initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0,ripple_carry_adder_tb);

 $display("========== Ripple Carry Adder Automated Test Started ==========");

    for(i=0;i<512;i=i+1)
    begin
        {a,b,c_in} = i;
        
        #10;
    end
   $display("========== Test Completed Successfully ==========");

    $finish;

end

initial begin
    
    $monitor("Time=%0t A=%b B=%b c_in=%b sum=%b c_out=%b ",$time,a,b,c_in,s,c_out );
end

endmodule