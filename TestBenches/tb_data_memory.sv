`timescale 1ns/1ps

module tb_data_memory;

  logic clk;
  logic rst;

  logic mem_read;
  logic mem_write;
  logic [31:0] addr;
  logic [31:0] write_data;
  logic [31:0] read_data;

  // Instantiate DUT
  DataMemory dut (
    .clk(clk),
    .rst(rst),
    .mem_read(mem_read),
    .mem_write(mem_write),
    .addr(addr),
    .write_data(write_data),
    .read_data(read_data)
  );

  // Clock generation
  always #5 clk = ~clk;

  initial begin
    $display("Running DataMemory test...");

    // Initialization
    clk = 0;
    rst = 1;
    mem_read = 0;
    mem_write = 0;
    addr = 32'd0;
    write_data = 32'd0;

    // Release reset
    #10 rst = 0;

    // Write 0xAABBCCDD to addr 0x04
    #10;
    addr = 32'd4;
    write_data = 32'hAABBCCDD;
    mem_write = 1;
    mem_read = 0;

    #10;
    mem_write = 0;

    // Read from same address
    #10;
    mem_read = 1;
    mem_write = 0;

    #10;
    $display("Read Data = %h (Expect AABBCCDD)", read_data);

    $finish;
  end

endmodule
