//==============================================================
// Project    : AND Gate using Verilog
// Description: Implements a 2-input AND gate.
//
// An AND gate has two inputs and one output.
// The output becomes HIGH (1) only when BOTH inputs are HIGH (1).
// Otherwise, the output remains LOW (0).
//
// Boolean Expression:
//      y = a & b
//
// Truth Table:
//      a | b | y
//     -----------
//      0 | 0 | 0
//      0 | 1 | 0
//      1 | 0 | 0
//      1 | 1 | 1
//
// '&' is the Verilog AND operator.
//
//==============================================================
module andgate(
    input a,
    input b,
    output y
);
assign y = a &b;
endmodule
