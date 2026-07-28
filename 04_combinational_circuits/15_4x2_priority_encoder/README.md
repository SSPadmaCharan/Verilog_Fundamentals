<div align="center">

# 4×2 Priority Encoder (using `casex`)

**Behavioral Verilog Model · Wildcard Pattern Matching · Independent Reference-Model Verification**

`Project 15` — Combinational Circuits — *Verilog Fundamentals*

![Verilog](https://img.shields.io/badge/HDL-Verilog-blue?style=flat-square)
![Design](https://img.shields.io/badge/Style-Behavioral-teal?style=flat-square)
![Concept](https://img.shields.io/badge/Concept-Priority%20Logic-2E9EF7?style=flat-square)
![Verification](https://img.shields.io/badge/Verification-Self--Checking-2E9EF7?style=flat-square)
![Simulator](https://img.shields.io/badge/Simulator-Icarus%20Verilog-orange?style=flat-square)
![Waveform](https://img.shields.io/badge/Waveform-GTKWave-brightgreen?style=flat-square)
![Status](https://img.shields.io/badge/Status-Complete-success?style=flat-square)

</div>

---

## 📖 Overview

This project implements a **4×2 Priority Encoder** using behavioral Verilog. Unlike the standard Binary Encoder built in the previous project — which breaks the moment more than one input is HIGH — a priority encoder handles that case gracefully by always encoding the **highest-priority active input**, ignoring every lower-priority line that's also active.

The design is implemented with the **`casex` statement**, which allows concise pattern matching using wildcard bits (`x`) instead of a long chain of conditionals. Verification uses both a standard testbench and a self-checking testbench built on a deliberately *different* implementation style, to avoid the two sides of the verification sharing the same blind spot.

### Objectives

- Understand the working principle of a Priority Encoder
- Learn the difference between a Binary Encoder and a Priority Encoder
- Implement a 4×2 Priority Encoder using behavioral Verilog
- Learn the `casex` statement
- Understand wildcard matching (`x`) in Verilog
- Learn how `else-if` chains can drive a self-checking testbench
- Verify the design through simulation

---

## 🧠 What Is a Priority Encoder?

A Priority Encoder is a combinational circuit that converts multiple input lines into a smaller binary output, while assigning an explicit **priority** to each input. If more than one input is HIGH at once, the encoder ignores every lower-priority input and encodes only the highest-priority one that's active.

Unlike a standard encoder, a priority encoder **does not require a one-hot input** — that's precisely the limitation it exists to solve.

---

## 🏗️ Block Diagram

```
               ┌───────────────────┐
   E0 ────────►│                   │
   E1 ────────►│   4×2 Priority    │───► Y1
   E2 ────────►│      Encoder      │───► Y0
   E3 ────────►│                   │
               └───────────────────┘
```

---

## 🥇 Priority Order

```
Highest Priority
      E3
       ↓
      E2
       ↓
      E1
       ↓
      E0
Lowest Priority
```

| Input | Output |
|---|:-:|
| 1000 | 11 |
| 1010 | 11 |
| 0111 | 10 |
| 0011 | 01 |
| 0001 | 00 |

Even with multiple bits HIGH (`1010`, `0111`), the output always reflects only the highest-priority active line.

---

## ⚖️ Binary Encoder vs. Priority Encoder

| Binary Encoder | Priority Encoder |
|---|---|
| Assumes exactly one input is HIGH | Allows multiple HIGH inputs |
| Fails for multiple active inputs | Always selects the highest-priority input |
| Requires one-hot inputs | Works with every possible input combination |
| Simple encoding | Priority-based encoding |

---

## 📊 Truth Table

| E3 | E2 | E1 | E0 | Output |
|:--:|:--:|:--:|:--:|:------:|
| 1 | x | x | x | **11** |
| 0 | 1 | x | x | **10** |
| 0 | 0 | 1 | x | **01** |
| 0 | 0 | 0 | 1 | **00** |
| 0 | 0 | 0 | 0 | **00** |

*`x` = Don't Care — once a higher-priority bit is HIGH, lower bits no longer affect the result.*

---

## ⚙️ Boolean Equation Formation

From the priority table:

$$Y_1 = E_3 + E_2$$

$$Y_0 = E_3 + (E_1 \cdot \overline{E_2})$$

`Y0` needs the `E2'` term specifically to avoid a false positive — without it, `E1` would incorrectly assert `Y0` even when `E2` (higher priority) is also active.

---

## 🧵 Behavioral Design

Rather than wiring this up from Boolean equations or discrete gates, the encoder is described behaviorally with a `casex` statement — each case pattern directly represents one priority condition:

```
if E3 is HIGH        → Output = 11
else if E2 is HIGH    → Output = 10
else if E1 is HIGH    → Output = 01
else if E0 is HIGH    → Output = 00
else                   → Output = 00
```

This maps almost one-to-one onto the priority order itself — the RTL reads like the specification.

---

## 🏗️ Structural Design (Alternative)

Although this project is implemented behaviorally, the same circuit could be built structurally from NOT, AND, and OR gates directly off the Boolean equations above. Behavioral modeling was chosen here because it's dramatically more readable — the `casex` version communicates *intent* (priority order) far more directly than an equivalent gate network would.

---

## 🆕 New Verilog Concept — `casex`

`casex` is a variant of `case` where both **X** and **Z** bits act as wildcards during comparison, allowing "don't care" positions directly in the case pattern:

```verilog
casex(e)
    4'b1xxx : y = 2'b11;
    4'b01xx : y = 2'b10;
    4'b001x : y = 2'b01;
    4'b0001 : y = 2'b00;
    default : y = 2'b00;
endcase
```

**Why use it?** Without `casex`, this same logic would need a much longer chain of nested `if-else` statements to express. Wildcard bits let the priority structure be expressed directly, in a form that visually matches the truth table.

---

## 🆕 New Verilog Concept — `else-if` in Verification

The self-checking testbench computes its expected output using an independent `if-else if` chain:

```
If E3 is HIGH      → Output = 11
Else If E2 is HIGH  → Output = 10
Else If E1 is HIGH  → Output = 01
Else If E0 is HIGH  → Output = 00
Else                → Output = 00
```

Using a *different* implementation style in the testbench than in the DUT is a deliberate verification choice, explained below.

---

## 🚫 Why Not Use `casex` in the Self-Checking Testbench?

The DUT already uses `casex`. If the testbench mirrored that same logic — and shared the same mistake — the simulation could report a false `PASS` even with a genuine bug present.

Using a structurally different implementation (`if-else`) in the testbench provides a **truly independent reference model**, which is far more likely to catch a real bug than a second copy of the same logic would.

---

## 🧪 Testbench Methodology

The testbench sweeps **every possible input combination**. With four inputs:

$$2^4 = 16 \text{ total test cases}$$

Each combination is generated automatically via a loop:

```
0000 → 0001 → 0010 → 0011 → ... → 1111
```

guaranteeing complete functional coverage of the input space.

---

## ✅ Self-Checking Verification

The self-checking testbench:

- Calculates the expected output using the independent `if-else` reference model
- Compares it against the DUT's actual output
- Prints `PASS` when they match
- Prints `FAIL` otherwise

This removes manual waveform inspection from the verification loop entirely.

---

## 🌊 Simulation Waveform

![Waveform](Images/waveform.png)

**Analysis:**
- Highest-priority input is correctly selected in every combination, including cases with multiple active bits ✅
- Binary output correctly reflects the priority order across all 16 combinations ✅
- No undefined (`X`) or unexpected transitions observed on the output ✅
- Self-checking testbench reports PASS for all 16 test cases against the independent reference model ✅

---

## 📂 Project Structure

```
15_4x2_priority_encoder/
├── rtl/
│   └── priority_encoder_4x2.v
│
├── tb/
│   ├── priority_encoder_4x2_tb.v
│   └── priority_encoder_4x2_self_checking_tb.v
│
├── Images/
│   └── waveform.png
│
└── README.md
```

---

## ▶️ How to Run

```bash
# 1 — Compile
iverilog -o priority_encoder.out rtl/priority_encoder_4x2.v tb/priority_encoder_4x2_tb.v

# 2 — Simulate
vvp priority_encoder.out

# 3 — View Waveform
gtkwave priority_encoder.vcd
```

---

## 🌟 Real-World Applications

- CPU Interrupt Controllers
- Bus Arbitration
- Keyboard Encoders
- Network Routers
- DMA Controllers
- Microprocessors
- Embedded Systems

---

## 🎯 Learning Outcomes

After completing this project, I learned:

- The difference between a Binary Encoder and a Priority Encoder
- Priority-based combinational logic design
- Behavioral modeling in Verilog
- Usage of the `casex` statement
- Wildcard pattern matching using `x`
- Building `else-if` chains for verification
- Writing self-checking testbenches
- Automatically generating all input combinations via loops
- Independent verification using a reference model

---

## 🚀 Future Improvements

- 8×3 Priority Encoder
- Priority Encoder with a Valid output flag
- Cascaded Priority Encoders
- Parameterized Priority Encoder
- Gate-level structural implementation

---

## 🏁 Conclusion

This project demonstrated the implementation and verification of a **4×2 Priority Encoder** using behavioral Verilog HDL. The design correctly encodes the highest-priority active input even when multiple inputs are HIGH simultaneously. The `casex` statement simplifies the RTL considerably, and a self-checking testbench built on an independent `if-else` reference model provides genuinely robust functional verification — rather than one that could silently share a bug with the design under test.

This project strengthens understanding of priority logic, behavioral modeling, and professional RTL verification technique.

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