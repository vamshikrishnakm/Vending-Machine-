# Usage Notes

## Project Layout
- `simplified_version/`: Balance-based vending machine starter implementation.
- `fsm_version/`: FSM-based vending machine starter implementation.
- `docs/`: Supporting notes and waveform placeholders.

## How to Use
1. Pick either `simplified_version` or `fsm_version`.
2. Simulate with your Verilog simulator (example with Icarus Verilog):
   - `iverilog -o simv vending_machine.v vending_machine_tb.v`
   - `vvp simv`
3. Extend module behavior (pricing, multi-product logic, coin return) as needed.

## Waveforms
Placeholder files are included:
- `waveform_simplified.png`
- `waveform_fsm.png`

Replace these placeholders with real waveform captures from your simulator.
