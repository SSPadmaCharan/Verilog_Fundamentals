//==============================================================================
// Module Name : ripple_carry_adder_tb
// Description :
// -----------------------------------------------------------------------------
// Automated verification testbench for the 4-bit Ripple Carry Adder.
//
// This testbench performs exhaustive functional verification by automatically
// applying every possible input combination to the Design Under Test (DUT).
//
// Instead of manually writing individual test cases, a for loop together with
// vector concatenation is used to generate all possible combinations of:
//
//      • Operand A (4 bits)
//      • Operand B (4 bits)
//      • Carry-In (1 bit)
//
// Since the Ripple Carry Adder has a total of 9 input bits,
//
//      Total Test Cases = 2^9 = 512
//
// Every possible input combination is applied to the DUT with a simulation
// delay of 10 ns between successive test cases.
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
//      Repeat for all 512 combinations
//
// Vector Concatenation:
//
//      {A, B, Cin} = i;
//
// where
//
//      A   → Bits [8:5]
//      B   → Bits [4:1]
//      Cin → Bit  [0]
//
// This provides an efficient method of generating exhaustive test vectors
// without manually assigning each input.
//
// Simulation Features:
//
//      • Automated input generation
//      • Exhaustive testing (512 cases)
//      • VCD waveform generation
//      • GTKWave compatible output
//      • Simulation progress messages
//
// This testbench focuses on functional verification through waveform analysis.
// Output correctness is verified by observing the generated simulation results.
//
// New Concepts Introduced:
//
//      • Integer Variables
//      • for Loop
//      • Vector Concatenation
//      • Automated Testbench Development
//      • Exhaustive Verification
//      • VCD Dump Generation
//
// Applications:
//
//      • Functional RTL Verification
//      • Simulation Automation
//      • Verification Environment Development
//      • FPGA/ASIC Pre-Silicon Verification
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
reg [4:0]expected;

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
 integer f_counter;

initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0,ripple_carry_adder_tb);

 $display("========== Ripple Carry Adder Automated Test Started ==========");

 f_counter = 0;

    for(i=0;i<512;i=i+1)
    begin
        {a,b,c_in} = i;
        
        #10;

        //calculating expected 
        expected = a + b +c_in;
        if(expected=={c_out,s})
        begin 
            //test possed
          end
else
begin
    $display("--------------------------------------");
    $display("FAIL : Test Case %0d", i);
    $display("A         = %b", a);
    $display("B         = %b", b);
    $display("Cin       = %b", c_in);
    $display("Expected  = %b", expected);
    $display("Received  = %b", {c_out,s});
    $display("--------------------------------------");

    f_counter=f_counter + 1;
end
    end
$display("======================================");
$display("All 512 Test Cases Completed");

if (f_counter == 0)
    $display("RESULT : ALL TEST CASES PASSED");
else
    $display("RESULT : %0d TEST CASE(S) FAILED", f_counter);

$display("======================================");
$display("========== Ripple Carry Adder Automated Test finished ==========");
$finish;

  


end

endmodule


