
//==============================================================
// Project    : NOR Gate using Verilog
// Description: Implements a 2-input NOR gate.
//
// A NOR gate has two inputs and one output.
// The output becomes HIGH (1) only when BOTH inputs are LOW (0).
// If any one or both inputs are HIGH (1), the output becomes LOW (0).
//
// Boolean Expression:
//      y = ~(a | b)
//
// Truth Table:
//      a | b | y
//     -----------
//      0 | 0 | 1
//      0 | 1 | 0
//      1 | 0 | 0
//      1 | 1 | 0
//
// '|' is the Verilog OR operator.
// '~' is the Verilog NOT operator.
// Together, '~(a | b)' performs the NOR operation.
//
//==============================================================
module nor_gate(
 input a,
 input b,
 output y
);
assign y = ~(a|b); //or it could be wrritten as ~a&~b
endmodule
