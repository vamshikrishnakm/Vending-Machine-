`timescale 1ns/1ps

module vending_machine (
    input  wire       clk,
    input  wire       rst,
    input  wire [1:0] coin,
    output reg        vend,
    output reg  [1:0] change
);
    reg [2:0] balance;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            balance <= 3'd0;
            vend    <= 1'b0;
            change  <= 2'd0;
        end else begin
            vend   <= 1'b0;
            change <= 2'd0;

            case (coin)
                2'd1: balance <= balance + 3'd1;
                2'd2: balance <= balance + 3'd2;
                default: balance <= balance;
            endcase

            if (balance + coin >= 3'd2) begin
                vend    <= 1'b1;
                change  <= (balance + coin) - 3'd2;
                balance <= 3'd0;
            end
        end
    end
endmodule
