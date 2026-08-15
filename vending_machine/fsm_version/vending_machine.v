`timescale 1ns/1ps

module vending_machine (
    input  wire       clk,
    input  wire       rst,
    input  wire [1:0] coin,
    output reg        vend,
    output reg  [1:0] change
);
    localparam IDLE  = 2'd0;
    localparam ONE   = 2'd1;
    localparam VEND  = 2'd2;

    reg [1:0] state;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state   <= IDLE;
            vend    <= 1'b0;
            change  <= 2'd0;
        end else begin
            vend   <= 1'b0;
            change <= 2'd0;

            case (state)
                IDLE: begin
                    if (coin == 2'd1) state <= ONE;
                    else if (coin == 2'd2) begin
                        state  <= VEND;
                        vend   <= 1'b1;
                        change <= 2'd0;
                    end
                end

                ONE: begin
                    if (coin == 2'd1) begin
                        state  <= VEND;
                        vend   <= 1'b1;
                        change <= 2'd0;
                    end else if (coin == 2'd2) begin
                        state  <= VEND;
                        vend   <= 1'b1;
                        change <= 2'd1;
                    end
                end

                VEND: begin
                    state <= IDLE;
                end

                default: state <= IDLE;
            endcase
        end
    end
endmodule
