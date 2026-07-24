<div align="center">

# 1×4 Demultiplexer

**Behavioral Verilog Model · Automated & Self-Checking Testbenches**

`Project 12` — Combinational Circuits — *Verilog Fundamentals*

![Verilog](https://img.shields.io/badge/HDL-Verilog-blue?style=flat-square)
![Design](https://img.shields.io/badge/Style-Behavioral-teal?style=flat-square)
![Verification](https://img.shields.io/badge/Verification-Self--Checking-2E9EF7?style=flat-square)
![Simulator](https://img.shields.io/badge/Simulator-Icarus%20Verilog-orange?style=flat-square)
![Waveform](https://img.shields.io/badge/Waveform-GTKWave-brightgreen?style=flat-square)
![Status](https://img.shields.io/badge/Status-Complete-success?style=flat-square)

</div>

---

## 📖 Overview

This project implements a **1×4 Demultiplexer (DEMUX)** in Verilog HDL — the mirror image of the 4×1 Multiplexer built a few projects back. A Demultiplexer routes a **single data input** to exactly one of several output lines, based on the value of its select inputs.

Where a MUX *selects* one of many inputs and forwards it to a single output, a DEMUX does the opposite: it *distributes* one input across many possible outputs.

### Project Objectives

- Understand the working principle of a Demultiplexer
- Learn how data routing circuits operate
- Implement a 1×4 DEMUX using Verilog HDL
- Understand Boolean equation derivation
- Practice combinational RTL design
- Verify the design via simulation and a self-checking testbench

---

## 🧠 What Is a Demultiplexer?

A Demultiplexer is a digital switching circuit that routes a single input signal to exactly **one** output line, chosen by one or more select inputs.

For this 1×4 DEMUX:

| Signal | Count |
|---|:-:|
| Data Inputs | 1 |
| Outputs | 4 |
| Select Lines | 2 |

---

## 🏗️ Block Diagram

```
                ┌──────────────────┐
   Input ──────►│                  │───► Y0
                │                  │───► Y1
      S1 ──────►│    1×4 DEMUX     │───► Y2
      S0 ──────►│                  │───► Y3
                └──────────────────┘
```

---

## 🔀 Why Are Demultiplexers Used?

A DEMUX is used whenever a single signal needs to be directed to one of many destinations. Instead of running multiple dedicated connections, a DEMUX lets a single input line be *shared* across several outputs — cutting wiring complexity and improving hardware efficiency.

---

## ⚖️ MUX vs. DEMUX

| Multiplexer | Demultiplexer |
|---|---|
| Many Inputs | One Input |
| One Output | Many Outputs |
| Selects one input | Selects one output |
| Data Selector | Data Distributor |

```
        Multiplexer                    Demultiplexer

   I0 ──┐
   I1 ──┤
   I2 ──┤                                    ┌──► Y0
   I3 ──┘                                    ├──► Y1
         │                                   ├──► Y2
         ▼                                   └──► Y3
      ┌───────┐                          ┌───────┐
      │  MUX  │                    ──────►│ DEMUX │
      └───────┘                          └───────┘
          │                                   ▲
          ▼                                   │
        OUT                                 Input
```

---

## 🏛️ Overall Architecture

The circuit consists of one data input, two select inputs, and four output lines. **Only one output ever receives the input signal at a time**; the rest stay LOW.

```
                    Data Input
                        │
                        ▼
                 ┌─────────────┐
         S1 ────►│             │───► Y0
         S0 ────►│    DEMUX    │───► Y1
                 │             │───► Y2
                 └─────────────┘───► Y3
```

---

## 🎨 Design Philosophy

A Demultiplexer performs **data routing**, not arithmetic — the input signal itself is never modified. The select lines simply decide *which* output receives it, while every other output holds LOW.

This routing principle underlies digital communication systems, processor bus architecture, memory interfaces, and embedded hardware throughout the industry.

---

## 📊 Truth Table

| S1 | S0 | Input | Y0 | Y1 | Y2 | Y3 |
|:--:|:--:|:-----:|:--:|:--:|:--:|:--:|
| 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| 0 | 0 | 1 | **1** | 0 | 0 | 0 |
| 0 | 1 | 0 | 0 | 0 | 0 | 0 |
| 0 | 1 | 1 | 0 | **1** | 0 | 0 |
| 1 | 0 | 0 | 0 | 0 | 0 | 0 |
| 1 | 0 | 1 | 0 | 0 | **1** | 0 |
| 1 | 1 | 0 | 0 | 0 | 0 | 0 |
| 1 | 1 | 1 | 0 | 0 | 0 | **1** |

---

## ⚙️ Boolean Equations

Derived directly from the truth table:

$$Y_0 = I \cdot \overline{S_1} \cdot \overline{S_0}$$

$$Y_1 = I \cdot \overline{S_1} \cdot S_0$$

$$Y_2 = I \cdot S_1 \cdot \overline{S_0}$$

$$Y_3 = I \cdot S_1 \cdot S_0$$

Each output activates for exactly one unique select-line combination — and only when the input itself is HIGH.

---

## 🔌 Logic Diagram

Each output is an AND of the input with its unique select-line combination:

```
                ┌──────────────┐
   ~S1 ────────►│              │
   ~S0 ────────►│     AND      ├───► Y0
 Input ────────►│              │
                └──────────────┘

                ┌──────────────┐
   ~S1 ────────►│              │
    S0 ────────►│     AND      ├───► Y1
 Input ────────►│              │
                └──────────────┘

                ┌──────────────┐
    S1 ────────►│              │
   ~S0 ────────►│     AND      ├───► Y2
 Input ────────►│              │
                └──────────────┘

                ┌──────────────┐
    S1 ────────►│              │
    S0 ────────►│     AND      ├───► Y3
 Input ────────►│              │
                └──────────────┘
```

`~S1` and `~S0` are generated once via NOT gates and shared across the relevant AND terms above.

---

## 🔆 Active-High Outputs

This implementation uses **active-high outputs**: the selected output goes HIGH only when both `Input = 1` **and** its select combination is active. Every other output stays LOW regardless of the input value.

---

## 💻 RTL Implementation

The design is implemented using **behavioral modeling**. Since output selection is fundamentally about mapping select-line values to actions, a `case` statement (or equivalent behavioral construct) is the natural, readable choice here — closely mirroring the approach used for the 4×1 MUX earlier in the repository.

---

## 📂 Project Structure

```
12_1x4_demux/
├── rtl/
│   └── demux_1x4.v
│
├── tb/
│   ├── demux_1x4_tb.v
│   └── demux_1x4_self_checking_tb.v
│
├── waveform.png
└── README.md
```

---

## 🧪 Simulation

Verified using both a **standard testbench** and a **self-checking testbench**, applying every combination of `Input`, `S1`, and `S0`:

$$2 \times 2^2 = 8 \text{ total combinations}$$

The simulation confirms the input is correctly routed to the selected output on every combination, with all other outputs held LOW throughout.

---

## ▶️ How to Run

```bash
# 1 — Compile
iverilog -o demux.out demux_1x4.v demux_1x4_tb.v

# 2 — Simulate
vvp demux.out

# 3 — View Waveform
gtkwave waveform.vcd
```

---

## 🌟 Real-World Applications

- Memory Address Decoding
- Processor Bus Routing
- Serial-to-Parallel Communication
- Data Distribution Networks
- Embedded Systems
- FPGA Routing
- Communication Systems
- Display Controllers
- Sensor Selection
- Digital Switching Networks

---

## 🎯 Learning Outcomes

After completing this project, the following concepts are understood:

- Data Routing Circuits
- Demultiplexer Design
- Boolean Equation Derivation
- Behavioral RTL Design
- Combinational Logic
- Active-High Outputs
- Testbench Development
- Self-Checking Verification

---

## 🚀 Future Work

The concepts learned here form the foundation for:

- Encoder
- Priority Encoder
- Decoder
- Bus Routing Networks
- Processor Control Logic
- Memory Selection Circuits

---

## 🏁 Conclusion

This project demonstrates the implementation of a **1×4 Demultiplexer**, a fundamental combinational circuit for data distribution in digital systems.

By routing a single input signal to one of four outputs based on two select lines, the design illustrates the principles of digital switching, Boolean logic, and combinational RTL design — concepts that form an essential foundation for more advanced circuits such as encoders, decoders, processor datapaths, and communication interfaces.

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