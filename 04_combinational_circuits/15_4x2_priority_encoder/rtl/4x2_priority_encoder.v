/*
==============================================================================
Module Name : priority_encoder_4x2
Author      : Padma Charan S S
Project     : Verilog Fundamentals
Description :
    This module implements a 4×2 Priority Encoder using Behavioral Verilog.
    The design accepts a 4-bit input vector and generates a 2-bit binary
    output corresponding to the highest-priority active input.

    The priority order is:

        E3 > E2 > E1 > E0

    If multiple input bits are HIGH simultaneously, the encoder ignores all
    lower-priority inputs and encodes only the highest-priority input.

    The design is implemented using the 'casex' statement, allowing concise
    wildcard pattern matching for priority conditions.

Priority Table:

    Input Pattern      Output
    ------------      ------
       1xxx             11
       01xx             10
       001x             01
       0001             00
       0000             00

Features:
    - Behavioral Modeling
    - Priority-Based Encoding
    - Uses 'casex' for wildcard matching
    - Synthesizable RTL
    - Suitable for simulation and FPGA synthesis

Applications:
    - CPU Interrupt Controllers
    - Bus Arbitration Logic
    - Keyboard Encoders
    - DMA Controllers
    - Embedded Systems
    - Communication Interfaces

Note:
    Unlike a standard binary encoder, this priority encoder correctly handles
    multiple active inputs by always selecting the highest-priority input.
==============================================================================
*/

module encoder(
    input  [3:0]e,
    output reg [1:0]y
);
always @(*) begin
    casex (e)
    4'b0001: y = 2'b00;
    4'b001x: y = 2'b01;
    4'b01xx: y = 2'b10;
    4'b1xxx: y = 2'b11;

    default: 
    y = 2'b00;
endcase
end


endmodule
