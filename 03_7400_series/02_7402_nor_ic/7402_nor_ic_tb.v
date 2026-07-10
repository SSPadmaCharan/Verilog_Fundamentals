`timescale 1ns/1ps

module ic_7402_tb;

reg a1;
reg b1;

wire y1;

reg a2;
reg b2;

wire y2;

reg a3;
reg b3;

wire y3;

reg a4;
reg b4;

wire y4;

ic_7402 dut(
    .a1(a1),
    .b1(b1),

    .y1(y1),

    .a2(a2),
    .b2(b2),

    .y2(y2),

    .a3(a3),
    .b3(b3),

    .y3(y3),

    .a4(a4),
    .b4(b4),

    .y4(y4)
    );


   initial begin 

    $dumpfile("waveform.vcd");
    $dumpvars(0,ic_7402_tb);

    a1=0; //case:1 00 for all individual nand gates
    b1=0;

    a2=0;
    b2=0;

    a3=0;
    b3=0;

    a4=0;
    b4=0;

    #10; //delay 

    a1=0; //case:2 01 for all individual nand gates
    b1=1;

    a2=0;
    b2=1;

    a3=0;
    b3=1;

    a4=0;
    b4=1;

    #10; //delay 

    a1=1; //case:3 10 for all individual nand gates
    b1=0;

    a2=1;
    b2=0;

    a3=1;
    b3=0;

    a4=1;
    b4=0;

    #10; //delay 

    a1=1; //case:4 11 for all individual nand gates
    b1=1;

    a2=1;
    b2=1;

    a3=1;
    b3=1;

    a4=1;
    b4=1;

    #10; //delay 
    $finish;

   end

endmodule

    


