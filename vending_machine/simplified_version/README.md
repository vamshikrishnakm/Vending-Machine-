# Simplified Version

This folder contains a straightforward vending machine implementation using a running balance register.

## Files
- `vending_machine.v`: Starter module. A vend is generated once inserted value reaches product price (2 units).
- `vending_machine_tb.v`: Basic simulation testbench with sample coin insertions.

## Run Simulation (Icarus Verilog)
```bash
iverilog -o simv vending_machine.v vending_machine_tb.v
vvp simv
```
