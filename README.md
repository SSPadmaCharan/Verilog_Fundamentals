<div align="center">

#  Verilog Fundamentals

### A Project-Driven Journey from Digital Logic to CPU Design

[![Verilog](https://img.shields.io/badge/Language-Verilog%20HDL-blue.svg)](https://en.wikipedia.org/wiki/Verilog)
[![Simulator](https://img.shields.io/badge/Simulator-Icarus%20Verilog-orange.svg)](http://iverilog.icarus.com/)
[![Waveform](https://img.shields.io/badge/Viewer-GTKWave-green.svg)](http://gtkwave.sourceforge.net/)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Progress](https://img.shields.io/badge/Progress-2%2F9%20Modules-informational.svg)]()
[![Status](https://img.shields.io/badge/Status-Actively%20Building-brightgreen.svg)]()

*Documenting the path from basic gates to a self-designed CPU — one verified RTL project at a time.*

</div>

---

##  Overview

This repository is a structured, hands-on collection of **Verilog HDL** projects built while learning **Digital Electronics, Computer Architecture, FPGA Design, and VLSI Design**.

Rather than treating Verilog as a series of isolated code snippets, every concept here is carried through a complete engineering cycle — **designed, simulated, verified, and documented** — as an independent, self-contained project.

Each project ships with:

| 🧩 | Component |
|:--:|-----------|
| 🛠️ | RTL Design |
| 🧪 | Testbench |
| ▶️ | Simulation |
| 🌊 | GTKWave Verification |
| 📄 | Documentation |
| 📝 | Learning Notes |
| 💼 | Interview Questions |

The aim is to build genuine RTL fluency by mirroring the workflow used in real semiconductor design teams — not just to accumulate code.

---

##  Repository Roadmap

```
Digital Electronics → Basic Verilog Syntax → Logic Gates → 7400 Series ICs
        → Combinational Circuits → Vectors & Operators → Procedural Blocks
        → Sequential Circuits → Finite State Machines → RTL Projects
        → FPGA Design → Computer Architecture → CPU Design
```

Each stage builds directly on the one before it — no concept is introduced without its foundation already in place.

---

##  Repository Structure

```text
Verilog_Fundamentals/
│
├── README.md
├── LICENSE
├── .gitignore
│
├── 01_basic_syntax/
│   ├── 01_simple_wire/
│   ├── 02_multiple_wire/
│   └── ...
│
├── 02_logic_gates/
├── 03_7400_series/
├── 04_combinational_circuits/
├── 05_vectors/
├── 06_procedural_blocks/
├── 07_sequential_circuits/
├── 08_finite_state_machines/
├── 09_projects/
│
├── Docs/
└── Images/
```

---

##  Engineering Workflow

Every project — regardless of complexity — follows the same disciplined cycle:

```
Understand the Concept  →  Design the RTL  →  Write the Testbench
        →  Compile (Icarus Verilog)  →  Run Simulation
        →  Verify (GTKWave)  →  Document Everything  →  Commit to GitHub
```

This consistency reinforces both **digital design fundamentals** and **professional engineering habits** — version control, documentation, and verification discipline included.

---

##  Learning Objectives

- Master Verilog HDL from fundamentals to advanced constructs
- Build strong intuition for combinational and sequential logic design
- Develop clean, reusable RTL modules
- Write structured, exhaustive testbenches
- Perform functional verification using GTKWave
- Sharpen debugging and simulation skills
- Scale up to increasingly complex digital systems through modular design
- Build a foundation for FPGA development and ASIC/VLSI design

---

##  Development Environment

| Tool | Role |
|------|------|
| **Visual Studio Code** | Code editor |
| **Icarus Verilog** | Verilog compiler & simulator |
| **GTKWave** | Waveform viewer |
| **Git** | Version control |
| **GitHub** | Repository hosting |

---

##  Current Progress

<table>
<tr><th>Module</th><th>Status</th></tr>

<tr><td><b>01 · Basic Syntax</b></td>
<td>

- [x] Simple Wire
- [x] Multiple Wire

</td></tr>

<tr><td><b>02 · Logic Gates</b></td>
<td>

- [ ] NOT Gate
- [ ] AND Gate
- [ ] OR Gate
- [ ] NAND Gate
- [ ] NOR Gate
- [ ] XOR Gate
- [ ] XNOR Gate

</td></tr>

<tr><td><b>03 · 7400 Series</b></td><td>🔜 Coming Soon</td></tr>
<tr><td><b>04 · Combinational Circuits</b></td><td>🔜 Coming Soon</td></tr>
<tr><td><b>05 · Vectors & Operators</b></td><td>🔜 Coming Soon</td></tr>
<tr><td><b>06 · Procedural Blocks</b></td><td>🔜 Coming Soon</td></tr>
<tr><td><b>07 · Sequential Circuits</b></td><td>🔜 Coming Soon</td></tr>
<tr><td><b>08 · Finite State Machines</b></td><td>🔜 Coming Soon</td></tr>
<tr><td><b>09 · RTL Projects</b></td><td>🔜 Coming Soon</td></tr>

</table>

**Overall:** `2 / ~25+ planned projects complete` — actively in progress.

---

##  Running Any Project

```bash
# 1. Compile design + testbench
iverilog -o output.out design.v design_tb.v

# 2. Run the simulation
vvp output.out

# 3. View the waveform
gtkwave waveform.vcd
```

Every project folder is self-contained — clone the repo, `cd` into any project directory, and run the three commands above.

---

##  Repository Goals

- Build a strong, provable RTL design foundation
- Practice professional-grade technical documentation
- Sharpen functional verification skills
- Maintain a structured, searchable learning archive
- Assemble a genuine portfolio of Verilog projects
- Progress steadily toward FPGA design, computer architecture, and CPU design

Every project is scoped to teach **exactly one new concept**, while continuously reinforcing everything learned before it.

---

##  Future Roadmap

Once this foundation is complete, the next milestones are:

| Stage | Focus |
|-------|-------|
| **SystemVerilog** | Advanced HDL constructs & verification |
| **RTL Design** | Larger, production-style modules |
| **FPGA Development** | Real hardware deployment |
| **CMOS Digital VLSI Design** | Transistor-level understanding |
| **Static Timing Analysis** | Timing closure & signoff |
| **Physical Design** | Place & route fundamentals |
| **Computer Architecture** | Pipelines, memory, ISAs |
| **RISC-V Processor Design** | Open ISA implementation |
| **Custom CPU Design** | The capstone goal |

---

<div align="center">

##  About Me

**Padma Charan S S**
*Electrical and Electronics Engineering Student*

Currently learning `Verilog HDL` · `Digital Design` · `Computer Architecture` · `FPGA Development` · `VLSI Design`

**Learning Method:** Project-Driven Learning

</div>

---

##  Repository Vision

This repository isn't a pile of Verilog snippets — it's a structured engineering portfolio built to demonstrate the **complete workflow of digital hardware development**: writing RTL, verifying it rigorously, documenting it clearly, and maintaining it under version control like a real project.

As it grows, it will evolve from simple combinational circuits into complete digital systems — and eventually, into FPGA implementations and an original CPU design.

---

<div align="center">

*"Every project is another step toward becoming a better RTL engineer."*

</div>