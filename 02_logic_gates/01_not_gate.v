
//==============================================================
// Project    : NOT Gate using Verilog
// Description: Implements a NOT gate (Inverter).
//
// A NOT gate has one input and one output.
// It produces the complement (inverse) of the input.
//
// Boolean Expression:
//      y = ~a
//
// Truth Table:
//      a | y
//     -------
//      0 | 1
//      1 | 0
//
// '~' is the Verilog NOT (bitwise inversion) operator.
//
//==============================================================
module not_gate(
    input a,
    output y
);

assign y = ~a;

endmodule
