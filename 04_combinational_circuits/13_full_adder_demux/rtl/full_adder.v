/*
----------------------------------------------------------------------------------
Project      : Verilog Fundamentals
Module       : Full Adder Using 1×8 Demultiplexer
File         : full_adder_using_1x8_demux.v

Description:
------------
This module implements a 1-bit Full Adder using a 1×8 Demultiplexer (DEMUX)
and Verilog OR gate primitives.

The design follows the Canonical Sum of Minterms (SOP) approach, where the
DEMUX is configured as a minterm generator by permanently connecting its data
input to Logic HIGH ('1'). The three Full Adder inputs (A, B, and Cin) are
connected to the DEMUX select lines, causing exactly one output line to become
HIGH for each unique input combination.

Each active DEMUX output represents a unique minterm of the three input
variables. The required minterms are then combined using built-in OR gate
primitives to generate the SUM and CARRY outputs of the Full Adder.

Minterm Generation:
-------------------
S2 = A
S1 = B
S0 = Cin
Input = 1'b1

Active Outputs:
---------------
000 -> Y0
001 -> Y1
010 -> Y2
011 -> Y3
100 -> Y4
101 -> Y5
110 -> Y6
111 -> Y7

Boolean Realization:
--------------------
SUM   = Y1 + Y2 + Y4 + Y7

CARRY = Y3 + Y5 + Y6 + Y7

This implementation demonstrates canonical Boolean realization, minterm
generation using a DEMUX, structural module instantiation, and gate-level
modeling using Verilog primitives. It also illustrates how combinational logic
functions can be synthesized by combining selected minterms, a principle widely
used in Programmable Logic Arrays (PLAs), Programmable Array Logic (PAL), FPGA
Lookup Tables (LUTs), and digital logic synthesis.

----------------------------------------------------------------------------------
*/

module full_adder(
    input a,b,c_in,
    output  s_u,c_out
);

wire [7:0]y_a;


demux adder(

    .i(1'b1),
    .s({c_in,b,a}),

    .y(y_a)
);

or sum(s_u,y_a[1],y_a[2],y_a[4],y_a[7]);

or carry(c_out,y_a[3],y_a[5],y_a[6],y_a[7]);

endmodule
