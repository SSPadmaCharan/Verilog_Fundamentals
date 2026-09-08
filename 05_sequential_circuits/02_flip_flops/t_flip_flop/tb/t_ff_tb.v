`timescale 1ns/1ps

module t_ff_tb;
reg clk;
reg t;
reg exp_q;
reg exp_q_bar;
wire q;
wire q_bar;


t_ff dut (
    .clk(clk),
    .t(t),

    .q(q),
    .q_bar(q_bar)
);

integer i;
localparam total_test_cases =2 ;
integer f_counter = 0;
integer test_counter = 0;

always #5 clk=~clk;

initial begin
       $dumpfile("waveform.vcd");
    $dumpvars(0,t_ff_tb);

    $display("T Flip Flop Automated Test Started " );

clk=0;
t=0;

@(posedge clk);
#1;

exp_q = 0;
    exp_q_bar = 1;
for (i=0 ;i<total_test_cases ;i=i+1 ) begin
    t=i;

    @(posedge clk) ;
        #1;

        if(t)begin
            exp_q=~exp_q;
            exp_q_bar=~exp_q_bar;

        end
        else begin
            exp_q=exp_q;
            exp_q_bar=exp_q_bar;

    end

      test_counter = test_counter + 1;

            if (exp_q === q && exp_q_bar === q_bar) begin

                $display("PASS : Test Case %0d", test_counter);
                 

            end

            else begin

                $display("--------------------------------------");
                $display("FAIL : Test Case %0d", test_counter);
                $display("CLK      = %b", clk);
                $display("T        = %b", t);
              
                $display("Expected = %b %b", exp_q, exp_q_bar);
                $display("Received = %b %b", q, q_bar);
                $display("--------------------------------------");

                f_counter = f_counter + 1;

            end


end
 $display("T Flip Flop Automated test Ended");

    if (f_counter == 0)
        $display("RESULT : ALL VALID TEST CASES PASSED");
    else
        $display("RESULT : %0d TEST CASE(S) FAILED", f_counter);

    $finish;


end
endmodule


