`timescale 1ns/1ps

module tb_instruction_memory;

  logic [31:0] addr;
  logic [31:0] instruction;

  // DUT instantiation
  InstructionMemory dut (
    .addr(addr),
    .instruction(instruction)
  );

  // Initialize dummy instruction memory manually
  initial begin
    // Preload memory (optional)
    // You can manually modify the DUT or load from a .hex file
    dut.memory[0] = 32'h00000013;  // NOP (ADDI x0, x0, 0)
    dut.memory[1] = 32'h00500093;  // ADDI x1, x0, 5
    dut.memory[2] = 32'h00108133;  // ADD x2, x1, x1
  end

  // Test sequence
  initial begin
    $display("Running InstructionMemory test...");

    addr = 32'd0;  #5;
    $display("Addr: 0 => Instruction: %h", instruction);

    addr = 32'd4;  #5;
    $display("Addr: 4 => Instruction: %h", instruction);

    addr = 32'd8;  #5;
    $display("Addr: 8 => Instruction: %h", instruction);

    addr = 32'd12; #5;
    $display("Addr: 12 => Instruction: %h (should be 0)");

    $finish;
  end

endmodule
