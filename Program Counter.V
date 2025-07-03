Program Counter (PC):
It holds the address of the next instruction to fetch from instruction memory. On each clock cycle, it is updated to either the next sequential address (PC + 4) or a branch/jump target address if control logic decides.

         +-------------+
         |   PC Reg    |
         |-------------|
clk ---> |             | ---> pc_out
rst ---> |             |
in_pc -->|             |
         +-------------+
Inputs: clk, rst, in_pc
Output: pc_out

# Verilog code for program counter :-

// ========================================================================
// Module: Program Counter (PC)
// Description: Holds the address of the next instruction.
//              Updates every clock cycle with input next_pc value.
// Author: [NISHANT KUMAR JHA]
// Date: [28-06-2025]
// ========================================================================

module PC(
    input  logic        clk,       // Clock signal
    input  logic        rst,       // Active-high synchronous reset
    input  logic [31:0] next_pc_in,     // Next PC value (from PC + 4 or branch)
    output logic [31:0] pc_value    // Current PC value
);

    // Register to hold the PC value
    logic [31:0] pc_reg;

    // Sequential process to update PC
    always_ff @(posedge clk) begin
        if (rst)
            pc_reg <= 32'd0;        // Reset PC to 0
        else
            pc_reg <= next_pc_in;        // Load next PC
    end

    // Continuous assignment to output
    assign pc_value = pc_reg;

endmodule
