module d_latch (en,d,q,q_bar);

input en;
input d;
output reg q;
output reg q_bar;

always @(*) begin
    if(en)
    begin
        case (d)
           1'b0 : begin
            q=0;
            q_bar=1;
           end
           1'b1 : begin
            q=1;
            q_bar=0;

           end
            default: 

            begin
                q=1'bx;
                q_bar=1'bx;
            end
        endcase
    end
    else
    begin
        //hold
    end
    
end

endmodule

