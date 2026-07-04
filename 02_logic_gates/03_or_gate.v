//==============================================================
// Project    : OR Gate using Verilog
// Description: Implements a 2-input OR gate.
//
// An OR gate has two inputs and one output.
// The output becomes HIGH (1) if AT LEAST ONE input is HIGH (1).
// The output becomes LOW (0) only when BOTH inputs are LOW (0).
//
// Boolean Expression:
//      y = a | b
//
// Truth Table:
//      a | b | y
//     -----------
//      0 | 0 | 0
//      0 | 1 | 1
//      1 | 0 | 1
//      1 | 1 | 1
//
// '|' is the Verilog OR operator.
//
//==============================================================
module or_gate (
 input a,
 input b,
 output y

);
assign y = a|b;
endmodule
