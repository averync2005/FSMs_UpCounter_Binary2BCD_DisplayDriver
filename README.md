# FSM-Up-Counter-and-Multi-Digit-Display-in-Verilog

This project implements multiple sequential digital systems in Verilog, including finite state machines (FSMs), a 12-bit up counter, a binary-to-BCD converter, and an integrated multi-digit seven-segment display driver. The goal is to design, simulate, and test these modules to demonstrate how FSMs, counters, and display logic interact to form complete sequential systems on an FPGA. The project includes all Verilog design files, testbenches, and FPGA constraint files for simulation, synthesis, and hardware implementation.

---

## Files

- `moore_1100.v` – 4-bit (1100) sequence detector using Moore FSM  
- `moore_1100_tb.v` – Testbench for the Moore FSM  
- `mealy_1101.v` – 4-bit (1101) sequence detector using Mealy FSM  
- `mealy_1101_tb.v` – Testbench for the Mealy FSM  
- `up_counter_12bit.v` – 12-bit up counter (0–4095 rollover)  
- `up_counter_12bit_tb.v` – Testbench for the up counter  
- `bin_to_bcd.v` – Binary-to-BCD converter using the Double Dabble algorithm  
- `bin_to_bcd_tb.v` – Testbench for the binary-to-BCD converter  
- `top_lab7.v` – Integrated top-level design combining the counter, converter, and multi-digit seven-segment display  
- `top_lab7_tb.v` – Testbench for the top-level integrated design  
- `clock_divider.v` – Clock divider for display refresh control  
- `debouncer.v` – Switch debouncer for stable input handling  

---

## Simulation

1. Download all Verilog source and testbench files from this repository.  
2. Open the project in **Vivado** and add all design files.  
3. Run **behavioral simulations** for each module:  
   - The Moore FSM (`moore_1100_tb.v`) detects the 1100 sequence with a one-cycle output delay.  
   - The Mealy FSM (`mealy_1101_tb.v`) detects the 1101 sequence immediately when complete.  
   - The 12-bit up counter (`up_counter_12bit_tb.v`) correctly counts from 0 to 4095 and resets on rollover or reset signal.  
   - The binary-to-BCD converter (`bin_to_bcd_tb.v`) verifies Double Dabble conversion for multiple binary inputs.  
4. Observe the simulation waveforms and confirm correct state transitions, output timing, and BCD conversions.  

---

## FPGA Deployment

1. Connect your **Basys3 FPGA board** and power it on.  
2. Open the project in **Vivado**, synthesize and implement the top-level design (`top_lab7.v`).  
3. Generate the bitstream and program the FPGA using the provided `.xdc` constraint file.  
4. The FPGA board will display the counter output on the **multi-digit seven-segment display**, automatically refreshing each digit using multiplexed scanning.  
5. Reset and sequence inputs can be verified through switch toggling and observed on the board.  

---

## Description

This project combines the following key modules:  
- **Moore and Mealy FSMs** for sequence detection and output timing comparison.  
- **12-bit Up Counter** that increments on each clock cycle up to 4095.  
- **Binary-to-BCD Converter** implementing the Double Dabble algorithm for numerical display.  
- **Multi-Digit Seven-Segment Display Driver** (from Lab 5) for visual output of the counter’s BCD digits.  

These components were integrated and tested both in simulation and on the FPGA, demonstrating synchronization between sequential logic, timing control, and display output.

---

## Verification

- **Moore FSM:** Detected “1100” pattern with a one-clock delay on output.  
- **Mealy FSM:** Detected “1101” pattern with immediate output response.  
- **Up Counter:** Confirmed rollover and reset functionality.  
- **Binary-to-BCD Converter:** Verified correctness for multiple binary inputs (e.g., 010010110100 → 1204).  
- **Top Module:** Successfully displayed incrementing counter values on the FPGA’s seven-segment display.  

---

## FPGA Demonstration

A live demonstration was performed for the TA showing:  
- Proper FSM sequence detection.  
- Counter increment and rollover behavior.  
- Real-time BCD display on all four seven-segment digits.  

---

## Team Contributions

**Colin Sawyer**  
- Worked on the lab report.  
- Assisted with creating the design and simulation files in Verilog for all lab components.  
- Helped set up and test the FPGA board during programming and verification.  
- Supported Vivado troubleshooting and synthesis.  

**Avery Nudell-Cook**  
- Worked on the lab report.  
- Created and simulated the design, testbench, and constraint files in Verilog for all components.  
- Ran simulations, recorded waveforms, and uploaded all code to GitHub.  
- Wrote the final README.md.  
