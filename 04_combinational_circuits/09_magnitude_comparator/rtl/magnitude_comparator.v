module mag_comp (

    input wire [1:0]a,
    input wire [1:0]b,
    output wire gt,les,eq

);
    
    wire xnor_;
    assign xnor_ = ~(a[1] ^ b[1]);
    assign gt = (a[1] & ~b[1]) | (xnor_ & (a[0]&~b[0]));
    assign les = (~a[1] & b[1]) | (xnor_ & (~a[0]&b[0]));
    assign eq = xnor_ & ~(a[0]^b[0]);

endmodule
