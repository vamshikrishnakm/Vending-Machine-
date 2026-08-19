module vending_machine(
    output reg newspaper, chocolate, coke,
    output reg [4:0] balance,
    input [4:0] money,
    input [1:0] select_product,
    input [4:0] extra_money,
    input clk, rst
);

parameter [4:0] price_newspaper = 5;
parameter [4:0] price_chocolate = 10;
parameter [4:0] price_coke = 15;

parameter [1:0] select_newspaper = 2'b01;
parameter [1:0] select_chocolate = 2'b10;
parameter [1:0] select_coke      = 2'b11;

wire [4:0] total_money;
assign total_money = money + extra_money;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        newspaper <= 0;
        chocolate <= 0;
        coke <= 0;
        balance <= 0;
    end else begin
        // Default outputs
        newspaper <= 0;
        chocolate <= 0;
        coke <= 0;
        balance <= total_money;

        case (select_product)
            select_newspaper: begin
                if (total_money >= price_newspaper) begin
                    newspaper <= 1;
                    balance <= total_money - price_newspaper;
                    $display("Newspaper dispensed. Balance = %d", balance);
                end else begin
                    $display("Not enough money for newspaper. Balance = %d", balance);
                end
            end

            select_chocolate: begin
                if (total_money >= price_chocolate) begin
                    chocolate <= 1;
                    balance <= total_money - price_chocolate;
                    $display("Chocolate dispensed. Balance = %d", balance);
                end else begin
                    $display("Not enough money for chocolate. Balance = %d", balance);
                end
            end

            select_coke: begin
                if (total_money >= price_coke) begin
                    coke <= 1;
                    balance <= total_money - price_coke;
                    $display("Coke dispensed. Balance = %d", balance);
                end else begin
                    $display("Not enough money for coke. Balance = %d", balance);
                end
            end

            default: begin
                $display("No product selected. Balance = %d", balance);
            end
        endcase
    end
end

endmodule
