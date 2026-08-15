module parity_gen(
    input wire [3:0]b,
    output wire p
);

assign p = ^b;

endmodule

