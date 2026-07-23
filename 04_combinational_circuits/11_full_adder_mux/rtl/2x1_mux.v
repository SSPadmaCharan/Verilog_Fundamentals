module mux 
(

    input a,
    input b,
    input sel,

    output reg y
);

always @(*) begin

    case (sel)
        0 : y = a;
        1 : y = b; 
        default: 
         y = 0;
    endcase
    
end
endmodule
