
//==============================================================
// Project    : NAND Gate using Verilog
// Description: Implements a 2-input NAND gate.
//
// A NAND gate has two inputs and one output.
// The output becomes LOW (0) only when BOTH inputs are HIGH (1).
// Otherwise, the output remains HIGH (1).
//
// Boolean Expression:
//      y = ~(a & b)
//
// Truth Table:
//      a | b | y
//     -----------
//      0 | 0 | 1
//      0 | 1 | 1
//      1 | 0 | 1
//      1 | 1 | 0
//
// '&' is the Verilog AND operator.
// '~' is the Verilog NOT operator.
// Together, '~(a & b)' performs the NAND operation.
//
//==============================================================
module nand_gate (
    input a,
    input b,
    output y
);
assign y = ~(a & b);
endmodule
