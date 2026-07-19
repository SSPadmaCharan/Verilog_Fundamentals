module half_sub(
    input wire a,b,
    output wire d,bo
);

assign d = a ^ b;
assign bo = ~a & b;

endmodule 
