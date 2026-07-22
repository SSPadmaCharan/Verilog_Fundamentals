module bcd_adder 
(
    input wire [3:0]a,
    input wire [3:0]b,
    input wire c_in,

    output wire [3:0]s,
    output wire c_out
);
wire [3:0]s1;
wire [3:0]s2;
wire c1;
wire c2;
wire adj ;





adder BA1(

    .a(a),
    .b(b),
    .c_in(c_in),

    .s(s1),
    .c_out(c1)
);
 assign adj = (s1>4'd9) || c1;

  adder BA2(
    .a(s1),
    .b(4'b0110),
    .c_in(1'b0),

    .s(s2),
    .c_out(c2)
  );
    
assign s = adj? s2 : s1;
assign c_out = adj? c2 :c1;

endmodule 