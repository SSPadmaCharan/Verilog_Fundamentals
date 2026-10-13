module siso(
    input s_i,
    input clk,

    output s_o
);

wire [3:0]q;
       d_ff dff1(

    .d(s_i),
    .clk(clk),
    .q(q[0])
);

genvar i;
generate
    for (i=1;i<4;i=i+1) begin : d_ff_gen
   

       d_ff dff2(

    .d(q[i-1]),
    .clk(clk),
    .q(q[i])
);

    
 end

endgenerate

assign s_o=q[3];
 
endmodule 





