# RISC-V-Based-5-Stage-Pipelined-Processor

I Designed and Implemented a 5-stage pipelined RISC-V processor with hazard detection and forwarding to enable efficient execution of instructions with minimal stalls.

📌 Pipeline Stages -
The classic 5 stages:

Stage	Name -	Description
1	IF (Instruction Fetch)	Fetch instruction from memory using PC.
2	ID (Instruction Decode)	Decode instruction, read registers, generate control.
3	EX (Execute)	Perform ALU operations, branch target calc, forwarding.
4	MEM (Memory Access)	Access data memory for load/store.
5	WB (Write Back)	Write results back to the register file.

📌 Pipeline Registers -
We use pipeline registers to separate stages:

A) IF/ID
B) ID/EX
C) EX/MEM
D) MEM/WB

📌 Hazard Detection -
Identifies load-use hazards.

Inserts stalls as needed.

📌 Forwarding -
Forwards data from EX/MEM or MEM/WB to EX stage.

Eliminates unnecessary stalls.

📌 Block Diagram -
![Editor _ Mermaid Chart-2025-06-28-140354](https://github.com/user-attachments/assets/adae2db6-0cda-492b-8a4e-f800553b2a15)


📌 Tools that i Used while creating this project :-
1) Verilog HDL

2) Vivado (design + simulation)

3) GTKWave (waveform viewing)

📌 Skills Highlighted
A) CPU microarchitecture

B) Pipeline design

C) Control logic

D) Hazard detection

E) Data forwarding
