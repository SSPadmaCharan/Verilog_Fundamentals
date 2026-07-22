//==============================================================================
// Module Name : carry_select_adder
// Author      : Padma Charan S S
// Description :
//
// This module implements an 8-bit Carry Select Adder (CSA) using Structural
// Modeling in Verilog. The design improves addition speed by reducing carry
// propagation delay through parallel computation.
//
// The lower 4-bit block uses a Ripple Carry Adder (RCA) to compute the actual
// carry-out. Simultaneously, two additional 4-bit Ripple Carry Adders compute
// the upper 4-bit sum for both possible carry-in values (0 and 1). Once the
// lower block generates the actual carry, 2×1 multiplexers select the correct
// upper sum and carry-out.
//
// This implementation demonstrates:
//   • Structural Modeling
//   • Module Instantiation
//   • Hierarchical Design
//   • Parallel Computation
//   • Parameterized RTL Design
//
// Inputs :
//   a   - First 8-bit input operand
//   b   - Second 8-bit input operand
//   cin - Input carry
//
// Outputs :
//   sum  - 8-bit addition result
//   cout - Final carry-out
//
//==============================================================================



module csa_adder #(
    parameter WIDTH = 8 ,
    parameter BLOCK = 4

)
(
    input wire [WIDTH-1:0]a,
    input wire [WIDTH-1:0]b,
    input wire c_in,

    output wire [WIDTH-1:0]s,
    output wire c_out
);

wire c1;
wire c2;
wire c3;
wire  [WIDTH-1:BLOCK]s1;
wire  [WIDTH-1:BLOCK]s2;

ripple_4 BA1(

    .a(a[BLOCK-1:0]),
    .b(b[BLOCK-1:0]),
    .c_in(c_in),

    .s(s[BLOCK-1:0]),
    .c_out(c1)
);

ripple_4 BA2_0(

    .a(a[WIDTH-1:BLOCK]),
    .b(b[WIDTH-1:BLOCK]),
    .c_in(1'b0), 

    .s(s1),
    .c_out(c2)
);

ripple_4 BA2_1(

    .a(a[WIDTH-1:BLOCK]),
    .b(b[WIDTH-1:BLOCK]),
    .c_in(1'b1), 

    .s(s2),
    .c_out(c3)
);


 mux #(

    .WIDTH(WIDTH-BLOCK)
 ) SUM(

    .a(s1),
    .b(s2),
    .sel(c1),

    .y(s[WIDTH-1:BLOCK])

);



 mux #(
    .WIDTH(1)
 ) CARRY(

    .a(c2),
    .b(c3),
    .sel(c1),

    .y(c_out)

);
endmodule 