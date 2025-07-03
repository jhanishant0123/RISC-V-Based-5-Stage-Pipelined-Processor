`timescale 1ns/1ps

module tb_immgen;

  logic [31:0] instruction;
  logic [31:0] imm_out;

  // Instantiate DUT
  ImmGen dut (
    .instruction(instruction),
    .imm_out(imm_out)
  );

  initial begin
    $display("Running ImmGen test...");

    // I-type (e.g., ADDI x1, x0, -5) => imm = 0xFFFFFFFB
    instruction = 32'b111111111011_00000_000_00001_0010011; #5;
    $display("I-type  | Imm = %0d (hex %h)", imm_out, imm_out);

    // S-type (e.g., SW x5, -16(x1)) => imm = 0xFFFFFFF0
    instruction = 32'b1111111_00101_00001_010_10000_0100011; #5;
    $display("S-type  | Imm = %0d (hex %h)", imm_out, imm_out);

    // B-type (e.g., BEQ x1, x2, 8) => imm = 0x00000008
    instruction = 32'b000000_00010_00001_000_00100_1100011; #5;
    $display("B-type  | Imm = %0d (hex %h)", imm_out, imm_out);

    // J-type (e.g., JAL x1, 20) => imm = 0x00000014
    instruction = 32'b00000000000101000000000010011011; #5;
    $display("J-type  | Imm = %0d (hex %h)", imm_out, imm_out);

    // U-type (e.g., LUI x5, 0x12345) => imm = 0x12345000
    instruction = 32'b00010010001101000101_00000_0110111; #5;
    $display("U-type  | Imm = %0d (hex %h)", imm_out, imm_out);

    $finish;
  end

endmodule
