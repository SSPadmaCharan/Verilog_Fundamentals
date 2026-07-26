/*
===============================================================================
Module Name : encoder_8x3
Author      : Padma Charan S S
Project     : Verilog Fundamentals
Description :
-------------------------------------------------------------------------------
This module implements an 8-to-3 Binary Encoder using combinational logic.

An encoder converts a one-hot input into its corresponding binary representation.
It performs the reverse operation of a decoder by reducing eight input lines
into a 3-bit binary output.

The design assumes that exactly one input is HIGH (logic 1) at any given time.
Under this valid one-hot condition, the output represents the binary index of
the active input.

Example:
    D3 = 1  ->  B = 3'b011
    D5 = 1  ->  B = 3'b101
    D7 = 1  ->  B = 3'b111

If multiple inputs become HIGH simultaneously, the output is ambiguous because
a standard encoder has no priority mechanism. This limitation is addressed by
a Priority Encoder, which will be implemented in the next project.

The module is implemented using continuous assignment statements (`assign`)
and combinational OR logic derived directly from the encoder truth table.

Applications:
- Keyboard encoding
- Interrupt request encoding
- Data compression
- Processor input interfaces
- Digital communication systems

===============================================================================
*/

module encoder #(
    parameter WIDTH =8
)
(
    input wire [WIDTH-1:0]i,
    output wire [WIDTH-6:0]b
);

 or b0(b[0],i[1],i[5s],i[3],i[7]);
 or b1(b[1],i[2],i[3],i[7],i[6]);
 or b2(b[2],i[4],i[5],i[6],i[7]);

endmodule

