`timescale 1ns/1ps

module bcd_adder_tb;

    // Inputs
    reg [3:0] a;
    reg [3:0] b;
    reg       c_in;

    // Expected values
    reg [4:0] binary_sum;
    reg [4:0] expected;

    // DUT Outputs
    wire [3:0] s;
    wire       c_out;

    // DUT Instantiation
    bcd_adder dut (
        .a(a),
        .b(b),
        .c_in(c_in),
        .s(s),
        .c_out(c_out)
    );

    integer i, j, k;
    integer test_no;
    integer fail_count;

    localparam DELAY = 10;

    initial begin

        $dumpfile("waveform.vcd");
        $dumpvars(0, bcd_adder_tb);

        test_no    = 0;
        fail_count = 0;

        $display("===============================================");
        $display("      BCD ADDER AUTOMATED TEST STARTED");
        $display("===============================================");

        // Test only valid BCD digits (0-9)
        for (i = 0; i <= 9; i = i + 1) begin

            for (j = 0; j <= 9; j = j + 1) begin

                for (k = 0; k < 2; k = k + 1) begin

                    // Apply Inputs
                    a    = i;
                    b    = j;
                    c_in = k;

                    // Calculate Expected Output
                    binary_sum = a + b + c_in;

                    if (binary_sum > 9)
                        expected = binary_sum + 5'd6;
                    else
                        expected = binary_sum;

                    // Wait for DUT
                    #DELAY;

                    test_no = test_no + 1;

                    // Compare
                    if ({c_out, s} == expected) begin

                        $display("PASS : Test Case %0d", test_no);

                    end
                    else begin

                        fail_count = fail_count + 1;

                        $display("-------------------------------------------");
                        $display("FAIL : Test Case %0d", test_no);
                        $display("A         = %b (%0d)", a, a);
                        $display("B         = %b (%0d)", b, b);
                        $display("Cin       = %b", c_in);
                        $display("Expected  = %b", expected);
                        $display("Received  = %b", {c_out, s});
                        $display("-------------------------------------------");

                    end

                end

            end

        end

        $display("");

        if (fail_count == 0)
            $display("RESULT : ALL 200 TEST CASES PASSED");
        else
            $display("RESULT : %0d TEST CASE(S) FAILED", fail_count);

        $display("===============================================");
        $display("        TEST COMPLETED");
        $display("===============================================");

        $finish;

    end

endmodule