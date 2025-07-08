# VHDL 4-Bit Adder

This project is a simple 4-bit binary adder implemented in VHDL. It takes two 4-bit numbers as input and produces a 5-bit sum, correctly handling the carry-out bit.

## Project Overview

The primary goal of this project is to demonstrate a fundamental digital logic component using VHDL. The design is purely combinatorial and has been verified using a self-checking testbench.

### Features
* Adds two 4-bit unsigned numbers.
* Produces a 5-bit sum to accommodate the final carry bit.
* Written in standard VHDL-2008.
* Includes a comprehensive testbench for verification.

---

## Files in This Repository

* `add.vhdl`: The VHDL source code for the 4-bit adder entity.
* `add_tb.vhdl`: The VHDL testbench used to simulate and verify the adder's functionality.
* `images/adder_waveform.svg`: The waveform output from the simulation, showing the results of the test cases.

---

## Tools Used

* **Simulator:** [GHDL](https://ghdl.github.io/ghdl/) (a VHDL simulator)
* **Waveform Viewer:** [GTKWave](http://gtkwave.sourceforge.net/) (for visualizing the simulation output)

---

## How to Run the Simulation

To run the simulation yourself, make sure you have **GHDL** and **gtkwave** installed and follow these steps in your terminal:

1.  **Analyze (compile) the VHDL files:**
    ```bash
    ghdl -a add.vhdl
    ghdl -a add_tb.vhdl
    ```

2.  **Elaborate (build) the testbench entity:**
    ```bash
    ghdl -e add_tb
    ```

3.  **Run the simulation and generate a VCD waveform file:**
    ```bash
    ghdl -r add_tb --vcd=add_tb.vcd
    ```
    
__If The test Bench simulation is successfull you should get this message:__
  ```
    ghdl:info: simulation finished with status note
    ../add_tb.vhdl:48:9:@30ns:(assertion note): Executed Test Bench
  ```


4.  **View the results in GTKWave:**
    ```bash
    gtkwave add_tb.vcd
    ```
---

## Simulation and Verification

The `add` module was verified using the provided testbench (`add_tb.vhdl`). The testbench covers several cases, including a critical test for carry-out functionality.

### Test Case: Carry-Out (15 + 1 = 16), Third Segment ->.

The waveform below shows the final and most important test case. The inputs are set to `a = "1111"` (15) and `b = "0001"` (1). The 5-bit `sum` output correctly becomes `"10000"` (16), confirming that the adder handles the carry-out bit as expected.

![Adder Carry-Out Test Waveform](waveformFiles/waveformPhoto.png)
