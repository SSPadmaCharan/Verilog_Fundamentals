/*
==============================================================================
Module Name : decoder_2x4
Author      : Padma Charan S S
Project     : Verilog Fundamentals
Description :
    This module implements a 2×4 Decoder using Dataflow Modeling in Verilog
    HDL. The decoder accepts a 2-bit binary input and activates exactly one
    of the four output lines corresponding to the applied input value.

    The design generates a one-hot output in which only one output is HIGH
    at any given time while all remaining outputs remain LOW.

Truth Table:

    Input (AB)      Output (Y3 Y2 Y1 Y0)
    ----------      --------------------
       00                 0001
       01                 0010
       10                 0100
       11                 1000

Boolean Equations:

    Y0 = A'B'
    Y1 = A'B
    Y2 = AB'
    Y3 = AB

Implementation:
    - Dataflow Modeling
    - Continuous Assignment ('assign')
    - Boolean Equation Based Design
    - One-Hot Output Generation

Hardware Used:
    - 2 NOT Gates
    - 4 AND Gates

Applications:
    - Memory Address Decoding
    - CPU Instruction Decoding
    - Chip Select Logic
    - Digital Multiplexing Systems
    - Embedded Systems
    - FPGA and ASIC Designs

Note:
    A Decoder is often referred to as a "Minterm Generator" because each
    output represents one unique minterm of the input variables. For every
    input combination, exactly one output line is asserted HIGH.
==============================================================================
*/

module decoder(
    input wire a,b,
    output wire [3:0]y
);

assign y[0]=~a&~b;
assign y[1]=~a&b;
assign y[2]=a&~b;
assign y[3]=a&b;

endmodule
