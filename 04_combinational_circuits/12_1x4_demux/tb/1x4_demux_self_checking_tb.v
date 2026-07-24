`timescale 1ns/1ps

module demux_tb;
reg i;
reg [1:0]s;
reg expected;

wire [3:0]y;

demux dut(
    .i(i),
    .s(s),

    .y(y)
);

integer j;
localparam total_test_case = 2 ** 3;
localparam delay = 10;
integer f_count=0;


initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0,demux_tb);


$display("========== 1X4 DEMUX  Automated Test Started ==========");
 for (j =0 ;j<total_test_case ;j=j+1) begin

    {i,s}=j;

    #delay;
    expected = i;
    
    if (expected==y[s]) begin

         $display("PASS : Test Case %0d", j); 
    end
    else
 begin
    $display("--------------------------------------");
            $display("FAIL : Test Case %0d", j);
            $display("S1       = %b", s[1]);
            $display("S0       = %b", s[0]);
            $display("I      = %b", i);
           
            $display("Expected = %b", expected);
            $display("Received = %b", y );
            $display("--------------------------------------");
 end


    
 end
 $display("========== 1X4 DEMUX  Automated Test Completed ==========");
if (f_count == 0)
    $display("RESULT : ALL TEST CASES PASSED");
    else
    $display("RESULT : %0d TEST CASE(S) FAILED", f_count);


 $finish;



end
endmodule
