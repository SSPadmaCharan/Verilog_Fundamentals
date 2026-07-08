//==============================================================
// Project    : XOR Gate using Verilog
// Description: Implements a 2-input XOR (Exclusive OR) gate.
//
// An XOR gate has two inputs and one output.
// The output becomes HIGH (1) only when the inputs are DIFFERENT.
// If both inputs are the same (both 0 or both 1),
// the output becomes LOW (0).
//
// Boolean Expression:
//      y = a ^ b
//
// Truth Table:
//      a | b | y
//     -----------
//      0 | 0 | 0
//      0 | 1 | 1
//      1 | 0 | 1
//      1 | 1 | 0
//
// '^' is the Verilog XOR (Exclusive OR) operator.
//
//==============================================================



module  xor_gate(
    input a,
    input b,
    output y
);
assign y = a^b;
endmodule
