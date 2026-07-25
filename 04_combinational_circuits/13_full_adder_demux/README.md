<div align="center">

# Full Adder Using 1×8 Demultiplexer

**Structural + Gate-Level Verilog Model · Canonical Sum of Minterms · Self-Checking Verification**

`Project 13` — Combinational Circuits — *Verilog Fundamentals*

![Verilog](https://img.shields.io/badge/HDL-Verilog-blue?style=flat-square)
![Design](https://img.shields.io/badge/Style-Structural%20%2B%20Gate--Level-purple?style=flat-square)
![Concept](https://img.shields.io/badge/Concept-Minterm%20Realization-2E9EF7?style=flat-square)
![Simulator](https://img.shields.io/badge/Simulator-Icarus%20Verilog-orange?style=flat-square)
![Waveform](https://img.shields.io/badge/Waveform-GTKWave-brightgreen?style=flat-square)
![Status](https://img.shields.io/badge/Status-Complete-success?style=flat-square)

</div>

---

## 📖 Overview

This project implements a **1-bit Full Adder** using a **1×8 Demultiplexer** and **OR gate primitives** — no XOR, no AND, nothing that looks like a "normal" adder circuit at all. Instead, the design realizes the Full Adder via the **Canonical Sum of Minterms (SOP)** approach: the 1×8 DEMUX generates every possible minterm, and OR gates stitch together the ones that matter to produce SUM and CARRY.

This is the same universal-primitive idea explored with the MUX-based Full Adder a few projects back, but from the opposite direction — instead of building gates out of a selector, this design generates every possible input combination up front and simply *picks out* the ones that should be HIGH.

### Project Objectives

- Understand canonical Boolean realization
- Learn how a DEMUX can generate minterms
- Implement a Full Adder without XOR or AND gates
- Learn gate primitive instantiation in Verilog
- Practice structural RTL design
- Verify the design via simulation and self-checking verification

---

## 🧠 What Is Canonical Sum of Minterms?

Every Boolean function can be expressed as the **OR of all input combinations (minterms) for which the function evaluates HIGH**.

A DEMUX (or, equivalently, a Decoder with Enable) is a natural minterm generator — each of its outputs corresponds to exactly one input combination. Once every minterm is available, the desired output is just the OR of the ones the function needs.

This principle isn't just academic — it's the foundation behind real programmable logic devices:

- Programmable Logic Arrays (PLA)
- Programmable Array Logic (PAL)
- FPGA Lookup Tables (LUTs)

---

## 🏗️ Block Diagram

```
                     ┌───────────────────────────┐
   Logic '1' ───────►│                           │
                     │        1×8 DEMUX          │
        A ──────────►│ S2                        │
        B ──────────►│ S1                        │
      Cin ──────────►│ S0                        │
                     │                           │
                     └───────────────────────────┘
                       Y0 Y1 Y2 Y3 Y4 Y5 Y6 Y7
                        │  │  │  │  │  │  │  │
                        └──┴──┴──┴──┴──┴──┴──┴──┐
                                                 │
            ┌────────────────────────────────────┤
            │                                    │
        4-input OR                          4-input OR
            │                                    │
           SUM                                 CARRY
```

---

## 🧩 Hardware Architecture

The design consists of:

- One 1×8 DEMUX
- Two 4-input OR gates
- Three input variables (`A`, `B`, `Cin`)
- Two output signals (`Sum`, `Carry`)

The DEMUX activates exactly one minterm output for every possible input combination; OR gates then combine the required minterms into the final Full Adder outputs.

---

## 🎨 Design Philosophy

Instead of implementing Boolean expressions directly, this design first generates *every possible* minterm, then selectively combines only the ones needed. It's a deliberately different mental model from writing `assign sum = a ^ b ^ cin` — and one that maps far more directly onto how programmable logic hardware (PLAs, PALs, LUTs) actually works under the hood.

---

## 📊 Full Adder Truth Table

| A | B | Cin | Sum | Carry |
|:-:|:-:|:---:|:---:|:-----:|
| 0 | 0 | 0 | **0** | **0** |
| 0 | 0 | 1 | **1** | **0** |
| 0 | 1 | 0 | **1** | **0** |
| 0 | 1 | 1 | **0** | **1** |
| 1 | 0 | 0 | **1** | **0** |
| 1 | 0 | 1 | **0** | **1** |
| 1 | 1 | 0 | **0** | **1** |
| 1 | 1 | 1 | **1** | **1** |

---

## 🔢 Minterm Generation

The DEMUX's data input is permanently tied to Logic HIGH:

```
Input = 1
```

and the select lines are wired directly to the adder's inputs:

```
S2 = A
S1 = B
S0 = Cin
```

| A | B | Cin | Active Output |
|:-:|:-:|:---:|:--------------:|
| 0 | 0 | 0 | Y0 |
| 0 | 0 | 1 | Y1 |
| 0 | 1 | 0 | Y2 |
| 0 | 1 | 1 | Y3 |
| 1 | 0 | 0 | Y4 |
| 1 | 0 | 1 | Y5 |
| 1 | 1 | 0 | Y6 |
| 1 | 1 | 1 | Y7 |

Only one output is HIGH for any given input combination — exactly one minterm is "selected" per cycle.

---

## ➕ Sum Realization

SUM is HIGH for input rows `001`, `010`, `100`, and `111`:

$$Sum = Y_1 + Y_2 + Y_4 + Y_7$$

```
Y1 ──┐
Y2 ──┤
     ├──── OR ───► SUM
Y4 ──┤
Y7 ──┘
```

---

## 🔼 Carry Realization

CARRY is HIGH for input rows `011`, `101`, `110`, and `111`:

$$Carry = Y_3 + Y_5 + Y_6 + Y_7$$

```
Y3 ──┐
Y5 ──┤
     ├──── OR ───► Carry
Y6 ──┤
Y7 ──┘
```

---

## 🤔 Why Does This Work?

A DEMUX with its data input tied to Logic HIGH behaves as a pure **minterm generator** — each output corresponds to exactly one input combination, and it goes HIGH if and only if that exact combination is present.

Since any Boolean function can be written as a Sum of Minterms, OR-ing together the correct subset of DEMUX outputs reconstructs the desired function exactly — no matter how "irregular" that function's truth table looks. This is one of the foundational principles in digital logic synthesis, and it's the reason lookup-table-based FPGA fabrics work at all.

---

## 💻 RTL Implementation

This project deliberately combines **three** RTL modeling styles in one design:

- **Behavioral Modeling** — the 1×8 DEMUX itself
- **Structural Modeling** — instantiating the DEMUX as a module
- **Gate-Level Modeling** — OR gate primitives combining the minterms

### Gate Primitive Usage

Rather than the more common continuous assignment:

```verilog
assign sum = y[1] | y[2] | y[4] | y[7];
```

this project uses Verilog's **built-in gate primitives** directly:

```verilog
or u_sum   (sum,   y[1], y[2], y[4], y[7]);
or u_carry (carry, y[3], y[5], y[6], y[7]);
```

Functionally identical to the `assign` version, but this is genuine **gate-level structural design** — each `or` instance represents an actual OR gate primitive, not a synthesized Boolean expression.

---

## 📂 Project Structure

```
13_full_adder_using_1x8_demux/
├── rtl/
│   ├── demux_1x8.v
│   └── full_adder_using_1x8_demux.v
│
├── tb/
│   ├── full_adder_using_1x8_demux_tb.v
│   └── full_adder_using_1x8_demux_self_checking_tb.v
│
├── waveform.png
└── README.md
```

---

## 🧪 Simulation

Verified using both a **standard testbench** and a **self-checking testbench**, sweeping all eight input combinations of `A`, `B`, and `Cin`. Generated SUM and CARRY outputs are compared against the expected Full Adder results for every case.

---

## ▶️ How to Run

```bash
# 1 — Compile
iverilog -o full_adder.out full_adder_using_1x8_demux.v demux_1x8.v full_adder_using_1x8_demux_tb.v

# 2 — Simulate
vvp full_adder.out

# 3 — View Waveform
gtkwave waveform.vcd
```

---

## 🎯 Learning Outcomes

After completing this project, the following concepts are understood:

- Canonical Sum of Minterms (SOP)
- Minterm Generation Using a DEMUX
- Full Adder Design
- Gate Primitive Instantiation
- Structural RTL Design
- Module Instantiation
- Self-Checking Verification
- Technology-Independent RTL Design

---

## 🚀 Future Work

The concepts learned here prepare you for:

- Encoder
- Priority Encoder
- Decoder
- Programmable Logic Arrays (PLA)
- Programmable Array Logic (PAL)
- FPGA Lookup Table (LUT) Design

---

## 🏁 Conclusion

This project demonstrates the implementation of a **1-bit Full Adder** using a **1×8 Demultiplexer** and **OR gate primitives**. By generating canonical minterms and combining them through OR gates, the design illustrates one of the most fundamental techniques in digital logic synthesis.

It also introduces gate-level Verilog primitives and reinforces structural RTL design — providing a solid conceptual foundation for understanding programmable logic devices and how modern digital hardware gets implemented under the hood.

---

<div align="center">

## 👨‍💻 Author

**Padma Charan S S**
*Repository: Verilog Fundamentals — Project-Driven Learning*

</div>

### 🗺️ Repository Roadmap

```
Basic Verilog → Logic Gates → 7400 Series ICs → Combinational Circuits
      → Sequential Circuits → RTL Design → Verification Methodologies
      → FPGA Design → Computer Architecture → Mini CPU Design
```