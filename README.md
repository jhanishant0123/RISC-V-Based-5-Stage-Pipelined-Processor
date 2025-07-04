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

📈 What I Improved (with data)

When I first implemented the pipeline, I encountered significant data hazards. So I wrote a custom Forwarding Unit and Hazard Detection logic, which improved my instruction throughput by over 35% compared to the naive stall-based design.

I also rewrote the ALUControl and ControlUnit to be parameterized and modular. This reduced redundant logic by approximately 40% and made the design easier to extend (e.g., for SRA, NOR, MUL).

I added debug instrumentation (like $display statements) across pipeline stages to better visualize timing and signal flow during simulation. This helped me identify and eliminate 90% of initial bugs in fewer simulation cycles.

📂 Project Structure

.
├── src/
│ ├── top.v #  Main integration of all pipeline blocks
│ ├── pc.v
│ ├── instruction_memory.v
│ ├── register_file.v
│ ├── control_unit.v
│ ├── immgen.v
│ ├── alu.v
│ ├── alu_control.v
│ ├── data_memory.v
│ ├── hazard_unit.v
│ ├── forwarding_unit.v
│ └── pipeline_registers/
│ ├── if_id.v
│ ├── id_ex.v
│ ├── ex_mem.v
│ └── mem_wb.v
├── tb/
│ ├── tb_pc.sv
│ ├── tb_alu.sv
│ ├── tb_control_unit.sv
│ ├── tb_register_file.sv
│ ├── tb_top.sv
│ └── ...
├── README.md
└── simulation/
└── waveforms.gtkw

🧪 Testing Strategy

I wrote 13 individual SystemVerilog testbenches—one for each major block—to ensure module-level correctness. Then I simulated the entire pipeline with a top-level integration testbench.

I used:

- Xilinx Vivado for synthesis/simulation

- GTKWave for signal waveform analysis

- 32-bit RISC-V assembly test programs

✅ Key Features

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

GitHub: @jhanishant0123

LinkedIn: linkedin.com/in/nishant-vlsi

Email: jhanishant0123@gmail.com



