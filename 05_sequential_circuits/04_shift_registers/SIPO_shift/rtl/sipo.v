module sipo (
    input s_i,
    input clk,
    output [3:0]p_o
);
wire [3:0]q;


d_ff p_0(
    .d(s_i),
    .clk(clk),
    .q(q[0])

);

d_ff p_1(
    .d(q[0]),
    .clk(clk),
    .q(q[1])

);

d_ff p_2(
    .d(q[1]),
    .clk(clk),
    .q(q[2])

);

d_ff p_3(
    .d(q[2]),
    .clk(clk),
    .q(q[3])

);

assign p_o=q;

endmodule

