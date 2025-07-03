`timescale 1ns/1ps

module tb_if_id;

  logic clk;
  logic rst;

  logic [31:0] pc_in;
  logic [31:0] instruction_in;

  logic [31:0] pc_out;
  logic [31:0] instruction_out;

  // Instantiate the DUT
  IF_ID dut (
    .clk(clk),
    .rst(rst),
    .pc_in(pc_in),
    .instruction_in(instruction_in),
    .pc_out(pc_out),
    .instruction_out(instruction_out)
  );

  // Clock generation
  always #5 clk = ~clk;

  initial begin
    $display("Running IF/ID test...");

    // Initial values
    clk = 0;
    rst = 1;
    pc_in = 32'h0000_0000;
    instruction_in = 32'h0000_0000;

    // Deassert reset after 1 clock cycle
    #10 rst = 0;

    // Apply new PC and instruction values
    #10 pc_in = 32'h0000_0004;
         instruction_in = 32'h00500093;  // ADDI x1, x0, 5

    #10 pc_in = 32'h0000_0008;
         instruction_in = 32'h00108133;  // ADD x2, x1, x1

    #10;
    $finish;
  end

  always_ff @(posedge clk) begin
    $display("Time %0t: PC_IN=%h | INSTR_IN=%h | PC_OUT=%h | INSTR_OUT=%h | RST=%b",
             $time, pc_in, instruction_in, pc_out, instruction_out, rst);
  end

endmodule
