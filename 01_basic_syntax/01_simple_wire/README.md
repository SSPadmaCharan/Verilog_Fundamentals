# 01 - Simple Wire

> The first project in my **Project-Driven Verilog Learning** repository.

---

# 📖 Objective

Learn how to create the simplest Verilog module by directly connecting an input to an output using a continuous assignment (`assign`).

This project introduces the complete RTL development flow:

- Writing RTL code
- Writing a Testbench
- Running Simulation
- Generating Waveforms
- Verifying the Design

---

# 📚 Prerequisites

Before starting this project, you should know:

- Basic Digital Electronics
- What is a Wire?
- What is a Logic Signal?
- Basic Verilog Module Syntax

---

# 🧠 Theory

A **Simple Wire** is the most basic digital circuit.

It directly transfers the value present at the input to the output.

There is **no logic operation** performed.

Whenever the input changes, the output changes immediately.

### Boolean Expression

```
Y = A
```

---

# 🔌 Circuit Representation

```
      +------------------+
in --->|   Simple Wire    |----> out
      +------------------+
```

Or simply

```
Input -----------------------> Output
```

---

# 💻 RTL Design

```verilog
module simple_wire(
    input wire in,
    output wire out
);

assign out = in;

endmodule
```

---

# 🧪 Testbench

The testbench generates different input values and checks whether the output follows the input correctly.

### Input Sequence

```
0 → 1 → 0
```

### Simulation Timeline

```
0 ns → 10 ns → 20 ns → 30 ns
```

---

# 📊 Expected Simulation Result

| Time (ns) | Input | Output |
|-----------:|:-----:|:------:|
| 0 | 0 | 0 |
| 10 | 1 | 1 |
| 20 | 0 | 0 |
| 30 | Simulation Ends | Simulation Ends |

---

# 🌊 Waveform

> Replace the image below with your own waveform screenshot.

![Waveform](waveform.png)

---

# 🔍 Waveform Analysis

At **0 ns**

- Input is LOW.
- Output immediately becomes LOW.

At **10 ns**

- Input changes to HIGH.
- Output follows immediately.

At **20 ns**

- Input changes back to LOW.
- Output follows immediately.

At **30 ns**

- `$finish` stops the simulation.

Since the design uses a **continuous assignment**, the output always follows the input.

---

# 📂 Project Structure

```
01_simple_wire/
│
├── simple_wire.v
├── simple_wire_tb.v
├── waveform.vcd
├── waveform.png
└── README.md
```

---

# ▶️ How to Run

### Step 1 - Compile

```bash
iverilog -o simple_wire.out simple_wire.v simple_wire_tb.v
```

### Step 2 - Run Simulation

```bash
vvp simple_wire.out
```

### Step 3 - Open GTKWave

```bash
gtkwave waveform.vcd
```

---

# 🖥️ Expected Output

```
Input :  0 → 1 → 0
Output:  0 → 1 → 0
```

The output should always match the input.

---

# 🎯 Key Concepts Learned

- Verilog Module
- Module Declaration
- Input Port
- Output Port
- `wire`
- `reg`
- Continuous Assignment (`assign`)
- Testbench
- Module Instantiation
- Named Port Mapping
- `` `timescale ``
- `initial`
- `begin` / `end`
- Delay (`#10`)
- `$dumpfile`
- `$dumpvars`
- `$finish`
- Icarus Verilog
- GTKWave
- Waveform Verification

---

# 📝 My Learning Notes

During this project, I learned that **Verilog is not a programming language used to execute instructions sequentially—it is a Hardware Description Language (HDL) used to describe digital circuits.**

I understood how a **testbench** generates input signals and how the **Design Under Test (DUT)** responds to those signals. I also learned how to compile Verilog code using **Icarus Verilog**, generate a **VCD (Value Change Dump)** file, and visualize signal transitions using **GTKWave**.

This project strengthened my understanding of:

- The difference between `wire` and `reg`
- Continuous assignments using `assign`
- Module instantiation
- Simulation flow
- Waveform analysis

This was my first complete RTL verification project.

---

# 💼 Interview Questions

### 1. Why is the input declared as `reg` inside the testbench?

Because the testbench assigns values to the input inside an `initial` block.

---

### 2. Why is the output declared as `wire`?

Because it is driven by the DUT (Design Under Test). The testbench only observes it.

---

### 3. What does `assign` do?

It creates a continuous assignment. Whenever the input changes, the output updates automatically.

---

### 4. What is the purpose of `$dumpfile`?

It creates a VCD file to store signal transitions during simulation.

---

### 5. What is the purpose of `$dumpvars`?

It specifies which module or signals should be recorded into the VCD file.

---

### 6. What is the purpose of `$finish`?

It terminates the simulation.

---

### 7. Why do we need a testbench?

A testbench generates input stimuli and verifies that the design behaves as expected.

---

# 🚀 Next Project

➡️ **02 - Multiple Wire**

In the next project, I will learn:

- Multiple Inputs
- Multiple Outputs
- Signal Connections
- More Complex RTL Design
- Better Testbench Writing

---

# 👨‍💻 Author

**Padma Charan S S**

Project: **Verilog Fundamentals**

Learning Approach: **Project-Driven Learning**

Repository Goal:

> Build a complete Verilog repository from **Basic → Advanced → RTL Design → FPGA → CPU Design**, where every project teaches a new concept through practical implementation.