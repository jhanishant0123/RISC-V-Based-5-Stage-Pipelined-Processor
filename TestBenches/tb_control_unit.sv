`timescale 1ns/1ps

module tb_control_unit;

  logic [6:0] opcode;

  // Outputs from control unit
  logic       reg_write_en;
  logic       mem_read_en;
  logic       mem_write_en;
  logic       mem_to_reg;
  logic       alu_src_select;
  logic       branch_en;
  logic [1:0] alu_op_control;

  // Instantiate DUT
  ControlUnit dut (
    .opcode(opcode),
    .reg_write_en(reg_write_en),
    .mem_read_en(mem_read_en),
    .mem_write_en(mem_write_en),
    .mem_to_reg(mem_to_reg),
    .alu_src_select(alu_src_select),
    .branch_en(branch_en),
    .alu_op_control(alu_op_control)
  );

  initial begin
    $display("Running Control Unit test...");

    // Test R-type: opcode = 0110011 (add/sub)
    opcode = 7'b0110011; #5;
    $display("R-type | ALUop=%b RegWrite=%b MemToReg=%b", alu_op_control, reg_write_en, mem_to_reg);

    // Test I-type: opcode = 0010011 (addi)
    opcode = 7'b0010011; #5;
    $display("I-type | ALUop=%b ALUSrc=%b RegWrite=%b", alu_op_control, alu_src_select, reg_write_en);

    // Test Load: opcode = 0000011 (lw)
    opcode = 7'b0000011; #5;
    $display("LW     | MemRead=%b MemToReg=%b RegWrite=%b", mem_read_en, mem_to_reg, reg_write_en);

    // Test Store: opcode = 0100011 (sw)
    opcode = 7'b0100011; #5;
    $display("SW     | MemWrite=%b ALUSrc=%b", mem_write_en, alu_src_select);

    // Test Branch: opcode = 1100011 (beq)
    opcode = 7'b1100011; #5;
    $display("BEQ    | Branch=%b ALUop=%b", branch_en, alu_op_control);

    $finish;
  end

endmodule
