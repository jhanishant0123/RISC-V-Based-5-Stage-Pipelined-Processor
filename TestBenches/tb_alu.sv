`timescale 1ns/1ps

module tb_alu;

  logic [31:0] operand1;
  logic [31:0] operand2;
  logic [3:0]  alu_control;
  logic [31:0] alu_out;

  // Instantiate DUT
  ALU dut (
    .operand1(operand1),
    .operand2(operand2),
    .alu_control(alu_control),
    .alu_out(alu_out)
  );

  initial begin
    $display("Running ALU test...");

    operand1 = 32'd10;
    operand2 = 32'd5;

    // ALU control legend (example only — update based on your design mapping)
    // 0000: AND, 0001: OR, 0010: ADD, 0110: SUB, 0111: SLT, 1100: XOR

    // Test AND
    alu_control = 4'b0000; #5;
    $display("AND: %0d & %0d = %0d", operand1, operand2, alu_out);

    // Test OR
    alu_control = 4'b0001; #5;
    $display("OR : %0d | %0d = %0d", operand1, operand2, alu_out);

    // Test ADD
    alu_control = 4'b0010; #5;
    $display("ADD: %0d + %0d = %0d", operand1, operand2, alu_out);

    // Test SUB
    alu_control = 4'b0110; #5;
    $display("SUB: %0d - %0d = %0d", operand1, operand2, alu_out);

    // Test SLT (signed)
    operand1 = 32'd3;
    operand2 = 32'd9;
    alu_control = 4'b0111; #5;
    $display("SLT: %0d < %0d = %0d", operand1, operand2, alu_out);

    // Test XOR
    operand1 = 32'hF0F0_F0F0;
    operand2 = 32'h0F0F_0F0F;
    alu_control = 4'b1100; #5;
    $display("XOR: %h ^ %h = %h", operand1, operand2, alu_out);

    $finish;
  end

endmodule
