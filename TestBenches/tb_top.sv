`timescale 1ns/1ps

module tb_top;

  logic clk;
  logic rst;

  // Instantiate the top-level module
  top dut (
    .clk(clk),
    .rst(rst)
  );

  // Clock generation
  always #5 clk = ~clk;

  // Instruction memory preload (optional)
  initial begin
    // Example: preload 3 instructions in IMEM
    // Assuming top module exposes InstructionMemory as dut.imem
    dut.imem.memory[0] = 32'h00500093;  // ADDI x1, x0, 5
    dut.imem.memory[1] = 32'h00108133;  // ADD x2, x1, x1
    dut.imem.memory[2] = 32'h003100B3;  // ADD x1, x2, x3 (forwarding test)
  end

  initial begin
    $display("Starting top-level simulation...");

    clk = 0;
    rst = 1;

    // Reset for 1 cycle
    #10 rst = 0;

    // Let pipeline run for a few cycles
    #100;

    $display("Final Register File State (selected):");
    $display("x1 = %0d", dut.rf.reg_array[1]);
    $display("x2 = %0d", dut.rf.reg_array[2]);
    $display("x3 = %0d", dut.rf.reg_array[3]);
    $display("x4 = %0d", dut.rf.reg_array[4]);

    $finish;
  end

endmodule
