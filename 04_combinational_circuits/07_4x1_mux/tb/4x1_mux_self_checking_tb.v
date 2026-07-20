//==============================================================================
// Testbench Name : mux_4x1_self_checking_tb
// Description :
// Self-checking testbench for verifying the functionality of the 4×1
// Multiplexer.
//
// This testbench exhaustively applies all possible combinations of the
// 4-bit input bus and 2-bit select lines. For each test case, the expected
// output is calculated using Verilog's variable bit indexing feature
// (`exp_y = i[s]`) and automatically compared with the DUT output.
//
// PASS/FAIL messages are displayed for every test case, followed by a final
// verification summary indicating the total number of passed and failed tests.
//
// Verification Flow:
//   1. Generate all possible input combinations (16).
//   2. Apply all possible select values (4).
//   3. Compute the expected output.
//   4. Compare expected output with DUT output.
//   5. Display PASS or FAIL.
//   6. Generate the final verification summary.
//
// Total Test Cases:
//   Input Combinations  : 16
//   Select Combinations : 4
//   Total Test Cases    : 64
//
// Verilog Concepts:
//   - Self-Checking Testbench
//   - Reference Model
//   - Variable Bit Indexing (i[s])
//   - Nested for Loops
//   - Integer Variables
//   - localparam
//   - if-else Statements
//   - PASS/FAIL Reporting
//   - Functional Verification
//
// Applications:
//   - RTL Verification
//   - Automated Functional Testing
//   - Regression Testing
//   - Verification of Combinational Circuits
//==============================================================================

`timescale 1ns/1ps

module mux_4x1_tb;

reg [3:0]i;
reg [1:0]s;
reg expected;

wire y;

mux_4x1 dut(
    .i(i),
    .s(s),

    .y(y)
);

integer k;
integer j;
localparam delay = 10;
localparam total_test_case = 4;
localparam total_test_case_i = 16;
integer tc = 1;

integer f_count = 0;


initial begin
    
    $dumpfile("waveform.vcd");
    $dumpvars(0,mux_4x1_tb);


        $display("========== 4x1_MUX Automated Test Started ==========");
        


  for (j=0;j<total_test_case_i;j=j+1)
  begin

    {i} = j;

  for (k =0;k<total_test_case;k=k+1 ) 
  begin
$display("--------------------------------");
$display("Test Case : %0d", tc);
    {s} = k;
    expected = i[s];
    
    #delay;
    
    if (y==expected) begin

        $display("PASS : Test Case %0d", tc); 
        
    end
    else 
    begin
         $display("--------------------------------------");
            $display("FAIL : Test Case %0d", tc);
            $display("S1       = %b", s[1]);
            $display("S0       = %b", s[0]);
            $display("I      = %b", i);
           
            $display("Expected = %b", expected);
            $display("Received = %b", y );
            $display("--------------------------------------");

    f_count=f_count + 1;
    end
    tc = tc + 1;

  end
  #delay;

  end 

   $display("========== 4x1_MUX Automated Test Completed ==========");
   if (f_count == 0)
    $display("RESULT : ALL TEST CASES PASSED");
    else
    $display("RESULT : %0d TEST CASE(S) FAILED", f_count);

        $display("========== Test Completed Successfully ==========");
   

$finish;



    
end




endmodule
