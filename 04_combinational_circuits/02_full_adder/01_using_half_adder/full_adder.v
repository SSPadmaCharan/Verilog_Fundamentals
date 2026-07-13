module full_adder(
    input wire a , b , c_in,
    output wire c_out, f_sum
);

wire carry1;
wire carry2;
wire sum1;

half_adder HA1(
    .a(a),
    .b(b),

    .carry(carry1),
    .sum(sum1)
);

half_adder HA2(
    .a(sum1),
    .b(c_in),

    .carry(carry2),
    .sum(f_sum)
);

assign c_out = carry1 | carry2;

endmodule