`timescale 1ns/1ps

module xor_gate_tb;

reg a;
reg b;

wire y;


 xor_gate dut(

    .a(a),
    .b(b),

    .y(y)
);

    initial begin 

        $dumpfile("waveform.vcd");
        $dumpvars(0,xor_gate_tb);

         a=0; //case:1 00 all in are low
    b=0;

    #10; // delay

    a=0; //case:2 01 one in is high
    b=1; 

    #10;

    a=1;  //case:3 10  one in is high
    b=0;

    #10;

    a=1;
    b=1;

    #10;

    $finish;

    end
endmodule
