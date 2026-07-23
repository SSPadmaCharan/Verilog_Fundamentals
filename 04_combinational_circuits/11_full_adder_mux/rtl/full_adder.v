//------------------------------------------------------------------------------
// Module: Full Adder Using Only 2×1 Multiplexers
//
// Description:
// This module implements a 1-bit Full Adder using only 2×1 Multiplexers.
// No built-in logic gates (AND, OR, XOR, XNOR, or NOT) are used directly.
//
// The design follows a hierarchical structural modeling approach:
//
// 1. A NOT gate is first constructed using a 2×1 Multiplexer.
// 2. The NOT gate is then used to build XOR and XNOR gates.
// 3. AND and OR gates are also implemented using separate 2×1 Multiplexers.
// 4. Finally, two additional multiplexers combine these intermediate signals
//    to generate the SUM and CARRY outputs based on Shannon Expansion.
//
// SUM Logic:
//
//      SUM = A ⊕ B ⊕ Cin
//
// Using Shannon Expansion:
//
//      If A = 0 → SUM = B ⊕ Cin
//      If A = 1 → SUM = ~(B ⊕ Cin)
//
// Therefore:
//
//      Select = A
//      D0 = XOR(B, Cin)
//      D1 = XNOR(B, Cin)
//
// CARRY Logic:
//
//      Carry = AB + ACin + BCin
//
// Using Shannon Expansion:
//
//      If A = 0 → Carry = B & Cin
//      If A = 1 → Carry = B | Cin
//
// Therefore:
//
//      Select = A
//      D0 = AND(B, Cin)
//      D1 = OR(B, Cin)
//
// Hardware Architecture:
//
//                     +----------------+
//                     |  Full Adder    |
//                     +----------------+
//                      /              \
//                     /                \
//              SUM Path            Carry Path
//                 |                    |
//         XOR → XNOR MUX       AND → OR MUX
//                 |                    |
//                 +---------+----------+
//                           |
//                     Final 2×1 MUXes
//                           |
//                     SUM and CARRY
//
// This implementation demonstrates:
//
// • Universal Logic using Multiplexers
// • Shannon Expansion
// • Structural Modeling
// • Hierarchical RTL Design
// • Hardware Reusability
//
//------------------------------------------------------------------------------


module full_adder(
    input wire a,b,c_in,
    output wire s,c_out
);

wire not_b;
wire xor_s;
wire xnor_s;
wire and_c;
wire or_c;


mux not_b1(
 
 .a(1'b1),
 .b(1'b0),
 .sel(b),

 .y(not_b)

);

mux xor_s1(

    .a(b),
    .b(not_b),
    .sel(c_in),

    .y(xor_s)
);

mux xnor_s1(

    .a(not_b),
    .b(b),
    .sel(c_in),

    .y(xnor_s)
);

mux and_c1(
    .a(1'b0),
    .b(b),
    .sel(c_in),

    .y(and_c)
);

mux or_c1(
    .a(b),
    .b(1'b1),
    .sel(c_in),

    .y(or_c)
);

mux sum(
    .a(xor_s),
    .b(xnor_s),
    .sel(a),

    .y(s)
);

mux carry (
    .a(and_c),
    .b(or_c),
    .sel(a),

    .y(c_out)
);

endmodule
