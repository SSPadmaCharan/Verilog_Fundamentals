`timescale 1ns/1ps

 module and_gate_tb;

reg a;
reg b;

wire y;

 and_gate dut (
    .a(a),
    .b(b),

    .y(y)
 );


  initial begin 

    $dumpfile("waveform.vcd");
    $dumpvars(0,and_gate_tb);

    a=0; // case:1 00 all are low
    b=0;

    #10; //delay

    a=0; //case:2 01 one of the in is high
    b=1;

    #10;

    a=1; //case:03 one of the in is high 
    b=0;

    #10;

    a=1;//case:04 all the in are high so the out should be high 
    b=1;

    #10;

    $finish;
  
  end

 endmodule
 