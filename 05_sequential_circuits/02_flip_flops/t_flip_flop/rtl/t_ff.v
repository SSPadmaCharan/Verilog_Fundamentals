module t_ff(input clk,t,output reg q , output reg q_bar);


initial begin
    q = 0;
    q_bar = 1;
end

always @(posedge clk ) begin
    case (t)
        1'b0:;
        1'b1:begin
            q<=~q;
            q_bar<=~q_bar;
        end 
        default: begin 
            q<=0;
            q_bar<=0;
        end
    endcase

end

endmodule
