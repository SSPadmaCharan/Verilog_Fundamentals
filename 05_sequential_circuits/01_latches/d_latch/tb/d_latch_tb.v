`timescale 1ns/1ps

module d_latch_tb;

reg en;
reg d;
reg exp_q;
reg exp_q_bar;

wire q;
wire q_bar;

d_latch dut(
    .en(en),
    .d(d),

    .q(q),
    .q_bar(q_bar)

);

integer f_counter = 0;
integer test_counter = 0;

localparam delay = 10;

task check_result;
begin

    test_counter = test_counter + 1;

    if ((exp_q === q) && (exp_q_bar === q_bar)) begin

        $display("PASS : Test Case %0d", test_counter);

    end

    else begin

        $display("--------------------------------------");
        $display("FAIL : Test Case %0d", test_counter);
        $display("Enable  = %b", en);
        $display("D     = %b", d);
       
        $display("Expected= %b %b", exp_q, exp_q_bar);
        $display("Received= %b %b", q, q_bar);
        $display("--------------------------------------");

        f_counter = f_counter + 1;

    end

end
endtask

initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0,d_latch_tb);

    $display("D Latch Automated Test Started");

    en=1'b1;
    d=1'b0;

    #delay;

    exp_q=1'b0;
    exp_q_bar=1'b1;
    check_result;

    en=1'b0;
    d=1'b0;

    #delay;

  
    check_result;

    en=1'b1;
    d=1'b1;

    #delay;

    exp_q=1'b1;
    exp_q_bar=1'b0;
    check_result;


    $display("========== D Latch Automated Test Completed ==========");

    if (f_counter == 0)
        $display("RESULT : ALL VALID TEST CASES PASSED");
    else
        $display("RESULT : %0d TEST CASE(S) FAILED", f_counter);

    $finish;

end

endmodule





