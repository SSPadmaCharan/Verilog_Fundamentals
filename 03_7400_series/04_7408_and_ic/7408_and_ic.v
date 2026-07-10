//==============================================================================
// Module Name : ic_7408
// Description :
// -----------------------------------------------------------------------------
// Behavioral model of the 7408 Quad 2-Input AND Gate Integrated Circuit.
//
// The 7408 is a member of the 74xx TTL logic family and contains four
// independent 2-input AND gates integrated within a single 14-pin package.
//
// Each AND gate performs the logical operation:
//
//      Y = A & B
//
// This Verilog model represents the functional behavior of the IC for
// simulation, verification, and educational purposes. It models the logical
// operation of each gate and does not include electrical characteristics such
// as propagation delay, power consumption, fan-out limitations, or timing
// constraints.
//
// Truth Table:
//
//      A   B | Y
//     -------|---
//      0   0 | 0
//      0   1 | 0
//      1   0 | 0
//      1   1 | 1
//
// Author : Padma Charan S S
// Repository : Verilog Fundamentals
//==============================================================================

module ic_7408(
 //-------------------------------------------------------------------------
// Gate 1 Inputs and Output
//-------------------------------------------------------------------------
input a1,
input  b1,

output y1,
 //-------------------------------------------------------------------------
// Gate 2 Inputs and Output
//-------------------------------------------------------------------------
input a2,
input b2,

output y2,
//-------------------------------------------------------------------------
// Gate 3 Inputs and Output
//-------------------------------------------------------------------------
input a3,
input b3,

output y3,
 //-------------------------------------------------------------------------
// Gate 4 Inputs and Output
//-------------------------------------------------------------------------
input a4,
input b4,

output y4
);





assign y1 = a1 & b1;
assign y2 = a2 & b2;
assign y3 = a3 & b3;
assign y4 = a4 & b4;

endmodule
