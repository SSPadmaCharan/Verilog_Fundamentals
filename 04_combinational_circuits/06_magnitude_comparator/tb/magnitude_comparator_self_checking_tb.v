//==============================================================================
// Module Name : magnitude_comparator_2bit_self_checking_tb
// Project     : Verilog Fundamentals
// Author      : Padma Charan S S
//
// Description :
// ------------
// This self-checking testbench verifies the functionality of the 2-bit
// Magnitude Comparator by automatically comparing the DUT outputs with the
// expected outputs for every possible input combination.
//
// Instead of manually inspecting simulation results, the expected values are
// generated using Verilog's behavioral comparison operators. The DUT outputs
// are then compared against these expected values, and the testbench reports
// either PASS or FAIL for each test case.
//
// All possible combinations of the two 2-bit inputs are applied, providing
// complete functional verification with 100% input coverage.
//
// Total Test Cases :
// ------------------
// A : 4 possible values (00 to 11)
// B : 4 possible values (00 to 11)
//
// Total = 4 × 4 = 16 Test Cases
//
// Verification Flow :
// -------------------
// Generate Input Vectors
//          ↓
// Calculate Expected Outputs
//          ↓
// Apply Inputs to DUT
//          ↓
// Compare DUT Output with Expected Output
//          ↓
// Report PASS / FAIL
//          ↓
// Display Final Verification Summary
//
// Verilog Concepts Learned :
// --------------------------
// - Self-Checking Testbench
// - Behavioral Reference Model
// - Comparison Operators (>, <, ==)
// - Automated PASS / FAIL Reporting
// - Error Counting
// - Exhaustive Functional Verification
//
// Applications :
// --------------
// - RTL Functional Verification
// - Regression Testing
// - Design Validation
// - FPGA / ASIC Verification
// - Automated Hardware Testing
//
//==============================================================================


`timescale 1ns/1ps

module mag_comp_tb;

reg [1:0]a;
reg [1:0]b;

wire gt;
wire les;
wire eq;

mag_comp dut(
    .a(a),
    .b(b),

    .gt(gt),
    .les(les),
    .eq(eq)
);
localparam total_test_case = 16;
integer f_count;
integer i;
localparam delay=10;
reg exp_gt ;
reg exp_les;
reg exp_eq ;

initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0,mag_comp_tb);

 $display("========== Magnitude comparator Automated Test Started ==========");
  f_count=0;

  for (i=0; i<total_test_case;i=i+1 ) begin

    {a,b} =i;
    #delay;

    exp_gt = a>b;
    exp_les = a<b;
    exp_eq = a==b;


    if ({exp_gt,exp_les,exp_eq}=={gt,les,eq}) begin
         $display("PASS : Test Case %0d", i); 
        
    end
    else 
    begin
           $display("--------------------------------------");
            $display("FAIL : Test Case %0d", i);
            $display("A0         = %b", a[0]);
            $display("A1         = %b", a[1]);
            $display("B0        = %b", b[0]);
            $display("B1        = %b", b[1]);
            $display("Expected  = %b", {exp_gt,exp_les,exp_eq});
            $display("Received  = %b", {gt,les,eq});
            $display("--------------------------------------");

    f_count=f_count + 1;

    end
    
  end

      if (f_count == 0)
    $display("RESULT : ALL TEST CASES PASSED");
    else
    $display("RESULT : %0d TEST CASE(S) FAILED", f_count);

        $display("========== Test Completed Successfully ==========");
   $finish;

end


endmodule
