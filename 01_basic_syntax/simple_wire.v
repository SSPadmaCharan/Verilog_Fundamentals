//============================================================
// Module Name  : simple_wire
// Author       : Padma Charan S S
// Repository   : Verilog_Fundamentals
// Folder       : 01_basic_syntax
//
// Description:
// Connects the input signal directly to the output.
//
// Logic Equation:
// out = in
//
// Circuit:
//
//   in -------------> out
//
// Inputs:
// in  : 1-bit input signal
//
// Outputs:
// out : 1-bit output signal
//
// Synthesizable:
// Yes
//============================================================

module simple_wire(
    input in,
    output out
);

assign out = in;

endmodule