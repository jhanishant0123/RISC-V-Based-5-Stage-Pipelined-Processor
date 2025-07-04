`timescale 1ns/1ps

module tb_top;

  logic clk;
  logic rst;

  // Instantiate the top-level pipeline CPU
  top dut (
    .clk(clk),
    .rst(rst)
  );

  // Clock generation
  always #5 clk = ~clk;

  // Instruction memory preload (simulate loaded program)
  initial begin
    // Load simple program into instruction memory
    // ADDI x1, x0, 5    --> x1 = 5
    // ADD  x2, x1, x1   --> x2 = x1 + x1 = 10
    // ADD  x3, x2, x1   --> x3 = x2 + x1 = 15
    dut.inst_IM.memory[0] = 32'h00500093;  // ADDI x1, x0, 5
    dut.inst_IM.memory[1] = 32'h00108133;  // ADD  x2, x1, x1
    dut.inst_IM.memory[2] = 32'h001102B3;  // ADD  x5, x2, x1 (x5 = 15)
  end

  initial begin
    $display("🔁 Starting pipeline simulation...");
    clk = 0;
    rst = 1;

    // Hold reset for first 10ns
    #10 rst = 0;

    // Let simulation run through a few clock cycles
    #100;

    $display("\n✅ Final Register File Snapshot:");
    $display("x1 = %0d", dut.inst_RF.reg_array[1]);
    $display("x2 = %0d", dut.inst_RF.reg_array[2]);
    $display("x5 = %0d", dut.inst_RF.reg_array[5]);

    $finish;
  end

endmodule
