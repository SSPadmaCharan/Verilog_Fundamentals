`timescale 1ns/1ps

 module not_gate_tb;

reg a;
wire y;

not_gate dut(

    .a(a),
    .y(y)
);

    initial begin 

        $dumpfile("waveform.vcd");
        $dumpvars(0,not_gate_tb);
        

        a = 0; //case:1 low input

        #10; //delay

        a = 1; //case:2 high input

        #10;

        $finish;
    end

endmodule    

