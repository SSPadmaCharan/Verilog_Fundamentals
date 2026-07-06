module multiple_wire(
    input wire a,
    input wire b,

    output wire x,
    output wire y,
    output wire z
);

assign x = a;
assign y = b;
assign z = a;

endmodule
