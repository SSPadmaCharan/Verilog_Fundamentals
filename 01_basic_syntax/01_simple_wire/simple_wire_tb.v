`timescale 1ns/1ps
 
 module simple_wire_tb;

 reg in;
 wire out;

   simple_wire dut(
    .in(in),
    .out(out)
   );

initial begin 
    $dumpfile("waveform.vcd");
    $dumpvars(0,simple_wire_tb);

    in =0;
    #10;
    in = 1;
    #10;
    in = 0;
    #10;

    $finish;
end

endmodule