`timescale 1ns/1ps

module multiple_wire_tb;

    reg a;
    reg b;

    wire x;
    wire y;
    wire z;

    multiple_wire dut(
        .a(a),
        .b(b),

        .x(x),
        .y(y),
        .z(z)

    );

    initial begin 
        $dumpfile("waveform.vcd");
        $dumpvars(0,multiple_wire_tb);

        a = 0; //case:1 00
        b = 0;

        #10; //delay for 10ns

        a = 0; //case:2 01
        b = 1;

        #10;

        a = 1; //case:3 10
        b = 0;

        #10;

        a = 1; //case:4 11
        b = 1;

        #10;

        $finish;

    end

endmodule


