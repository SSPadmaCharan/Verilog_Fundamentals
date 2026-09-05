module d_ff(input d,input clk,output reg q,output reg q_bar);

always @(posedge clk ) begin

    case (d)
       1'b0 : begin
        q=0;
        q_bar=1;
       end 

       1'b1 : begin
        q=1;
        q_bar=0;
       end
        default: begin q=d; q_bar=~d; end

    endcase
    
end

endmodule
