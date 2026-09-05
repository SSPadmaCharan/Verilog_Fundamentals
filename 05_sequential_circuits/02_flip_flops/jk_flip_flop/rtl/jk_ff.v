module jk_ff(input j,k,clk, output reg q,output reg q_bar);

always @(posedge clk ) begin

    case ({j,k})
        2'b00:;
        2'b01: begin q<=0;q_bar<=1; end
        2'b10 : begin q<=1;q_bar<=0; end 
        2'b11 : begin q<=~q;q_bar<=~q_bar; end 
        default:
        begin q<=0;q_bar<=0; end  
    endcase
    
end

endmodule 
