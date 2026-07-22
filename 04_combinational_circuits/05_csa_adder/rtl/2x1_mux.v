module mux #(
   parameter WIDTH=1
) 
(

    input [WIDTH-1:0]a,
    input [WIDTH-1:0]b,
    input sel,

    output reg [WIDTH-1:0]y
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
