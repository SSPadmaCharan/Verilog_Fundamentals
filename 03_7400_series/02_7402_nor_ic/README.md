<div align="center">

#  02 — 7402 Quad 2-Input NOR Gate IC

### Behavioral Modeling & Verification of the 7402 TTL IC

*Project 02 of the **7400 Series ICs** module — [Verilog Fundamentals](#)*

[![Verilog](https://img.shields.io/badge/HDL-Verilog-1f6feb?style=flat-square)](#)
[![Logic Family](https://img.shields.io/badge/Family-74xx%20TTL-6f42c1?style=flat-square)](#)
[![Simulator](https://img.shields.io/badge/Simulator-Icarus%20Verilog-orange?style=flat-square)](#)
[![Waveform](https://img.shields.io/badge/Waveform-GTKWave-2ea44f?style=flat-square)](#)
[![Universal Gate](https://img.shields.io/badge/Gate%20Type-Universal-9b59b6?style=flat-square)](#)
[![Status](https://img.shields.io/badge/Status-Verified%20✔-brightgreen?style=flat-square)](#)

</div>

---

##  Overview

This project models and verifies the **7402 Quad 2-Input NOR Gate IC** in Verilog HDL. Like the 7400, it packages **four independent gates** into a single 14-pin DIP — but this time built from **NOR**, one of the two Universal Gates, capable of implementing any digital logic function on its own.

The 7402 belongs to the **74xx TTL logic family** and is a staple in latches, state machines, and control logic where NOR's "output HIGH only when everything is LOW" behavior is exactly what's needed.

**In this project you will:**

- 🔹 Understand the 7402 as a real-world Universal Gate IC
- 🔹 Model a Quad NOR Gate IC's internal architecture
- 🔹 Map out its 14-pin DIP pinout
- 🔹 Behaviorally model all four gates in one Verilog module
- 🔹 Verify each gate independently with a testbench
- 🔹 Simulate with Icarus Verilog and inspect with GTKWave

---

##  Prerequisites

| Topic | Why it matters |
|---|---|
| Basic Digital Electronics | Understand IC-level organization |
| NOR Gate (Logic Gates §04) | Core logic function replicated 4× |
| Universal Gates | Context for NOR's importance |
| Continuous Assignment (`assign`) | Model each gate's behavior |
| Verilog Module Declaration | Structure a multi-gate IC |
| Testbench Fundamentals | Stimulate and verify the DUT |
| 7400 IC (Project 01) | Directly analogous IC organization |

---

##  Theory

The **7402** is a **Quad 2-Input NOR Gate IC** containing **four completely independent NOR gates** in one package, each capable of operating simultaneously.

Each gate implements:

$$Y = \overline{A + B} \quad \text{(Verilog: } Y = \sim(A \mathbin{|} B)\text{)}$$

By **De Morgan's Law**, this is equivalent to:

$$Y = \bar{A} \cdot \bar{B} \quad \text{(Verilog: } Y = \sim A \mathbin{\&} \sim B\text{)}$$

Since each gate has **2 inputs**, every gate has:

$$2^2 = 4$$

possible input combinations.

---

##  Internal Architecture

```
                        7402 IC
   ┌─────────────────────────────────────────────┐
   │                                                │
   │   Gate 1  ⎡A1,B1→Y1⎤     Gate 2  ⎡A2,B2→Y2⎤   │
   │                                                │
   │   Gate 3  ⎡A3,B3→Y3⎤     Gate 4  ⎡A4,B4→Y4⎤   │
   │                                                │
   └─────────────────────────────────────────────┘
```

Each gate has its own dedicated inputs and output, while all four share a common **VCC** and **GND**.

---

## 📍 Pin Configuration

**14-Pin DIP Package**

```
              ┌─── ⏦ ───┐
       1Y  ── │1      14│ ── VCC
       1A  ── │2      13│ ── 4Y
       1B  ── │3      12│ ── 4B
       2Y  ── │4      11│ ── 4A
       2A  ── │5      10│ ── 3Y
       2B  ── │6       9│ ── 3B
      GND  ── │7       8│ ── 3A
              └──────────┘
```

| Pin | Signal | Pin | Signal |
|:-:|:--|:-:|:--|
| 1 | 1Y (Gate 1 output) | 8 | 3A (Gate 3 input) |
| 2 | 1A (Gate 1 input) | 9 | 3B (Gate 3 input) |
| 3 | 1B (Gate 1 input) | 10 | 3Y (Gate 3 output) |
| 4 | 2Y (Gate 2 output) | 11 | 4A (Gate 4 input) |
| 5 | 2A (Gate 2 input) | 12 | 4B (Gate 4 input) |
| 6 | 2B (Gate 2 input) | 13 | 4Y (Gate 4 output) |
| 7 | **GND** | 14 | **VCC** (+5V) |

>  **Power pins:** Pin 14 → VCC (+5V) · Pin 7 → GND
>
> Note the pinout differs from the 7400 — each gate's **output is listed first**, adjacent to its inputs, rather than following them.

---

##  Truth Table

*(applies identically to all four gates)*

| A | B | Y |
|:-:|:-:|:-:|
| 0 | 0 | **1** |
| 0 | 1 | 0 |
| 1 | 0 | 0 |
| 1 | 1 | 0 |

---

##  Verilog Model

The IC is modeled as a single module containing **four independent NOR gates**, each driven by continuous assignment:

```verilog
module ic_7402 (
    input  wire a1, b1,   input  wire a2, b2,
    input  wire a3, b3,   input  wire a4, b4,
    output wire y1, y2, y3, y4
);

    assign y1 = ~(a1 | b1);   // Gate 1
    assign y2 = ~(a2 | b2);   // Gate 2
    assign y3 = ~(a3 | b3);   // Gate 3
    assign y4 = ~(a4 | b4);   // Gate 4

endmodule
```

| Element | Purpose |
|---|---|
| `a1,b1 … a4,b4` | Independent input pairs for each gate |
| `y1 … y4` | Independent outputs, one per gate |
| `assign yN = ~(aN \| bN);` | Behavioral model of each NOR gate |

---

##  Testbench Strategy

The testbench exercises **each of the four gates independently**, applying all four input combinations to verify every gate matches the NOR truth table on its own.

### Expected Results *(per gate)*

| A | B | Y |
|:-:|:-:|:-:|
| 0 | 0 | **1** |
| 0 | 1 | 0 |
| 1 | 0 | 0 |
| 1 | 1 | 0 |

Since all four gates are functionally identical, the same truth table validates Gates 1–4.

---

##  Waveform

![Waveform](waveform.png)

### Waveform Analysis

| Condition | Output | Explanation |
|---|:-:|---|
| Both inputs LOW | **HIGH** | ✅ matches NOR behavior |
| Either input HIGH | **LOW** | ✅ matches NOR behavior |
| Both inputs HIGH | **LOW** | ✅ matches NOR behavior |

The waveform confirms all four NOR gates behave **correctly and independently**, with no interaction between gates beyond the shared power supply.

---

##  Applications

The 7402 IC's NOR-based Universal Gate behavior makes it central to:

<table>
<tr>
<td valign="top" width="50%">

**Memory & State**
- SR latches
- Flip-flops
- Finite state machines

</td>
<td valign="top" width="50%">

**Control & Logic**
- Control logic
- Address decoding
- Digital control systems

</td>
</tr>
</table>

---

##  Project Structure

```
02_7402_nor_ic/
├── README.md
├── 7402_nor_ic.v          # RTL design
├── 7402_nor_ic_tb.v        # Testbench
└── waveform.png                # GTKWave capture
```

---

##  How to Run

```bash
# 1. Compile design + testbench
iverilog -o 7402_nor_ic.out 7402_nor_ic.v 7402_nor_ic_tb.v

# 2. Run the simulation
vvp 7402_nor_ic.out

# 3. View waveform in GTKWave
gtkwave waveform.vcd
```

---

##  Key Concepts Learned

<table>
<tr>
<td valign="top" width="50%">

**IC & Hardware Concepts**
- 74xx TTL logic family
- Quad NOR Gate IC architecture
- 14-pin DIP package layout
- Pin configuration & power pins

</td>
<td valign="top" width="50%">

**Verilog & Verification**
- Multi-gate behavioral modeling
- De Morgan's Law
- Testbench design & functional verification
- Icarus Verilog & GTKWave

</td>
</tr>
</table>

---

##  Learning Notes

This project extended the IC-modeling approach from the 7400 to a **Universal Gate IC**, reinforcing that the same behavioral-modeling pattern — four independent gates, shared power, individual verification — applies across different logic families.

Comparing the 7402's pinout to the 7400's also highlighted that **pin ordering isn't standardized across gate types** — always check the datasheet rather than assuming a layout carries over.

**Skills reinforced:**
- Multi-gate behavioral modeling
- Real-world IC pinout interpretation
- Independent-block functional verification
- Universal gate theory in a commercial-IC context
- RTL simulation workflow

---

## Interview Questions

<details>
<summary><b>1. What is the 7402 IC?</b></summary>
<br>

A **Quad 2-Input NOR Gate Integrated Circuit** belonging to the **74xx TTL logic family**.
</details>

<details>
<summary><b>2. How many NOR gates are inside a 7402 IC?</b></summary>
<br>

Four independent 2-input NOR gates.
</details>

<details>
<summary><b>3. How many pins does the 7402 IC have?</b></summary>
<br>

14 pins.
</details>

<details>
<summary><b>4. Which pins provide power?</b></summary>
<br>

Pin 14 → VCC (+5V) · Pin 7 → GND
</details>

<details>
<summary><b>5. What Boolean equation does each gate implement?</b></summary>
<br>

$$Y = \overline{A + B}$$
</details>

<details>
<summary><b>6. Why is the 7402 called a Universal Gate IC?</b></summary>
<br>

Because NOR gates can be combined to implement any Boolean function — the same universality property as the individual NOR gate, now packaged in real hardware.
</details>

<details>
<summary><b>7. Can all four NOR gates operate simultaneously?</b></summary>
<br>

Yes — each gate is fully independent and operates simultaneously, sharing only the power supply.
</details>

<details>
<summary><b>8. Why should unused gate inputs never be left floating?</b></summary>
<br>

Floating inputs pick up electrical noise and can produce unpredictable output behavior. Unused inputs should always be tied to a defined logic level.
</details>

---

##  Next Project

### [03 — 7404 Hex Inverter IC →](#)

Coming up:
- 7404 IC architecture
- Hex Inverter design (six NOT gates in one package)
- 14-pin package organization
- Behavioral modeling & RTL simulation
- Waveform analysis

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

> *"The 7402 NOR IC demonstrates how a universal gate can be packaged into a practical integrated circuit, bridging Boolean logic with real-world digital hardware."*

</div>