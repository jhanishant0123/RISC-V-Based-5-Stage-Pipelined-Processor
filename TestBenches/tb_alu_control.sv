`timescale 1ns/1ps

module tb_alu_control;

  logic [1:0] alu_op;       // From Control Unit
  logic [2:0] funct3;       // From instruction
  logic       funct7_bit;   // Usually instruction[30]
  logic [3:0] alu_ctrl;     // ALU control output

  // Instantiate DUT
  ALUControl dut (
    .alu_op(alu_op),
    .funct3(funct3),
    .funct7_bit(funct7_bit),
    .alu_ctrl(alu_ctrl)
  );

  initial begin
    $display("Running ALUControl test...");

    // ALUOp = 10 → R-type
    // Test ADD: funct3 = 000, funct7 = 0
    alu_op = 2'b10;
    funct3 = 3'b000;
    funct7_bit = 1'b0; #5;
    $display("R-type ADD  -> ALU ctrl = %b", alu_ctrl);

    // Test SUB: funct3 = 000, funct7 = 1
    funct7_bit = 1'b1; #5;
    $display("R-type SUB  -> ALU ctrl = %b", alu_ctrl);

    // Test AND: funct3 = 111
    funct3 = 3'b111;
    funct7_bit = 1'b0; #5;
    $display("R-type AND  -> ALU ctrl = %b", alu_ctrl);

    // Test OR: funct3 = 110
    funct3 = 3'b110;
    funct7_bit = 1'b0; #5;
    $display("R-type OR   -> ALU ctrl = %b", alu_ctrl);

    // ALUOp = 00 → Load/Store → ADD
    alu_op = 2'b00; #5;
    $display("LW/SW default -> ALU ctrl = %b", alu_ctrl);

    // ALUOp = 01 → Branch (BEQ) → SUB
    alu_op = 2'b01; #5;
    $display("BEQ default  -> ALU ctrl = %b", alu_ctrl);

    $finish;
  end

endmodule
