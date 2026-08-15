# FSM Version

This folder contains a finite state machine (FSM)-based vending machine starter implementation.

## Files
- `vending_machine.v`: FSM-based starter with states for idle, partial credit, and vend.
- `vending_machine_tb.v`: Basic simulation testbench covering sample transitions.

## Run Simulation (Icarus Verilog)
```bash
iverilog -o simv vending_machine.v vending_machine_tb.v
vvp simv
```
