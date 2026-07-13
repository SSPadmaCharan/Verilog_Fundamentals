`timescale 1ns/1ps

module full_adder_tb;

reg a;
reg b;
reg c_in;

wire f_sum;
wire c_out;

full_adder dut(
    .a(a),
    .b(b),
    .c_in(c_in),

    .f_sum(f_sum),
    .c_out(c_out)

);

initial begin

    $dumpfile("waveform.vcd");
    $dumpvars(0,full_adder_tb);


    a = 0; //case :1 
    b = 0;
    c_in = 0;

    #10;

    a = 0; //case :2 
    b = 0;
    c_in = 1;

    #10;   

    a = 0; //case :3 
    b = 1;
    c_in = 0;

     #10;

    a = 0; //case :4 
    b = 1;
    c_in = 1;

     #10;

    a = 1; //case :5 
    b = 0;
    c_in = 0;

    #10;

    a = 1; //case :6 
    b = 0;
    c_in = 1;

    #10;


    a = 1; //case :7 
    b = 1;
    c_in = 0;

    #10;

    a = 1; //case :8 
    b = 1;
    c_in = 1;


    #10;

    $finish;

end
endmodule
