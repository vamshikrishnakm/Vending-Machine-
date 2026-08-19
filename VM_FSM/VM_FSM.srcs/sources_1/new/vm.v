// module and ports declaration
module vending_machine(
    output reg newspaper, chocolate, coke,
    output reg [4:0] balance,
    input [4:0] money,
    input [1:0] select_product,
    input [4:0] extra_money,
    input clk, rst
);

reg [2:0] p_state, n_state; // declaring present and next states

// money inserted in vending machine
parameter [4:0] money_5 = 5'd5;
parameter [4:0] money_10 = 5'd10;
parameter [4:0] money_20 = 5'd20;

// selecting product from vending machine
parameter [1:0] select_newspaper = 2'b01;
parameter [1:0] select_chocolate = 2'b10;
parameter [1:0] select_coke = 2'b11;

// declaring all the states in the machine
parameter [2:0] S_NULL = 3'b000;
parameter [2:0] S_FIVE = 3'b001;
parameter [2:0] S_TEN = 3'b010;
parameter [2:0] S_FIFTEEN = 3'b011;

// Initial Block for the Present State and the Next State
always @(posedge clk) begin
    if (rst == 1) begin
        p_state <= S_NULL;
    end else begin
        p_state <= n_state;
    end
end

// code for determining the next state in vending machine
always @(*) begin
    n_state = p_state; // Default next state assignment to prevent latches
    case (p_state)
        // Next State after S_NULL State
        S_NULL: begin
            if (money == money_5 && select_product == select_newspaper) begin
                n_state = S_FIVE;
            end else if (money == money_5 && select_product == select_chocolate) begin
                n_state = S_TEN;
            end else if (money == money_5 && select_product == select_coke) begin
                n_state = S_FIFTEEN;
            end else if (money == money_10 && select_product == select_newspaper) begin
                n_state = S_FIVE;
            end else if (money == money_10 && select_product == select_chocolate) begin
                n_state = S_TEN;
            end else if (money == money_10 && select_product == select_coke) begin
                n_state = S_FIFTEEN;
            end else if (money == money_20 && select_product == select_newspaper) begin
                n_state = S_FIVE;
            end else if (money == money_20 && select_product == select_chocolate) begin
                n_state = S_TEN;
            end else if (money == money_20 && select_product == select_coke) begin
                n_state = S_FIFTEEN;
            end
        end

        // Next State after S_FIVE State
        S_FIVE: begin
            if (money == money_5 && select_product == select_newspaper) begin
                n_state = S_FIVE;
            end else if (money == money_5 && select_product == select_chocolate) begin
                n_state = S_TEN;
            end else if (money == money_5 && select_product == select_coke) begin
                n_state = S_FIFTEEN;
            end else if (money == money_10 && select_product == select_newspaper) begin
                n_state = S_FIVE;
            end else if (money == money_10 && select_product == select_chocolate) begin
                n_state = S_TEN;
            end else if (money == money_10 && select_product == select_coke) begin
                n_state = S_FIFTEEN;
            end else if (money == money_20 && select_product == select_newspaper) begin
                n_state = S_FIVE;
            end else if (money == money_20 && select_product == select_chocolate) begin
                n_state = S_TEN;
            end else if (money == money_20 && select_product == select_coke) begin
                n_state = S_FIFTEEN;
            end
        end

        // Next State after S_TEN State
        S_TEN: begin
            if (money == money_5 && select_product == select_newspaper) begin
                n_state = S_FIVE;
            end else if (money == money_5 && select_product == select_chocolate) begin
                n_state = S_TEN;
            end else if (money == money_5 && select_product == select_coke) begin
                n_state = S_FIFTEEN;
            end else if (money == money_10 && select_product == select_newspaper) begin
                n_state = S_FIVE;
            end else if (money == money_10 && select_product == select_chocolate) begin
                n_state = S_TEN;
            end else if (money == money_10 && select_product == select_coke) begin
                n_state = S_FIFTEEN;
            end else if (money == money_20 && select_product == select_newspaper) begin
                n_state = S_FIVE;
            end else if (money == money_20 && select_product == select_chocolate) begin
                n_state = S_TEN;
            end else if (money == money_20 && select_product == select_coke) begin
                n_state = S_FIFTEEN;
            end
        end

        // Next State after S_FIFTEEN State
        S_FIFTEEN: begin
            if (money == money_5 && select_product == select_newspaper) begin
                n_state = S_FIVE;
            end else if (money == money_5 && select_product == select_chocolate) begin
                n_state = S_TEN;
            end else if (money == money_5 && select_product == select_coke) begin
                n_state = S_FIFTEEN;
            end else if (money == money_10 && select_product == select_newspaper) begin
                n_state = S_FIVE;
            end else if (money == money_10 && select_product == select_chocolate) begin
                n_state = S_TEN;
            end else if (money == money_10 && select_product == select_coke) begin
                n_state = S_FIFTEEN;
            end else if (money == money_20 && select_product == select_newspaper) begin
                n_state = S_FIVE;
            end else if (money == money_20 && select_product == select_chocolate) begin
                n_state = S_TEN;
            end else if (money == money_20 && select_product == select_coke) begin
                n_state = S_FIFTEEN;
            end
        end

        // Default state
        default: n_state = S_NULL;
    endcase
