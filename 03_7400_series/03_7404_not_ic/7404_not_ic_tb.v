`timescale 1ns/1ps

module ic_7404_tb;

    reg a1;
    reg a2;
    reg a3;
    reg a4;
    reg a5;
    reg a6;

    wire y1;
    wire y2;
    wire y3;
    wire y4;
    wire y5;
    wire y6;


 ic_7404 dut(
    
   .a1(a1),
   
   .a2(a2),
   
   .a3(a3),
   
   .a4(a4),
   
   .a5(a5),
   
   .a6(a6),

    .y1(y1),
    .y2(y2),
    .y3(y3),
    .y4(y4),
    .y5(y5),
    .y6(y6)
   
 );

  initial begin 

    $dumpfile("waveform.vcd");
    $dumpvars(0,ic_7404_tb);

     a1=0; //case:1 0 for all input
     a2=0;
     a3=0;
     a4=0;
     a5=0;
     a6=0;

     #10;

    a1=1; // case:2 1 for all input
    a2=1;
    a3=1;
    a4=1;
    a5=1;
    a6=1;
 
     #10;

     $finish;

  end

  endmodule
