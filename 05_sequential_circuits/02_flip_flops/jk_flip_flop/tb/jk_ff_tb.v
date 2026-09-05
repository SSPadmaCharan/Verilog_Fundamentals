`timescale 1ns/1ps

module jk_ff_tb;

reg j;
reg k;
reg clk;

reg exp_q;
reg exp_q_bar;

wire q;
wire q_bar;

jk_ff dut (
    .j(j),
    .k(k),
    .clk(clk),
    .q(q),
    .q_bar(q_bar)
);

integer i;

localparam total_test_cases = 2**2;

integer f_counter = 0;
integer test_counter = 0;
always #5 clk = ~clk;

initial begin

    $dumpfile("waveform.vcd");
    $dumpvars(0,jk_ff_tb);

    $display("JK Flip Flop Automated test started");

    clk = 0;
    j = 0;
    k = 1;

    // Establish known initial state
    @(posedge clk);
    #1;

    exp_q = 0;
    exp_q_bar = 1;

    for (i = 0; i < total_test_cases; i = i + 1) begin

        {k,j} = i;

        // Only check the flip-flop when a rising edge occurs
     @(posedge clk) begin

            #1;

            if (j == 0 && k == 0) begin

                // HOLD
                exp_q = exp_q;
                exp_q_bar = ~exp_q;

            end

            else if (j !=k) begin
              exp_q=j;
              exp_q_bar=~j;
              
            end

            else begin

                // TOGGLE
                exp_q = ~exp_q;
                exp_q_bar = ~exp_q_bar;

            end

        

            test_counter = test_counter + 1;

            if (exp_q === q && exp_q_bar === q_bar) begin

                $display("PASS : Test Case %0d", test_counter);
                 

            end

            else begin

                $display("--------------------------------------");
                $display("FAIL : Test Case %0d", test_counter);
                $display("CLK      = %b", clk);
                $display("J        = %b", j);
                $display("K        = %b", k);
                $display("Expected = %b %b", exp_q, exp_q_bar);
                $display("Received = %b %b", q, q_bar);
                $display("--------------------------------------");

                f_counter = f_counter + 1;

            end

     end

    end

    $display("JK Flip Flop Automated test Ended");

    if (f_counter == 0)
        $display("RESULT : ALL VALID TEST CASES PASSED");
    else
        $display("RESULT : %0d TEST CASE(S) FAILED", f_counter);

    $finish;

end

endmodule