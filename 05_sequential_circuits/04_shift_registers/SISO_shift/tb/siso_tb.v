`timescale 1ns/1ps

module siso_tb;

reg s_i;
reg clk;
reg exp_s_o;
 
 wire s_o;
 
 siso dut(
    .s_i(s_i),
    .clk(clk),
    .s_o(s_o)

 );

integer i;
localparam total_test_cases=2**1;
integer f_counter = 0;
integer test_counter = 0;

always #5 clk=~clk;

initial begin
     $dumpfile("waveform.vcd");
     $dumpvars(0,siso_tb);

     $display("SISO Shift Register Automated Test Started " );

     clk=0;

     s_i=0;

@(posedge clk)
#1;

exp_s_o=1'b0;

for (i =0 ;i<total_test_cases ;i=i+1 ) begin
    s_i=i;

    exp_s_o=s_i;
test_counter=test_counter+1;

    if(exp_s_o==s_o)begin
         $display("PASS : Test Case %0d", test_counter);
                
    end

    else begin
             $display("--------------------------------------");
                $display("FAIL : Test Case %0d", test_counter);
                $display("CLK      = %b", clk);
                $display("S_IN       = %b", s_i);
                
                
                $display("Expected = %b ", exp_s_o);
                $display("Received = %b ", s_o);
                $display("--------------------------------------");

                f_counter = f_counter + 1;
    end


end
$display("SISO Shift Regsiter Automated test Ended");

    if (f_counter == 0)
        $display("RESULT : ALL VALID TEST CASES PASSED");
    else
        $display("RESULT : %0d TEST CASE(S) FAILED", f_counter);

    $finish;
end

endmodule
