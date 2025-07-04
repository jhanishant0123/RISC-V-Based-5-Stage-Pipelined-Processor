`timescale 1ns/1ps

module tb_mem_wb;

  logic clk;
  logic rst;

  // Inputs
  logic [31:0] read_data_in;
  logic [31:0] alu_result_in;
  logic [4:0]  rd_mem_in;
  logic        reg_write_mem_in;
  logic        mem_to_reg_mem_in;

  // Outputs
  logic [31:0] read_data_out;
  logic [31:0] alu_result_out;
  logic [4:0]  rd_mem_out;
  logic        reg_write_mem_out;
  logic        mem_to_reg_mem_out;

  // Instantiate DUT
  MEM_WB dut (
    .clk(clk),
    .rst(rst),
    .read_data_in(read_data_in),
    .alu_result_in(alu_result_in),
    .rd_mem_in(rd_mem_in),
    .reg_write_mem_in(reg_write_mem_in),
    .mem_to_reg_mem_in(mem_to_reg_mem_in),

    .read_data_out(read_data_out),
    .alu_result_out(alu_result_out),
    .rd_mem_out(rd_mem_out),
    .reg_write_mem_out(reg_write_mem_out),
    .mem_to_reg_mem_out(mem_to_reg_mem_out)
  );

  // Clock generation
  always #5 clk = ~clk;

  initial begin
    $display("Running MEM/WB pipeline register test...");

    // Initialization
    clk = 0;
    rst = 1;
    read_data_in = 32'h0;
    alu_result_in = 32'h0;
    rd_mem_in = 5'd0;
    reg_write_mem_in = 0;
    mem_to_reg_mem_in = 0;

    // Release reset
    #10 rst = 0;

    // Apply values for one clock cycle
    #10;
    read_data_in = 32'hCAFE_BABE;
    alu_result_in = 32'hDEAD_BEEF;
    rd_mem_in = 5'd12;
    reg_write_mem_in = 1;
    mem_to_reg_mem_in = 1;

    #10;
    $display("MEM/WB Outputs:");
    $display("ReadData  = %h", read_data_out);
    $display("ALUResult = %h", alu_result_out);
    $display("RD        = %0d", rd_mem_out);
    $display("Control   = RegWrite=%b, MemToReg=%b", reg_write_mem_out, mem_to_reg_mem_out);

    #10 $finish;
  end

endmodule
