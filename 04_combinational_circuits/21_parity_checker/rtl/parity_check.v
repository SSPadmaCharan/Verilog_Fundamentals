module parity_check(
    input wire [3:0]b,
    input wire p,
    output error
);

assign error=^({p,b});

endmodule
