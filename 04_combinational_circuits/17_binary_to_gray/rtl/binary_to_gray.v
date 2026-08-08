/*
==============================================================================
Module Name : binary_to_gray
Author      : Padma Charan S S
Project     : Verilog Fundamentals
Description :
    This module implements a 4-bit Binary to Gray Code Converter using
    Dataflow Modeling in Verilog HDL.

    The converter accepts a 4-bit binary input and generates its equivalent
    4-bit Gray code output. Gray code is a binary numbering system in which
    only one bit changes between consecutive values, reducing transition
    errors caused by propagation delays.

    The conversion is based on the following relationships:

        G3 = B3
        G2 = B3 ^ B2
        G1 = B2 ^ B1
        G0 = B1 ^ B0

    where '^' represents the Bitwise XOR operation.

    The design is implemented using:
        - Dataflow Modeling
        - Continuous Assignment ('assign')
        - Vector Indexing
        - Vector Concatenation
        - Bitwise XOR Operator

Conversion Table (Partial):

    Binary      Gray
    ------      ----
    0000        0000
    0001        0001
    0010        0011
    0011        0010
    ...
    1111        1000

Hardware Used:
    - Three XOR Gates
    - One Direct Connection (MSB)

Applications:
    - Rotary Encoders
    - Shaft Position Sensors
    - Industrial Automation
    - Asynchronous FIFO Pointers
    - Clock Domain Crossing (CDC)
    - ADC Interfaces
    - FPGA and ASIC Designs

Note:
    Gray code minimizes transition errors by ensuring that only one bit
    changes between consecutive code words. This makes it highly suitable
    for high-speed and asynchronous digital systems where reliable state
    transitions are essential.

==============================================================================
*/


module bi2gray(
input wire [3:0]b,
output wire [3:0]g

);

assign g[0]=b[0]^b[1];
assign g[1]=b[1]^b[2];
assign g[2]=b[2]^b[3];
assign g[3]=b[3];


endmodule 

