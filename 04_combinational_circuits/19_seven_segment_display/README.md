<div align="center">

# 🔟 20 — BCD to 7-Segment Display Decoder

### 4-Bit BCD → 7-Segment Display · Behavioral RTL in Verilog HDL

*Project 20 of the **Verilog Fundamentals** repository*

[![Verilog](https://img.shields.io/badge/HDL-Verilog-1f6feb?style=flat-square)](#)
[![Modeling](https://img.shields.io/badge/Style-Behavioral%20RTL-e67e22?style=flat-square)](#)
[![Simulator](https://img.shields.io/badge/Simulator-Icarus%20Verilog-orange?style=flat-square)](#)
[![Waveform](https://img.shields.io/badge/Waveform-GTKWave-2ea44f?style=flat-square)](#)
[![Coverage](https://img.shields.io/badge/Verified-16%2F16%20inputs-brightgreen?style=flat-square)](#)

</div>

---

## 📖 Overview

This project implements a **BCD to 7-Segment Display Decoder** in Verilog HDL. It takes a **4-bit Binary Coded Decimal (BCD)** input and drives a **7-bit output** that lights the correct segments of a seven-segment display to show the matching decimal digit.

```
      a
     ---
  f |   | b
     --- g
  e |   | c
     ---
      d
```

Output bits are ordered `abcdefg`. This project targets a **Common Cathode** display, where `1` = segment ON and `0` = segment OFF.

The decoder is written using **behavioral RTL** with a `case` statement — and, notably, its testbench verifies the design against an **independent Boolean-equation reference model** rather than simply re-checking the same `case` logic.

---

## 🎯 Objectives

- 🔹 Understand seven-segment display operation and segment naming
- 🔹 Understand Common Cathode display configuration
- 🔹 Convert a BCD input into the correct segment pattern
- 🔹 Learn behavioral RTL modeling with `case` / `default`
- 🔹 Derive Boolean equations for individual segments
- 🔹 Apply K-map minimization with don't-care conditions
- 🔹 Build a self-checking testbench with an independent reference model
- 🔹 Verify all 16 possible 4-bit input combinations

---

## 📚 Prerequisites

| Topic | Why it matters |
|---|---|
| BCD Representation (Project 19) | The decoder's input format |
| Combinational Logic Fundamentals | Foundation for `always @(*)` blocks |
| Truth Tables & Minterms | Basis for the Boolean reference model |
| K-Map Minimization | Simplifies each segment's equation |
| Verilog `case` Statement | Core decoding construct used here |
| Testbench Fundamentals | Build the self-checking verification |

---

## 🧠 What Is a 7-Segment Display?

A seven-segment display is seven individually controllable LED segments, labeled `a` through `g`, arranged to form digits:

```
      a
     ---
  f |   | b
     --- g
  e |   | c
     ---
      d
```

Turning specific segments ON forms a decimal digit. For example, digit `0` lights every segment except `g`:

```
a=1  b=1  c=1  d=1  e=1  f=1  g=0
→ abcdefg = 1111110
```

### Common Cathode Configuration

This project targets a **Common Cathode** display, where:

| Logic | Effect |
|:-:|---|
| `1` | Segment **ON** |
| `0` | Segment **OFF** |

Output logic maps directly to segment activation — no inversion required.

---

## 🔢 BCD Input

The decoder takes a 4-bit input `B[3:0]`. Valid BCD values represent decimal digits `0`–`9`:

| BCD | Decimal | BCD | Decimal |
|:-:|:-:|:-:|:-:|
| `0000` | 0 | `0101` | 5 |
| `0001` | 1 | `0110` | 6 |
| `0010` | 2 | `0111` | 7 |
| `0011` | 3 | `1000` | 8 |
| `0100` | 4 | `1001` | 9 |

The remaining combinations (`1010`–`1111`) are **invalid BCD** and are handled via the `default` case, turning all segments OFF.

---

## 📊 BCD to 7-Segment Truth Table

*(`abcdefg` order, Common Cathode)*

| BCD | Decimal | `abcdefg` |
|:-:|:-:|:-:|
| `0000` | 0 | `1111110` |
| `0001` | 1 | `0110000` |
| `0010` | 2 | `1101101` |
| `0011` | 3 | `1111001` |
| `0100` | 4 | `0110011` |
| `0101` | 5 | `1011011` |
| `0110` | 6 | `1011111` |
| `0111` | 7 | `1110000` |
| `1000` | 8 | `1111111` |
| `1001` | 9 | `1111011` |
| `1010`–`1111` | *invalid* | `0000000` |

---

## 🔌 Block Diagram

```
                 ┌──────────────────────┐
                 │                        │
     B[3:0] ────▶│  BCD to 7-Segment       │
                 │      Decoder            │
                 │                        │
                 │    case Statement       │
                 └───────────┬────────────┘
                              │
                              ▼
                         SEG[6:0]
                              │
             ┌─────────────────┼─────────────────┐
             │                 │                 │
             a                 b                ...
             │                 │                 │
             └─────────────────┼─────────────────┘
                              ▼
                     7-Segment Display
```

---

## 🏗️ Hardware Architecture

- 4 BCD input lines
- 7 segment output lines
- One BCD-decoding logic block
- One Common Cathode seven-segment display

The decoder generates the correct combination of `a, b, c, d, e, f, g` to display the requested decimal digit — described behaviorally rather than as seven independent gate-level circuits.

```
BCD Input → Identify Decimal Digit → Select Segment Pattern → abcdefg → Display
```

---

## 💻 RTL Implementation

```verilog
always @(*) begin
    case (b)
        4'b0000: seg = 7'b1111110;  // 0
        4'b0001: seg = 7'b0110000;  // 1
        4'b0010: seg = 7'b1101101;  // 2
        4'b0011: seg = 7'b1111001;  // 3
        4'b0100: seg = 7'b0110011;  // 4
        4'b0101: seg = 7'b1011011;  // 5
        4'b0110: seg = 7'b1011111;  // 6
        4'b0111: seg = 7'b1110000;  // 7
        4'b1000: seg = 7'b1111111;  // 8
        4'b1001: seg = 7'b1111011;  // 9
        default: seg = 7'b0000000;  // invalid BCD
    endcase
end
```

The `case` statement selects the correct segment pattern for each valid BCD value; `default` handles everything else.

---

## 💡 New Verilog Concepts

<table>
<tr>
<td valign="top" width="50%">

**`case` Statement**

Selects one output based on the value of an input expression:

```verilog
case (expression)
    value1: statement1;
    value2: statement2;
    default: statement_default;
endcase
```

Here, `case (b)` examines the 4-bit BCD input and maps each valid value to its segment pattern.

</td>
<td valign="top" width="50%">

**`default` Case**

Catches every value not explicitly listed. Since only `0`–`9` are valid BCD, values `10`–`15` fall through to:

```verilog
default: seg = 7'b0000000;
```

This guarantees a defined output for **every** possible input — essential for clean combinational logic.

</td>
</tr>
</table>

---

## 🧮 Boolean Equation Formation

Each segment can also be expressed as a Boolean function of the 4 BCD inputs, `f(b3,b2,b1,b0)`, derived directly from the truth table as a **Sum of Minterms**.

**Example — Segment `f`:** ON for digits `0, 4, 5, 6, 8, 9`:

$$f = \Sigma m(0,4,5,6,8,9)$$

The six invalid BCD combinations can be treated as **don't-care conditions**:

$$f_{d} = \Sigma d(10,11,12,13,14,15)$$

```
Truth Table → Minterms → K-Map → Boolean Equation → RTL Verification
```

### Why Don't-Cares Matter

Since BCD only defines 10 of 16 possible 4-bit patterns, the unused 6 combinations (`10`–`15`) can be freely assigned during K-map minimization — letting larger groupings form and producing simpler, more efficient Boolean equations.

---

## 🧪 Self-Checking Testbench

With **4 input bits**, the full input space is:

$$2^4 = 16 \text{ combinations}$$

The testbench sweeps every value `0000` → `1111`, giving complete coverage.

### Independent Reference Model

Rather than duplicating the DUT's `case` logic, the expected output is generated from an **independent Boolean-equation model** — a stronger verification strategy, since a bug in the `case` statement won't also appear in the reference equations.

```
                 BCD Input
                    │
          ┌─────────┴─────────┐
          ▼                   ▼
      DUT Design        Boolean Reference
          │                   │
          ▼                   ▼
        SEG                 EXP
          │                   │
          └─────────┬─────────┘
                    ▼
                Comparison
                    │
             ┌──────┴──────┐
             ▼             ▼
            PASS          FAIL
```

### Self-Checking Logic

```verilog
if (exp == seg)
    // PASS
else
    // FAIL — reports input, expected, and received values
```

A failure counter tracks mismatches; a clean run reports:

```
RESULT : ALL TEST CASES PASSED
```

---

## 🌊 Simulation Waveform

![Waveform](Images/waveform.png)

Generated via:

```verilog
$dumpfile("waveform.vcd");
$dumpvars(0, seven_seg_tb);
```

The waveform demonstrates the BCD input sweep, the resulting seven-segment output, correct digit decoding, and proper handling of invalid BCD values.

---

## 📂 Project Structure

```
20_bcd_to_7_segment/
├── README.md
├── rtl/
│   └── 7_seg_display.v
├── tb/
│   ├── 7_seg_display_tb.v
│   └── 7_seg_display_self_checking_tb.v
└── Images/
    └── waveform.png
```

---

## ▶️ How to Run

**Basic simulation:**

```bash
iverilog -o 7_seg_display.out rtl/7_seg_display.v tb/7_seg_display_tb.v
vvp 7_seg_display.out
gtkwave waveform.vcd
```

**Self-checking simulation:**

```bash
iverilog -o 7_seg_display_self_checking.out rtl/7_seg_display.v tb/7_seg_display_self_checking_tb.v
vvp 7_seg_display_self_checking.out
```

A successful run reports:

```
RESULT : ALL TEST CASES PASSED
```

---

## 🌟 Applications

BCD-to-7-segment decoding shows up anywhere a binary value needs to be **read at a glance** as a digit:

<table>
<tr>
<td valign="top" width="50%">

**Consumer & Instrumentation**
- Digital clocks & counters
- Calculators
- Digital meters
- Electronic instrumentation

</td>
<td valign="top" width="50%">

**Embedded & FPGA Systems**
- Embedded systems
- FPGA development boards
- Microprocessor systems
- Digital control panels & displays

</td>
</tr>
</table>

---

## 🎓 Learning Outcomes

<table>
<tr>
<td valign="top" width="50%">

**Conceptual**
- BCD & 7-segment fundamentals
- Common Cathode segment encoding
- Sum of minterms & K-map minimization
- Don't-care conditions

</td>
<td valign="top" width="50%">

**Verilog & Verification**
- Behavioral RTL modeling
- `case` / `default` statements
- Independent reference-model verification
- Self-checking, full-coverage testbenches

</td>
</tr>
</table>

---

## 💼 Interview Questions

<details>
<summary><b>1. What does the output vector <code>abcdefg</code> represent?</b></summary>
<br>

Each bit controls one LED segment of the seven-segment display, in the order a, b, c, d, e, f, g — together they form the visual shape of a decimal digit.
</details>

<details>
<summary><b>2. What's the difference between Common Cathode and Common Anode displays?</b></summary>
<br>

In Common Cathode, a logic `1` turns a segment ON. In Common Anode, the polarity is reversed — a logic `0` turns a segment ON. This design uses Common Cathode.
</details>

<details>
<summary><b>3. How does the decoder handle invalid BCD inputs (10–15)?</b></summary>
<br>

Via the `default` case in the `case` statement, which turns all seven segments OFF (`7'b0000000`) for any value outside the valid 0–9 BCD range.
</details>

<details>
<summary><b>4. Why is the <code>default</code> case necessary in a combinational <code>case</code> statement?</b></summary>
<br>

Without it, unlisted input values would leave the output undefined, which can synthesize into unintended latches. `default` guarantees a defined output for every possible input.
</details>

<details>
<summary><b>5. Why can invalid BCD combinations be treated as don't-cares during Boolean minimization?</b></summary>
<br>

Because those inputs (10–15) never legitimately occur in a valid BCD system, their output value is irrelevant — allowing the K-map to group them freely with valid minterms to produce a simpler equation.
</details>

<details>
<summary><b>6. Why does the testbench use a separate Boolean-equation reference model instead of just re-checking the DUT's <code>case</code> statement?</b></summary>
<br>

Because comparing the DUT against an independently derived model (built from Boolean equations rather than the same `case` logic) catches bugs that a self-referential check would miss.
</details>

<details>
<summary><b>7. How many test cases does the self-checking testbench run, and why?</b></summary>
<br>

16 — covering all possible 4-bit input combinations (2⁴), which is the complete input space for this decoder.
</details>

<details>
<summary><b>8. Give the Boolean minterm expression for segment <code>f</code>.</b></summary>
<br>

$$f = \Sigma m(0,4,5,6,8,9)$$

with don't-cares $\Sigma d(10,11,12,13,14,15)$ for the invalid BCD combinations.
</details>

---

## 🚀 Future Work

This project's concepts lead into:

- Parity Generator / Parity Checker
- Digital Counters
- Multiplexed 7-Segment Displays
- Display Controllers
- FSM-Based Display Controllers
- FPGA Display Interfaces

---

## ✅ Conclusion

This project implements a **BCD to 7-Segment Display Decoder** using **behavioral RTL** in Verilog HDL, converting a 4-bit BCD input into the 7-bit segment pattern needed to drive a Common Cathode display.

It introduces the `case` and `default` statements, and connects the RTL implementation to fundamental digital logic theory — **truth tables, minterms, Boolean equations, K-map minimization, and don't-care conditions**.

Verification covers all **16 possible input combinations** via an automated self-checking testbench that independently derives expected outputs from Boolean equations rather than mirroring the DUT's own logic — reinforcing the complete design flow:

```
Digital Logic → Truth Table → Boolean Function → K-Map
     → RTL Design → Testbench → Self-Checking Verification → Waveform Analysis
```

---

<div align="center">

## 👨‍💻 Author

**Padma Charan S S**

**Repository:** Verilog Fundamentals · **Approach:** Project-Driven Learning

### 🗺️ Repository Roadmap

```
Basic Verilog → Logic Gates → 7400 Series ICs → Combinational Circuits
     → Sequential Logic → RTL Design → FPGA Design → Computer Architecture → CPU Design
```

*Every project teaches one new concept through practical implementation.*

---

> *"A seven-segment decoder is where Boolean minimization meets something you can actually read — turning four bits of logic into a digit on a display."*

</div>