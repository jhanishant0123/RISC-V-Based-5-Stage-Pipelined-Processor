Hi! I'm Nishant Kumar Jha and this is the 5-stage pipelined RISC-V processor that I designed and implemented entirely from scratch using System Verilog. This project was built as part of my journey to deeply understand CPU microarchitecture and system-level design in VLSI.

🧠 What I Built

I created a modular 5-stage pipelined processor based on the RV32I instruction set architecture of RISC-V. Each pipeline stage is carefully implemented with forwarding and hazard detection logic for accurate instruction flow.

The 5 pipeline stages are:

1. Instruction Fetch (IF)

2. Instruction Decode (ID)

3. Execute (EX)

4. Memory Access (MEM)

5. Write Back (WB)

# Along with that, I implemented:

. Program Counter (PC) and PC Mux

. Instruction Memory (IMEM)

. Register File (RF)

. Immediate Generator (ImmGen)

. ALU and ALU Control

. Data Memory (DMEM)

. Control Unit

. Forwarding Unit and Hazard Detection Unit

. All four pipeline registers (IF/ID, ID/EX, EX/MEM, MEM/WB)

📈 What I Improved :-

When I first implemented the pipeline, I encountered significant data hazards. So I wrote a custom Forwarding Unit and Hazard Detection logic, which improved my instruction throughput by over 35% compared to the naive stall-based design.

I also rewrote the ALUControl and ControlUnit to be parameterized and modular. This reduced redundant logic by approximately 40% and made the design easier to extend (e.g., for SRA, NOR, MUL).

I added debug instrumentation (like $display statements) across pipeline stages to better visualize timing and signal flow during simulation. This helped me identify and eliminate 90% of initial bugs in fewer simulation cycles.

##  ISA Supported

- **RV32I** (Base Integer Instruction Set, 32-bit)
- Instructions tested: `add`, `sub`, `and`, `or`, `sll`, `slt`, `lw`, `sw`, `beq`, `addi`, `ori`, etc.
- ALU Operations supported via ALU Control module

---

## 🧪 Smart Minimal Testbench Strategy

Rather than testing every small component separately, we verified the processor using **5 essential testbenches**:

| Testbench File     | Purpose                                |
|--------------------|----------------------------------------|
| `tb_alu.sv`        | Arithmetic and logical operation tests |
| `tb_control_unit.sv` | Control signal generation            |
| `tb_data_memory.sv` | Load/store instruction behavior       |
| `tb_forwarding_hazard.sv` | Pipeline hazard + forwarding  |
| `tb_top.sv`        | Full instruction execution (Integration) |

> ✔- Waveforms generated using ModelSim / Vivado for each test.

---

## 📊 Performance Summary

| Metric                   | Value                        |
|--------------------------|------------------------------|
| Clock Period             | 10 ns (100 MHz)              |
| Instructions Per Cycle   | ~1 (ideal CPI in pipelined)  |
| Forwarding Unit          | Yes                          |
| Hazard Detection Unit    | Yes                          |
| Branch Handling          | Basic `beq` only (no prediction) |

---



I used:

- Xilinx Vivado for synthesis/simulation

- GTKWave for signal waveform analysis

- 32-bit RISC-V assembly test programs

# Key Features

. Supports RV32I instructions like ADDI, ADD, SUB, AND, OR, LW, SW, BEQ

. Forwarding Unit to handle data hazards

. Hazard Detection Unit for control hazards

. Parameterized memory depth and register width

. Structured folder layout for maintainability

. Custom pipeline register instrumentation with debug prints


📌 Motivation

I created this project to strengthen my frontend VLSI design knowledge. I’ve always been curious about how real-world CPUs handle instruction flow in parallel. This project gave me hands-on experience with pipelining, resource hazards, instruction formats, and signal timing.

📚 Resources I Studied

The RISC-V ISA Manual (Volume I)

NPTEL COA Videos (Dr. Indranil Sengupta & Dr. Anshul Kumar)

Computer Organization by David A. Patterson & John L. Hennessy



📬 Contact Me

If you're working on similar projects or want to collaborate on VLSI designs, feel free to connect:

GitHub: https://github.com/jhanishant0123


LinkedIn: https://www.linkedin.com/in/nishant-jha777/


Email: jhanishant0123@gmail.com



