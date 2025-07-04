`timescale 1ns/1ps

module tb_ex_mem;

  logic clk;
  logic rst;

  // Inputs
  logic [31:0] alu_out_in;
  logic [31:0] store_data_in;
  logic [4:0]  rd_ex_in;
  logic        reg_write_ex_in;
  logic        mem_read_ex_in;
  logic        mem_write_ex_in;
  logic        mem_to_reg_ex_in;

  // Outputs
  logic [31:0] alu_out_exmem;
  logic [31:0] store_data_exmem;
  logic [4:0]  rd_exmem;
  logic        reg_write_exmem;
  logic        mem_read_exmem;
  logic        mem_write_exmem;
  logic        mem_to_reg_exmem;

  // Instantiate DUT
  EX_MEM dut (
    .clk(clk),
    .rst(rst),
    .alu_out_in(alu_out_in),
    .store_data_in(store_data_in),
    .rd_ex_in(rd_ex_in),
    .reg_write_ex_in(reg_write_ex_in),
    .mem_read_ex_in(mem_read_ex_in),
    .mem_write_ex_in(mem_write_ex_in),
    .mem_to_reg_ex_in(mem_to_reg_ex_in),

    .alu_out_exmem(alu_out_exmem),
    .store_data_exmem(store_data_exmem),
    .rd_exmem(rd_exmem),
    .reg_write_exmem(reg_write_exmem),
    .mem_read_exmem(mem_read_exmem),
    .mem_write_exmem(mem_write_exmem),
    .mem_to_reg_exmem(mem_to_reg_exmem)
  );

  // Clock generation
  always #5 clk = ~clk;

  initial begin
    $display("Running EX/MEM pipeline register test...");

    // Initialization
    clk = 0;
    rst = 1;
    alu_out_in = 32'h0;
    store_data_in = 32'h0;
    rd_ex_in = 5'd0;
    reg_write_ex_in = 0;
    mem_read_ex_in = 0;
    mem_write_ex_in = 0;
    mem_to_reg_ex_in = 0;

    // Release reset
    #10 rst = 0;

    // Apply values for one clock cycle
    #10;
    alu_out_in = 32'hDEADBEEF;
    store_data_in = 32'hBEEF1234;
    rd_ex_in = 5'd10;
    reg_write_ex_in = 1;
    mem_read_ex_in = 1;
    mem_write_ex_in = 1;
    mem_to_reg_ex_in = 1;

    #10;
    $display("EX/MEM Outputs:");
    $display("ALU_OUT  = %h", alu_out_exmem);
    $display("STORE    = %h", store_data_exmem);
    $display("DEST     = %d", rd_exmem);
    $display("Ctrl     = RegWrite=%b, MemRead=%b, MemWrite=%b, MemToReg=%b",
             reg_write_exmem, mem_read_exmem, mem_write_exmem, mem_to_reg_exmem);

    #10 $finish;
  end

endmodule
