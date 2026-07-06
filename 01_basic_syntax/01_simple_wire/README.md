# 01 – Simple Wire

**Project 01** of the **Verilog Fundamentals** repository.

This project demonstrates the simplest possible digital circuit in Verilog by directly connecting an input signal to an output signal using a continuous assignment.

---

## Objective

The objective of this project is to understand:

- Verilog module declaration
- Input and output ports
- Continuous assignment (`assign`)
- Testbench creation
- Module instantiation
- Simulation using Icarus Verilog
- Waveform generation using GTKWave
- Basic RTL verification workflow

---

## Prerequisites

Before starting this project, you should be familiar with:

- Basic digital electronics
- Binary logic
- The concept of a wire
- Basic Verilog syntax

---

## Theory

A **simple wire** is the most basic digital connection possible.

It transfers the input signal directly to the output, with no logic operation performed. Whenever the input changes, the output changes immediately.

**Boolean Expression**

```
Y = A
```

---

## Circuit Representation

```
             +------------------+
   in ------>|   Simple Wire    |------> out
             +------------------+
```

Or more simply:

```
Input ---------------------------> Output
```

---

## RTL Design

```verilog
module simple_wire(
    input wire in,
    output wire out
);

assign out = in;

endmodule
```

---

## Testbench

The testbench applies a sequence of input values to verify that the output always follows the input.

**Input Sequence**

```
0 → 1 → 0
```

**Simulation Timeline**

```
0 ns → 10 ns → 20 ns → 30 ns
```

---

## Expected Simulation Result

| Time (ns) | Input | Output |
|----------:|:-----:|:------:|
| 0 | 0 | 0 |
| 10 | 1 | 1 |
| 20 | 0 | 0 |
| 30 | Simulation Ends | Simulation Ends |

---

## Waveform

The waveform generated using **GTKWave** is shown below.

![Waveform](waveform.png)

---

## Waveform Analysis

**At 0 ns**
- Input is LOW (`0`)
- Output immediately becomes LOW (`0`)

**At 10 ns**
- Input changes to HIGH (`1`)
- Output immediately follows and becomes HIGH (`1`)

**At 20 ns**
- Input changes back to LOW (`0`)
- Output immediately follows and becomes LOW (`0`)

**At 30 ns**
- `$finish` terminates the simulation.

Since the module uses a continuous assignment, the output always follows the input without any additional logic.

---

## Project Structure

```
01_simple_wire/
│
├── README.md
├── simple_wire.v
├── simple_wire_tb.v
└── waveform.png
```

---

## How to Run

**Step 1 — Compile**

```bash
iverilog -o simple_wire.out simple_wire.v simple_wire_tb.v
```

**Step 2 — Run Simulation**

```bash
vvp simple_wire.out
```

**Step 3 — Open GTKWave**

```bash
gtkwave waveform.vcd
```

---

## Expected Output

```
Input

0 ─────────── 1 ─────────── 0

Output

0 ─────────── 1 ─────────── 0
```

The output always follows the input because of the continuous assignment.

---

## Key Concepts Learned

- Verilog module
- Module declaration
- Input port
- Output port
- `wire`
- `reg`
- Continuous assignment (`assign`)
- Testbench
- Module instantiation
- Named port mapping
- `` `timescale ``
- `initial`
- `begin` / `end`
- Delay (`#10`)
- `$dumpfile`
- `$dumpvars`
- `$finish`
- Icarus Verilog
- GTKWave
- RTL simulation
- Waveform analysis

---

## Learning Notes

During this project, I learned that **Verilog is not a traditional programming language — it is a Hardware Description Language (HDL) used to model digital circuits.**

I understood how a **testbench** generates input signals and how the **Design Under Test (DUT)** responds to those signals.

I also learned the complete RTL verification workflow:

- Writing RTL
- Writing a testbench
- Compiling using Icarus Verilog
- Running the simulation
- Generating a VCD file
- Viewing waveforms in GTKWave

This project also strengthened my understanding of:

- The difference between `wire` and `reg`
- Continuous assignments
- Module instantiation
- Waveform verification
- Basic digital hardware simulation

This was my **first complete RTL verification project**.

---

## Interview Questions

**1. Why is the input declared as `reg` inside the testbench?**

Because the testbench assigns values to it inside an `initial` block.

**2. Why is the output declared as `wire`?**

Because the output is driven by the DUT (Design Under Test). The testbench only observes its value.

**3. What does `assign` do?**

`assign` creates a **continuous assignment**, meaning the output is continuously updated whenever the input changes.

**4. What is the purpose of `$dumpfile`?**

It creates a **VCD (Value Change Dump)** file that stores signal transitions during simulation.

**5. What is the purpose of `$dumpvars`?**

It specifies which module or signals should be recorded into the VCD file.

**6. What is the purpose of `$finish`?**

It terminates the simulation.

**7. What is a testbench?**

A testbench is a Verilog module that generates input stimulus, verifies the DUT, and checks whether the design behaves as expected.

**8. What is a DUT?**

**DUT** stands for **Design Under Test**. It is the hardware module being verified by the testbench.

---

## Next Project

### 02 – Multiple Wire

In the next project, I will learn:

- Multiple inputs
- Multiple outputs
- Signal connections
- Multi-bit data flow
- Improved testbench design

---

## Author

**Padma Charan S S**

**Repository:** Verilog Fundamentals

**Learning Approach:** Project-Driven Learning

### Repository Goal

Build a complete Verilog repository progressing through:

```
Basic Verilog
        ↓
Combinational Logic
        ↓
Sequential Logic
        ↓
RTL Design
        ↓
FPGA Design
        ↓
Computer Architecture
        ↓
CPU Design
```

Each project introduces one new concept through practical implementation.

---

> *"Learning Verilog by building hardware, verifying it, documenting it, and improving one project at a time."*