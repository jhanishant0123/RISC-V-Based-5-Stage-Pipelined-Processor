`timescale 1ns/1ps

module tb_pc;

  logic clk;
  logic rst;
  logic [31:0] pc_in;
  logic [31:0] pc_out;

  // Instantiate the PC module
  PC dut (
    .clk(clk),
    .rst(rst),
    .pc_in(pc_in),
    .pc_out(pc_out)
  );

  // Clock generation
  always #5 clk = ~clk;

  initial begin
    $display("Running PC test...");

    // Initialize signals
    clk = 0;
    rst = 1;
    pc_in = 32'h0000_0004;

    // Reset the PC
    #10 rst = 0;

    // Drive PC input and observe output
    #10 pc_in = 32'h0000_0008;
    #10 pc_in = 32'h0000_000C;

    // Finish simulation
    #20;
    $finish;
  end

  always_ff @(posedge clk) begin
    $display("Time: %0t | PC_in = %h | PC_out = %h | rst = %b", $time, pc_in, pc_out, rst);
  end

endmodule
