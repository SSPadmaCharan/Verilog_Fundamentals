`timescale 1ns/1ps

module sr_latch_tb;

reg enable;
reg s_n;
reg r_n;

reg exp_q;
reg exp_q_bar;

wire q;
wire q_bar;

sr_latch dut(
    .enable(enable),
    .s_n(s_n),
    .r_n(r_n),
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
        $display("Enable  = %b", enable);
        $display("S_n     = %b", s_n);
        $display("R_n     = %b", r_n);
        $display("Expected= %b %b", exp_q, exp_q_bar);
        $display("Received= %b %b", q, q_bar);
        $display("--------------------------------------");

        f_counter = f_counter + 1;

    end

end
endtask


initial begin

    $dumpfile("waveform.vcd");
    $dumpvars(0, sr_latch_tb);

    $display("========== SR Latch Automated Test Started ==========");


    // --------------------------------------------------
    // INITIALIZATION
    // --------------------------------------------------

    enable = 1'b1;
    s_n    = 1'b0;
    r_n    = 1'b1;

    #delay;

    exp_q     = 1'b0;
    exp_q_bar = 1'b1;

    check_result;


    // --------------------------------------------------
    // TEST 1 : HOLD WITH ENABLE = 0
    // --------------------------------------------------

    enable = 1'b0;
    s_n    = 1'b0;
    r_n    = 1'b0;

    #delay;

    check_result;


    // --------------------------------------------------
    // TEST 2 : HOLD WITH DIFFERENT INPUTS
    // --------------------------------------------------

    enable = 1'b0;
    s_n    = 1'b1;
    r_n    = 1'b0;

    #delay;

    check_result;


    // --------------------------------------------------
    // TEST 3 : HOLD WITH DIFFERENT INPUTS
    // --------------------------------------------------

    enable = 1'b0;
    s_n    = 1'b0;
    r_n    = 1'b1;

    #delay;

    check_result;


    // --------------------------------------------------
    // TEST 4 : HOLD WITH S_n = 1, R_n = 1
    // --------------------------------------------------

    enable = 1'b0;
    s_n    = 1'b1;
    r_n    = 1'b1;

    #delay;

    check_result;


    // --------------------------------------------------
    // TEST 5 : ENABLED HOLD
    // --------------------------------------------------

    enable = 1'b1;
    s_n    = 1'b0;
    r_n    = 1'b0;

    #delay;

    check_result;


    // --------------------------------------------------
    // TEST 6 : RESET
    // --------------------------------------------------

    enable = 1'b1;
    s_n    = 1'b0;
    r_n    = 1'b1;

    #delay;

    exp_q     = 1'b0;
    exp_q_bar = 1'b1;

    check_result;


    // --------------------------------------------------
    // TEST 7 : SET
    // --------------------------------------------------

    enable = 1'b1;
    s_n    = 1'b1;
    r_n    = 1'b0;

    #delay;

    exp_q     = 1'b1;
    exp_q_bar = 1'b0;

    check_result;


    // --------------------------------------------------
    // TEST 8 : INVALID
    // --------------------------------------------------

    enable = 1'b1;
    s_n    = 1'b1;
    r_n    = 1'b1;

    #delay;

    $display("TEST CASE 8 = INVALID");
    $display("Enable  = %b", enable);
    $display("S_n     = %b", s_n);
    $display("R_n     = %b", r_n);
    $display("Received= %b %b", q, q_bar);


    // --------------------------------------------------
    // FINAL RESULT
    // --------------------------------------------------

    $display("========== SR Latch Automated Test Completed ==========");

    if (f_counter == 0)
        $display("RESULT : ALL VALID TEST CASES PASSED");
    else
        $display("RESULT : %0d TEST CASE(S) FAILED", f_counter);

    $finish;

end

endmodule