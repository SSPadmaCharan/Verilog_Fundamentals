//============================================================
// Module Name         : multiple_wire
// Author              : Padma Charan S S
// Repository          : Verilog_Fundamentals
// Folder              : 01_basic_syntax
//
// Description:
// Demonstrates multiple wire connections using continuous
// assignments. A single input signal can drive more than one
// output signal.
//
// Functional Equations:
// x = a
// y = b
// w = b
// z = c
//
// Circuit:
//
//   a -------------------------> x
//
//   b -----------+-------------> y
//                |
//                +-------------> w
//
//   c -------------------------> z
//
// Inputs:
// a : 1-bit input signal
// b : 1-bit input signal
// c : 1-bit input signal
//
// Outputs:
// x : 1-bit output signal
// y : 1-bit output signal
// w : 1-bit output signal
// z : 1-bit output signal
//
// Synthesizable:
// Yes
//============================================================


module multiple_wire(
    input a,b,c,
    output x,y,w,z
);
assign x=a;
assign y=b;
assign w=b;
assign z=c;
endmodule
