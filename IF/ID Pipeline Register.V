*IF/ID Pipeline Register:
This pipeline register holds the output of the Instruction Fetch (IF) stage and feeds it into the Instruction Decode (ID) stage on the next clock cycle. It stores the fetched instruction and the PC value associated with that instruction.

# The Purpose of IF/ID Pipeline register is :

A) Synchronizes IF → ID stage

B) Buffers data between stages

C) Helps maintain pipeline flow

Block Diagram :- 
          
          +---------------------+
          |   IF/ID Register    |
          |---------------------|
clk  ---> |                     |
rst  ---> |                     |
pc_in --->|                     |---> pc_out
instr_in->|                     |---> instr_out
          +---------------------+
 Inputs: clk, rst, pc_in, instr_in
 Outputs: pc_out, instr_out

# Verilog code for IF/ID Pipeline register:-

// ========================================================================
// Module: IF/ID Pipeline Register
// Description: Holds instruction and PC between IF and ID stages.
//              On reset, clears contents to zero.
// Author: [NISHANT KUMAR JHA]
// Date: [29-06-2025]
// ========================================================================

module IF_ID (
    input  logic        clk,          // Clock signal
    input  logic        rst,          // Active-high synchronous reset
    input  logic [31:0] pc_from_if,        // PC from IF stage
    input  logic [31:0] instruction_from_if,     // Instruction from IF stage
    output logic [31:0] pc_to_id,       // PC to ID stage
    output logic [31:0] instruction_to_id     // Instruction to ID stage
);

    // Internal registers to store values
    logic [31:0] pc_reg;
    logic [31:0] instr_reg;

    // Sequential process: latch inputs at rising clock edge
    always_ff @(posedge clk) begin
        if (rst) begin
            pc_reg    <= 32'd0;
            instr_reg <= 32'd0;
        end
        else begin
            pc_reg    <= pc_from_if;
            instr_reg <= instruction_from_if;
        end
    end

    // Continuous assignments to outputs
    assign pc_to_id    = pc_reg;
    assign instruction_to_id = instr_reg;

endmodule


