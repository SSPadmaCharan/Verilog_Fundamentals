`timescale 1ns/1ps

module half_adder_tb;

reg a;
reg b;

wire sum;
wire carry;

 half_adder dut (
    .a(a),
    .b(b),

    .sum(sum),
    .carry(carry)
);

initial begin 

    $dumpfile("waveform.vcd");
    $dumpvars(0,half_adder_tb);

    a = 0; //case : 01 two inputs are low
    b = 0;

    #10;

    a = 0; //case : 02 one inputs is low and other is high
    b = 1;

    #10;

    a = 1; //case : 03 one inputs is low and other is high
    b = 0;
    
    #10;

    a = 1; //case : 04 both are high
    b = 1;

    #10;

    $finish;
    end 

endmodule



    