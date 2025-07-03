// Wires for connecting modules
logic [31:0] pc_current, pc_next;
logic [31:0] instruction_if;
logic [31:0] pc_id_stage, instruction_id_stage;

// PC Update logic (simple PC + 4 for now)
assign pc_next = pc_current + 32'd4;

// Module Instantiations

// Program Counter
PC pc_inst (
    .clk(clk),
    .rst(rst),
    .in_pc(pc_next),
    .pc_out(pc_current)
);

// Instruction Memory
InstructionMemory imem (
    .addr(pc_current),
    .instruction(instruction_if)
);

// IF/ID Pipeline Register
IF_ID if_id (
    .clk(clk),
    .rst(rst),
    .pc_in(pc_current),
    .instr_in(instruction_if),
    .pc_out(pc_id_stage),
    .instr_out(instruction_id_stage)
);

// Next: Add RegisterFile, ControlUnit, ID/EX, ALU, etc.

