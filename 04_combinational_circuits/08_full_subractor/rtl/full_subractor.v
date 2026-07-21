//==============================================================================
// Module Name : full_sub
// Description :
// -----------------------------------------------------------------------------
// Structural implementation of a 1-bit Full Subtractor using Verilog HDL.
//
// A Full Subtractor is a combinational arithmetic circuit that performs the
// subtraction of two single-bit binary numbers while considering a Borrow-In
// from the previous stage.
//
// It accepts three single-bit inputs:
//
//      A      - Minuend
//      B      - Subtrahend
//      B_in   - Borrow-In
//
// and produces two outputs:
//
//      Difference
//      Borrow-Out
//
// Unlike a Half Subtractor, a Full Subtractor includes an additional Borrow-In
// input, making it suitable for performing multi-bit binary subtraction by
// cascading multiple Full Subtractor stages together.
//
// This design is implemented using a hierarchical structural modeling approach.
// Instead of directly writing the Boolean equations, the circuit is constructed
// using:
//
//      • Two Half Subtractor modules
//      • One OR gate
//
// Hardware Operation:
//
// 1. The first Half Subtractor subtracts B from A and produces:
//
//        • Intermediate Difference (diff1)
//        • Intermediate Borrow (borrow1)
//
// 2. The second Half Subtractor subtracts Borrow-In from the intermediate
//    Difference and produces:
//
//        • Final Difference
//        • Intermediate Borrow (borrow2)
//
// 3. The two intermediate borrow signals are combined using an OR gate to
//    generate the final Borrow-Out.
//
// Boolean Equations:
//
//      Difference = A ^ B ^ B_in
//
//      Borrow-Out = (~A & B)
//                 | (~A & B_in)
//                 | (B & B_in)
//
// Truth Table:
//
//      A  B  B_in | Difference Borrow-Out
//     ------------|-----------------------
//      0  0   0   |     0          0
//      0  0   1   |     1          1
//      0  1   0   |     1          1
//      0  1   1   |     0          1
//      1  0   0   |     1          0
//      1  0   1   |     0          0
//      1  1   0   |     0          0
//      1  1   1   |     1          1
//
// This structural implementation demonstrates hierarchical RTL design by
// building a complex arithmetic circuit from reusable Half Subtractor modules.
// Such modular design improves readability, reusability, maintainability, and
// closely resembles the hardware implementation used in practical digital
// systems.
//
// New Concepts Introduced:
//
//      • Full Binary Subtraction
//      • Hierarchical Structural Modeling
//      • Module Instantiation
//      • Named Port Mapping
//      • Borrow Propagation
//      • Module Reusability
//
// Applications:
//
//      • Arithmetic Logic Units (ALUs)
//      • Ripple Borrow Subtractors
//      • Binary Arithmetic Circuits
//      • FPGA Designs
//      • ASIC Designs
//      • Computer Architecture
//      • Educational Digital Electronics
//
// Author      : Padma Charan S S
// Repository  : Verilog Fundamentals
// Project     : 05 - Full Subtractor
//==============================================================================

module full_sub (
    input wire a,b,b_in,
    output wire d,b_out
);

wire d1;
wire b1;
wire b2;


half_sub HS1(
    .a(a),
    .b(b),

    .d(d1),
    .bo(b1)
);

half_sub HS2(

    .a(d1),
    .b(b_in),

    .d(d),
    .bo(b2)
);

assign b_out = b1 | b2;

endmodule
