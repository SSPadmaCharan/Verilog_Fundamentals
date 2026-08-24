module sr_latch(
    input enable,
    input s_n,
    input r_n,

    output q,
    output q_bar
);


wire s_n1;
wire r_n1;

assign s_n1=~(s_n&enable);
assign r_n1=~(enable&r_n);

assign q=~(s_n1&q_bar);
assign q_bar=~(r_n1&q);

endmodule

