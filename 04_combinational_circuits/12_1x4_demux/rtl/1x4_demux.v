/*
----------------------------------------------------------------------------------
Project      : Verilog Fundamentals
Module       : 1×4 Demultiplexer
File         : demux_1x4.v

Description:
------------
This module implements a 1×4 Demultiplexer (DEMUX) using Verilog HDL.

A Demultiplexer is a combinational data routing circuit that directs a single
input signal to one of multiple output lines based on the value of the select
inputs. Unlike a Multiplexer, which selects one input from many, a
Demultiplexer distributes one input to a selected output.

The design consists of one data input (i), two select inputs (s[1:0]), and
four output lines (y[3:0]). At any given time, only one output is assigned the
input value while all remaining outputs remain LOW, ensuring mutually exclusive
data routing.

Output Selection:
-----------------
s = 2'b00  ->  y0 = i
s = 2'b01  ->  y1 = i
s = 2'b10  ->  y2 = i
s = 2'b11  ->  y3 = i

This implementation demonstrates the principles of combinational logic,
Boolean equation realization, data routing, and behavioral RTL design. The
module serves as a fundamental building block for more advanced digital
circuits such as decoders, memory address selection, processor bus routing,
communication systems, and FPGA-based digital designs.

----------------------------------------------------------------------------------
*/

module demux(

    input i,
    input wire [1:0]s,

    output reg [3:0]y
);

always @(*) begin

    case (s)
       2'b00  :begin  y[0] = i; y[1]=0 ; y[2]=0; y[3]=0; end 
      2'b01  : begin y[0] = 0 ; y[1]=i ; y[2]=0  ; y[3]=0; end 
      2'b10  : begin y[0] = 0 ; y[1]=0 ; y[2]=i ; y[3]=0; end
      2'b11  : begin y[0] = 0 ; y[1]=0; y[2]=0 ;y[3]=i; end 
        default: 
        y = 4'b0000;

    endcase
    
end

endmodule
