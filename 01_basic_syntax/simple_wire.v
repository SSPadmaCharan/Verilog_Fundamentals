
// Module Name : simple_wire
// Author      : Padma Charan S S
// Repository  : Verilog_Fundamentals
// Folder      : 01_basic_syntax
//
// Description:
// A simple wire connection.
// The output continuously follows the input.
//
// Function:
// out = in
//
// Inputs:
// in  - 1-bit input signal
//
// Outputs:
// out - 1-bit output signal
//


module simple_wire(
    input in,
    output out
);

assign out = in;

endmodule