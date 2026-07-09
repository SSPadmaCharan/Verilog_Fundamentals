<div align="center">

#  7400 Series — TTL Logic ICs

### From Boolean Logic to Real Integrated Circuits

*Section 03 of the **Verilog Fundamentals** repository*

[![Verilog](https://img.shields.io/badge/HDL-Verilog-1f6feb?style=flat-square)](#)
[![Logic Family](https://img.shields.io/badge/Family-74xx%20TTL-6f42c1?style=flat-square)](#)
[![Simulator](https://img.shields.io/badge/Simulator-Icarus%20Verilog-orange?style=flat-square)](#)
[![Waveform](https://img.shields.io/badge/Waveform-GTKWave-2ea44f?style=flat-square)](#)
[![Projects](https://img.shields.io/badge/Projects-6-blueviolet?style=flat-square)](#)

</div>

---

##  About This Section

The **7400 Series** is one of the most widely used families of **Transistor-Transistor Logic (TTL)** integrated circuits. Each IC packages standardized digital logic functions — NAND, NOR, NOT, AND, OR, XOR — into a common form factor, making them foundational building blocks in digital electronics history.

Where the previous chapter (**Logic Gates**) implemented individual gates as isolated Boolean functions, this chapter models **complete integrated circuits** — multiple gates, real pinouts, and shared power rails, all within a single package.

> This is the bridge between *"Y = A & B"* and an actual chip you could solder onto a breadboard.

---

##  Objectives

By working through this section, you will:

- 🔹 Understand the 74xx TTL logic family and its historical significance
- 🔹 Learn how digital logic ICs are internally organized
- 🔹 Study the standard 14-pin **Dual In-line Package (DIP)** form factor
- 🔹 Read and interpret pin configurations and internal architectures
- 🔹 Behaviorally model commercial logic ICs in Verilog HDL
- 🔹 Verify IC functionality with dedicated testbenches
- 🔹 Analyze results using GTKWave waveforms
- 🔹 Bridge digital electronics theory with practical RTL design

---

##  Prerequisites

| Topic | Why it matters |
|---|---|
| Basic Digital Electronics | Understand IC-level organization |
| Verilog Fundamentals | Module structure, syntax basics |
| Continuous Assignment (`assign`) | Model each internal gate |
| Logic Gates (NOT, AND, OR, NOR, NAND, XOR) | The functions each IC packages |
| Testbench Development | Verify multi-gate behavior |
| RTL Simulation | Icarus Verilog + GTKWave workflow |

---

##  What Is the 74xx Series?

The **74xx Series** is a family of digital logic ICs originally built on **TTL (Transistor-Transistor Logic)** technology. Each part number performs one specific digital logic function while sharing a standardized package and pin arrangement — meaning once you understand one 74xx IC, the rest follow the same mental model.

| IC Number | Function |
|:-:|---|
| **7400** | Quad 2-Input NAND Gate |
| **7402** | Quad 2-Input NOR Gate |
| **7404** | Hex Inverter (NOT Gate) |
| **7408** | Quad 2-Input AND Gate |
| **7432** | Quad 2-Input OR Gate |
| **7486** | Quad 2-Input XOR Gate |

These ICs have powered digital systems, teaching labs, embedded hardware, and industrial electronics for decades — and many are still manufactured today.

---

##  Why Study the 74xx Series?

Learning the 74xx series connects three layers of digital engineering that are often taught in isolation:

```
Digital Logic  ──▶  Integrated Circuits  ──▶  Verilog HDL
```

Instead of treating logic gates as pure Boolean expressions, this section shows how they're **packaged, pinned out, and powered** in real hardware — a perspective that pays off in:

<table>
<tr>
<td valign="top" width="50%">

- Digital circuit design
- FPGA development
- RTL design

</td>
<td valign="top" width="50%">

- VLSI design
- Computer architecture
- Embedded systems

</td>
</tr>
</table>

---

##  Projects in This Section

| # | IC | Function | Status |
|:-:|:--|:--|:-:|
| 01 | [`7400`](./01_7400_nand_ic) | Quad 2-Input **NAND** Gate IC | ✅ |
| 02 | [`7402`](./02_7402_nor_ic) | Quad 2-Input **NOR** Gate IC | ✅ |
| 03 | [`7404`](./03_7404_not_ic) | **Hex Inverter** (NOT Gate) IC | ✅ |
| 04 | [`7408`](./04_7408_and_ic) | Quad 2-Input **AND** Gate IC | ✅ |
| 05 | [`7432`](./05_7432_or_ic) | Quad 2-Input **OR** Gate IC | ✅ |
| 06 | [`7486`](./06_7486_xor_ic) | Quad 2-Input **XOR** Gate IC | ✅ |

Each project folder includes:

- 📄 RTL design (`.v`)
- 🧪 Testbench (`.v`)
- 🌊 Waveform capture (`.png`)
- 📘 Professional documentation (`README.md`)

---

##  Chapter Structure

```
03_7400_series/
├── README.md
│
├── 01_7400_nand_ic/
├── 02_7402_nor_ic/
├── 03_7404_not_ic/
├── 04_7408_and_ic/
├── 05_7432_or_ic/
└── 06_7486_xor_ic/
```

---

##  Tools Used

<table>
<tr>
<td align="center" width="20%"><b>VS Code</b><br>Development</td>
<td align="center" width="20%"><b>Icarus Verilog</b><br>Simulation</td>
<td align="center" width="20%"><b>GTKWave</b><br>Waveform Analysis</td>
<td align="center" width="20%"><b>Git</b><br>Version Control</td>
<td align="center" width="20%"><b>GitHub</b><br>Repository Hosting</td>
</tr>
</table>

---

##  Learning Outcomes

After completing this chapter, you will be able to:

- ✅ Read and interpret basic digital IC datasheets
- ✅ Identify and recall common TTL logic ICs by part number
- ✅ Explain the internal gate organization of each IC
- ✅ Behaviorally model commercial ICs in Verilog
- ✅ Verify functional behavior through simulation
- ✅ Connect theoretical logic design with practical hardware implementation

---

##  Why the 74xx Series Still Matters

The 74xx series represents one of the earliest standardized digital logic families and laid the groundwork for how modern digital hardware is organized. While contemporary systems lean heavily on programmable devices like FPGAs and ASICs, understanding these ICs offers a grounded, physical intuition for how digital logic is actually implemented in silicon.

It's the missing link between writing `assign y = a & b;` and understanding what that line meant on a real circuit board.

---

<div align="center">

##  Author

**Padma Charan S S**

**Repository:** Verilog Fundamentals · **Approach:** Project-Driven Learning

### 🗺️ Repository Roadmap

```
Basic Verilog → Logic Gates → 7400 Series ICs → Combinational Circuits
     → Sequential Logic → Finite State Machines → Memory Design
          → RTL Projects → CPU Design
```

*Every chapter builds upon the concepts learned in the previous one.*

---

> *"Understanding the 74xx series transforms digital logic from abstract Boolean equations into real-world integrated circuits, bridging theory with practical hardware design."*

</div>