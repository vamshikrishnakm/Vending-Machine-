`timescale 1ns/1ps

module vending_machine_tb;
    reg        clk;
    reg        rst;
    reg  [1:0] coin;
    wire       vend;
    wire [1:0] change;

    vending_machine dut (
        .clk(clk),
        .rst(rst),
        .coin(coin),
        .vend(vend),
        .change(change)
    );

    initial clk = 1'b0;
    always #5 clk = ~clk;

    initial begin
        rst = 1'b1;
        coin = 2'd0;
        #12;
        rst = 1'b0;

        @(posedge clk);
        coin <= 2'd1;
        @(posedge clk);
        coin <= 2'd1;
        @(posedge clk);
        coin <= 2'd0;

        @(posedge clk);
        coin <= 2'd2;
        @(posedge clk);
        coin <= 2'd0;

        #20;
        $finish;
    end
endmodule
