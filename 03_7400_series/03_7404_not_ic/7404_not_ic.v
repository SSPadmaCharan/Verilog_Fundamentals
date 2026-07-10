//==============================================================================
// Module Name : ic_7404
// Description :
// -----------------------------------------------------------------------------
// Behavioral model of the 7404 Hex Inverter Integrated Circuit.
//
// The 7404 is a member of the 74xx TTL logic family and contains six
// independent NOT (Inverter) gates integrated within a single 14-pin package.
//
// Each inverter performs the logical operation:
//
//      Y = ~A
//
// This Verilog model represents the functional behavior of the IC for
// simulation, verification, and educational purposes. It models the logical
// operation of each inverter and does not include electrical characteristics
// such as propagation delay, power consumption, fan-out limitations, or timing
// constraints.
//
// Truth Table:
//
//      A | Y
//     ----|---
//      0 | 1
//      1 | 0
//
// Author : Padma Charan S S
// Repository : Verilog Fundamentals
//==============================================================================

module ic_7404(
    input wire a1,a2,a3,a4,a5,a6,
    output wire y1,y2,y3,y4,y5,y6
);

assign y1 = ~a1;
assign y2 = ~a2;
assign y3 = ~a3;
assign y4 = ~a4;
assign y5 = ~a5;
assign y6 = ~a6;

endmodule
