//==============================================================================
// Module Name : mux_4x1
// Description :
// A 4×1 Multiplexer implemented using behavioral modeling in Verilog.
//
// The module selects one of four 1-bit input signals based on the value of the
// 2-bit select signal. The selected input is routed to the output using an
// `always @(*)` block and a `case` statement, providing a clean and scalable
// implementation of combinational selection logic.
//
// Inputs:
//   - i[3:0] : Four 1-bit data inputs.
//   - s[1:0] : Two select lines used to choose one input.
//
// Output:
//   - y : Selected data output.
//
// Verilog Concepts:
//   - always @(*)
//   - Procedural Assignments
//   - case Statement
//   - default Case
//   - reg vs wire
//
// Applications:
//   - CPU Datapath Design
//   - ALU Operand Selection
//   - Bus Switching
//   - Memory Address Selection
//   - FPGA and ASIC Designs
//============================================================================== 

module mux_4x1 (

    input wire [3:0]i,
    input wire [1:0]s,
    output reg y
);

always @(*) 
begin

    case (s)
        
        2'b00 : y = i[0];
        2'b01 : y = i[1];
        2'b10 : y = i[2];
        2'b11 : y = i[3];
        
     default:
        y = 0; 


    endcase
    
end

endmodule
