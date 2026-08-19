`timescale 1ns/1ps

module vending_machine_tb;

  reg [4:0] money;
  reg [4:0] extra_money;
  reg [1:0] select_product;
  reg clk, rst;

  wire newspaper, chocolate, coke;
  wire [4:0] balance;

  // Instantiate DUT (Device Under Test)
  vending_machine uut (
    .newspaper(newspaper),
    .chocolate(chocolate),
    .coke(coke),
    .balance(balance),
    .money(money),
    .select_product(select_product),
    .extra_money(extra_money),
    .clk(clk),
    .rst(rst)
  );

  // Clock generation
  always #5 clk = ~clk;  // 10 ns period

  initial begin
    // Initialize signals
    clk = 0; rst = 1;
    money = 0; extra_money = 0; select_product = 0;

    // Reset pulse
    #10 rst = 0;

    // Test 1: Buy newspaper with Rs.5
    #10 money = 5; extra_money = 0; select_product = 2'b01;

    // Test 2: Buy chocolate with Rs.10
    #20 money = 10; extra_money = 0; select_product = 2'b10;

    // Test 3: Try chocolate with Rs.5 + Rs.5 extra
    #30 money = 5; extra_money = 5; select_product = 2'b10;

    // Test 4: Buy coke with Rs.10 + Rs.5 extra
    #40 money = 10; extra_money = 5; select_product = 2'b11;

    // Test 5: Buy coke with Rs.20
    #50 money = 20; extra_money = 0; select_product = 2'b11;

    // End simulation
    #100 $finish;
  end

endmodule
