//==============================================================================
// Testbench Name : mux_4x1_tb
// Description :
// Automated testbench for verifying the functionality of the 4×1 Multiplexer.
//
// This testbench exhaustively applies all possible combinations of the
// 4-bit input bus and the 2-bit select lines. For every input combination,
// each select value is tested, ensuring complete functional coverage of the
// multiplexer.
//
// Verification Flow:
//   1. Generate all possible input combinations (16).
//   2. Apply all possible select values (4).
//   3. Observe the DUT output using $monitor.
//   4. Generate waveform for simulation analysis.
//
// Total Test Cases:
//   Input Combinations  : 16
//   Select Combinations : 4
//   Total Test Cases    : 64
//
// Verilog Concepts:
//   - Testbench Construction
//   - Nested for Loops
//   - Integer Variables
//   - localparam
//   - $monitor
//   - $display
//   - $dumpfile
//   - $dumpvars
//
// Applications:
//   - Functional Verification
//   - Automated Simulation
//   - Waveform Generation
//   - Exhaustive Combinational Circuit Testing
//==============================================================================

`timescale 1ns/1ps

module mux_4x1_tb;

reg [3:0]i;
reg [1:0]s;

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
    
    #delay;
    tc = tc + 1;

  end
  #delay;

  end 

   $display("========== 4x1_MUX Automated Test Completed ==========");

$finish;



    
end

initial begin
    $monitor("Time=%0t S1=%b S0=%b i=%b Y =%b ", $time,s[1],s[0],i,y);

end
endmodule