end

// code for generating the output in vending machine
always @(posedge clk) begin
    case (n_state)
        // Output Code block for S_NULL State
        S_NULL: begin
            newspaper <= 1'b0;
            chocolate <= 1'b0;
            coke      <= 1'b0;
            balance   <= money;
            $display("You have entered no money, Here is your balance %d", money);
        end

        // Output Code block for S_FIVE State
        S_FIVE: begin
            if (money == money_5) begin
                newspaper <= 1'b1;
                chocolate <= 1'b0;
                coke      <= 1'b0;
                balance   <= 5'd0;
                $display("Your newspaper will be delivered soon! Thanks for purchasing with us with Amount of %d, Here is your balance %d", money, 5'd0);
            end else if (money == money_10) begin
                newspaper <= 1'b1;
                chocolate <= 1'b0;
                coke      <= 1'b0;
                balance   <= 5'd5;
                $display("Your newspaper will be delivered soon! Thanks for purchasing with us with Amount of %d, Here is your balance %d", money, 5'd5);
            end else if (money == money_20) begin
                newspaper <= 1'b1;
                chocolate <= 1'b0;
                coke      <= 1'b0;
                balance   <= 5'd15;
                $display("Your newspaper will be delivered soon! Thanks for purchasing with us with Amount of %d, Here is your balance %d", money, 5'd15);
            end
        end

        // Output Code block for S_TEN State
        S_TEN: begin
            if (money == money_5) begin
                newspaper <= 1'b0;
                chocolate <= 1'b0;
                coke      <= 1'b0;
                $display("if you want to buy a chocolate Rs.5 is not sufficient! please enter extra Rs.5");

                if (extra_money == money_5) begin
                    newspaper <= 1'b0;
                    chocolate <= 1'b1;
                    coke      <= 1'b0;
                    balance   <= 5'd0;
                    $display("Your chocolate will be delivered soon! Thanks for purchasing with us with Amount of %d, Here is your balance %d", money + extra_money, 5'd0);
                end else begin
                    balance   <= 5'd5;
                    $display("Sorry, you won't get a chocolate for Rs.5,Here is your balance %d", 5'd5);
                end
            end else if (money == money_10) begin
                newspaper <= 1'b0;
                chocolate <= 1'b1;
                coke      <= 1'b0;
                balance   <= 5'd0;
                $display("Your chocolate will be delivered soon! Thanks for purchasing with us with Amount of %d, Here is your balance %d", money, 5'd0);
            end else if (money == money_20) begin
                newspaper <= 1'b0;
                chocolate <= 1'b1;
                coke      <= 1'b0;
                balance   <= 5'd10;
                $display("Your chocolate will be delivered soon! Thanks for purchasing with us with Amount of %d, Here is your balance %d", money, 5'd10);
            end
        end

        // Output Code block for S_FIFTEEN State
        S_FIFTEEN: begin
            if (money == money_5) begin
                newspaper <= 1'b0;
                chocolate <= 1'b0;
                coke      <= 1'b0;
                $display("if you want to buy a coke Rs.5 is not sufficient! please enter extra Rs.10");

                if (extra_money == money_10) begin
                    newspaper <= 1'b0;
                    chocolate <= 1'b0;
                    coke      <= 1'b1;
                    balance   <= 5'd0;
                    $display("Your coke will be delivered soon! Thanks for purchasing with us with Amount of %d, Here is your balance %d", money + extra_money, 5'd0);
                end else begin
                    balance   <= 5'd5;
                    $display("Sorry, you won't get a coke for Rs.5 Here is your balance %d", 5'd5);
                end
            end else if (money == money_10) begin
                newspaper <= 1'b0;
                chocolate <= 1'b0;
                coke      <= 1'b0;
                $display("if you want to buy a coke Rs.10 is not sufficient! please enter extra Rs.5");

                if (extra_money == money_5) begin
                    newspaper <= 1'b0;
                    chocolate <= 1'b0;
                    coke      <= 1'b1;
                    balance   <= 5'd0;
                    $display("Your coke will be delivered soon! Thanks for purchasing with us with Amount of %d, Here is your balance %d", money + extra_money, 5'd0);
                end else begin
                    balance   <= 5'd10;
                    $display("Sorry, you won't get a coke for Rs.10,Here is your balance %d", 5'd10);
                end
            end else if (money == money_20) begin
                newspaper <= 1'b0;
                chocolate <= 1'b0;
                coke      <= 1'b1;
                balance   <= 5'd5;
                $display("Your coke will be delivered soon! Thanks for purchasing with us with Amount of %d, Here is your balance %d", money, 5'd5);
            end
        end

        // Default case
        default: begin
            newspaper <= 1'b0;
            chocolate <= 1'b0;
            coke      <= 1'b0;
            balance   <= 5'b0;
            $display("You have entered no money, Here is your balance %d", 5'b0);
        end
    endcase
end

endmodule