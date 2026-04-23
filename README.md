# RISC-V Processor Design in Verilog

## Overview

This project is a simplified implementation of a **RISC-V processor** using Verilog HDL.
The main goal was to understand how a processor works internally — from reading instructions to performing operations and storing results.

Instead of using pre-built processors, this project builds the core components from scratch:

* ALU (Arithmetic Logic Unit)
* Register File
* Control Unit

The design is simulated using **Icarus Verilog** and visualized using **GTKWave**.

---

## How It Works (Simple Explanation)

Think of the processor as a small machine that follows instructions step-by-step:

1. Instruction is given
2. Control Unit decodes it (decides what operation to perform)
3. Register File provides input values
4. ALU performs the operation
5. Result is written back to the register

### Flow:

Instruction → Decode → Execute → Write Back

---

## Components Explained

### ALU (Arithmetic Logic Unit)

* Performs operations:

  * ADD
  * SUB
  * AND
  * OR
* Controlled by a signal called `alu_ctrl`

---

### Register File

* Contains 32 registers (each 32-bit)
* Provides input values to ALU
* Stores result after execution

Example:

* x1 = 10
* x2 = 5

---

### Control Unit

* Decodes instruction fields:

  * opcode
  * funct3
  * funct7
* Determines which ALU operation to perform

---

### Processor (Top Module)

* Connects ALU, register file, and control unit
* Extracts instruction fields
* Controls full data flow

---

## Example Execution

### Instruction 1:

ADD x3, x1, x2
Result: 10 + 5 = 15

### Instruction 2:

SUB x3, x1, x2
Result: 10 - 5 = 5

---

## Waveform Output

The waveform shows:

* Instruction changing
* ALU control signal switching
* Register values flowing
* Final result updating



---

## Tools Used

* Verilog HDL
* Icarus Verilog
* GTKWave

---

## How to Run This Project

### Step 1: Open terminal in project folder

### Step 2: Compile the code

iverilog -o cpu_out src/*.v testbench/tb_cpu.v      [will complies the testbench and cpu files to generate cpu output file]

### Step 3: Run simulation

vvp cpu_out                                          [to simulate the cpu out file]

### Step 4: Open waveform viewer

gtkwave cpu_wave.vcd                                 [generate the waveform on gtkwave]

---

## What to Look for in Waveform

* read_data1 = 10
* read_data2 = 5
* alu_ctrl = 000 → ADD
* result = 15

Then:

* alu_ctrl = 001 → SUB
* result = 5

---

##  Key Concepts Demonstrated

* RISC architecture (simple instructions)
* RTL design (hardware description)
* Instruction decoding
* Register-based computation
* Simulation and debugging

---

##  Limitations

* Single-cycle design (no pipelining)
* No memory operations (load/store)
* Limited instruction support

---

##  Future Improvements

* Add pipelining
* Add memory (load/store)
* Add branching instructions

---
## Author 

Mithilesh Subramani

---
