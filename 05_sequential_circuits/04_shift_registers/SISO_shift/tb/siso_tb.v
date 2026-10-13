`timescale 1ns/1ps

module siso_tb;

reg s_i;
reg clk;
reg exp_s_o;

 reg [3:0]exp_q;

 wire s_o;
 
 siso dut(
    .s_i(s_i),
    .clk(clk),
    .s_o(s_o)

 );

integer i;
integer j;

localparam total_test_cases=2**4;
integer f_counter = 0;
integer test_counter = 0;
reg [3:0]test_data;

always #5 clk=~clk;

initial begin
     $dumpfile("waveform.vcd");
     $dumpvars(0,siso_tb);

     $display("SISO Shift Register Automated Test Started " );

     clk=0;

     s_i=0;

exp_q=4'bxxxx;

repeat (4) begin
    @(negedge clk);
    s_i=0;

    @(posedge clk);
    #1;

end

exp_q=4'b0;

for (i =0 ;i<total_test_cases ;i=i+1 ) begin
   test_data=i;

   for (j =3 ;j>=0 ;j=j-1 ) begin

    @(negedge clk);
    s_i= test_data[j];

    @(posedge clk);

    exp_q={exp_q[2:0],s_i};

    #1;
    exp_s_o=exp_q[3];
    
    
   end
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
