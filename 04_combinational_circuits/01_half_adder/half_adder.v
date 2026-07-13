//==============================================================================
// Module Name : half_adder
// Description :
// -----------------------------------------------------------------------------
// Behavioral model of a Half Adder using Verilog HDL.
//
// A Half Adder is a fundamental combinational logic circuit that performs the
// addition of two single-bit binary inputs. It produces two outputs:
//
//      Sum   = A ^ B
//      Carry = A & B
//
// The Sum output represents the least significant bit (LSB) of the addition,
// while the Carry output indicates an overflow to the next higher bit.
//
// This Verilog model represents the functional behavior of a Half Adder for
// simulation, verification, and educational purposes. It models only the
// logical behavior and does not include propagation delay or timing effects.
//
// Truth Table:
//
//      A   B | Sum Carry
//     -------|-----------
//      0   0 |  0     0
//      0   1 |  1     0
//      1   0 |  1     0
//      1   1 |  0     1
//
// Author : Padma Charan S S
// Repository : Verilog Fundamentals
//==============================================================================


module half_adder(
    input wire a , b,
    output wire sum , carry 
);

assign sum = a ^ b;
assign carry = a & b;

endmodule 