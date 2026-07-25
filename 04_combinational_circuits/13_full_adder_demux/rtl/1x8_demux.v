/*
----------------------------------------------------------------------------------
Project      : Verilog Fundamentals
Module       : 1×8 Demultiplexer
File         : demux_1x8.v

Description:
------------
This module implements a 1×8 Demultiplexer (DEMUX) using Verilog HDL.

A Demultiplexer is a combinational data routing circuit that directs a single
input signal to one of multiple output lines based on the values of the select
inputs. Only one output is active at any given time, while all remaining
outputs remain LOW.

The design consists of one data input (i), three select inputs (s[2:0]), and
eight output lines (y[7:0]). The select inputs determine which output receives
the input signal.

Output Selection:
-----------------
s = 3'b000  ->  y0 = i
s = 3'b001  ->  y1 = i
s = 3'b010  ->  y2 = i
s = 3'b011  ->  y3 = i
s = 3'b100  ->  y4 = i
s = 3'b101  ->  y5 = i
s = 3'b110  ->  y6 = i
s = 3'b111  ->  y7 = i

When the data input is permanently connected to Logic HIGH ('1'), the
Demultiplexer behaves as a minterm generator, where each output represents one
unique minterm of the select inputs. This property is widely used in canonical
Boolean realization and forms the basis for implementing combinational logic
functions using Sum of Minterms (SOP).

This module serves as a fundamental building block for data routing, decoder
equivalent implementations, memory address decoding, communication systems,
processor control logic, and programmable logic devices such as PLAs and PALs.

----------------------------------------------------------------------------------
*/

module demux(
    input wire i,
    input wire [2:0]s,

    output reg [7:0]y
);


always @(*) begin

case (s)
   3'b000 : y={7'b0,i};
   3'b001 : y={6'b0,i,1'b0};
   3'b010 : y={5'b0,i,2'b0};
   3'b011 : y={4'b0,i,3'b0};
   3'b100 : y={3'b0,i,4'b0};
   3'b101 : y={2'b0,i,5'b0};
   3'b110 : y={1'b0,i,6'b0};
   3'b111 : y={i,7'b0};
   

    default: 
    y = 8'b0;
endcase

end
endmodule 
