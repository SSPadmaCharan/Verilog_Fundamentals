module siso(
    input [3:0]s_i,
    input clk,

    output [3:0]s_o
);

wire [3:0]q;

genvar 
generate
    for (i=0;i<4;i=i+1) begin
        d_ff dff1(

    .d(s_i[i]),
    .clk(clk),
    .q(q[0])
);

       d_ff dff2(

    .d(q[0]),
    .clk(clk),
    .q(q[1])
);

       d_ff dff3(

    .d(q[1]),
    .clk(clk),
    .q(q[2])
);


       d_ff dff4(

    .d(q[2]),
    .clk(clk),
    .q(q[3])
);
 end

endgenerate

assign s_o=q;
 
endmodule 





