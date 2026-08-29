`timescale 1ns/1ps

module sr_latch(
    input enable,
    input s_n,
    input r_n,

    output reg q,
    output reg q_bar
);

always @(*) begin

    if (enable) begin

        case ({s_n, r_n})

            2'b00: begin
                // HOLD
                // No assignment → retain previous state
            end

            2'b01: begin
                // RESET
                q     = 1'b0;
                q_bar = 1'b1;
            end

            2'b10: begin
                // SET
                q     = 1'b1;
                q_bar = 1'b0;
            end

            2'b11: begin
                // INVALID / FORBIDDEN
                q     = 1'bx;
                q_bar = 1'bx;
            end

            default: begin
                q     = 1'bx;
                q_bar = 1'bx;
            end

        endcase

    end

    else begin
        // ENABLE = 0 → HOLD
        // No assignment → retain previous state
    end

end

endmodule