module d_ff(input d,clk, output reg q);

always @(posedge clk ) begin

    if (d) begin
        q<=1;
     end

    else 
     q<=0;

    
end 
endmodule
