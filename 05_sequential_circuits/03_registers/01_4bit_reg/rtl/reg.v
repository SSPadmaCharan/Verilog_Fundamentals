module reg_4(
    input [3:0]d,
    input clk,
    input en,

    output [3:0]q


);

wire d_0,d_1,d_2,d_3;


assign d_0 = en ? d[0] : q[0];

d_ff ff0(
.d(d_0),
.clk(clk),
.q(q[0])
);

assign d_1 = en ? d[1] : q[1];

d_ff ff1(
    .d(d_1),
    .clk(clk),
    .q(q[1])
);

assign d_2 = en ? d[2] : q[2];

d_ff ff2(
    .d(d_2),
    .clk(clk),
    .q(q[2])
);

assign d_3 = en ? d[3] : q[3];

d_ff ff3(
    .d(d_3),
    .clk(clk),
    .q(q[3])
);



endmodule

