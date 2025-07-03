`timescale 1ns/1ps

module tb_register_file;

  logic clk;
  logic rst;

  logic [4:0] read_reg1;
  logic [4:0] read_reg2;
  logic [4:0] write_reg;
  logic [31:0] write_data;

  logic       reg_write;
  logic [31:0] read_data1;
  logic [31:0] read_data2;

  // Instantiate the DUT
  RegisterFile dut (
    .clk(clk),
    .rst(rst),
    .read_reg1(read_reg1),
    .read_reg2(read_reg2),
    .write_reg(write_reg),
    .write_data(write_data),
    .reg_write(reg_write),
    .read_data1(read_data1),
    .read_data2(read_data2)
  );

  // Clock generation
  always #5 clk = ~clk;

  initial begin
    $display("Running RegisterFile test...");

    // Initialize
    clk = 0;
    rst = 1;
    reg_write = 0;
    write_data = 32'd0;
    write_reg = 5'd0;
    read_reg1 = 5'd0;
    read_reg2 = 5'd0;

    // Apply reset
    #10 rst = 0;

    // Write to register x5 = 123
    #10 reg_write = 1;
        write_reg = 5'd5;
        write_data = 32'd123;

    // Write to register x10 = 999
    #10 write_reg = 5'd10;
        write_data = 32'd999;

    // Disable write, read both registers
    #10 reg_write = 0;
        read_reg1 = 5'd5;
        read_reg2 = 5'd10;

    #10;
    $finish;
  end

  always_ff @(posedge clk) begin
    $display("Time: %0t | WriteReg=%0d | WriteData=%0d | RegWrite=%b", $time, write_reg, write_data, reg_write);
    $display("          ReadReg1=%0d => %0d | ReadReg2=%0d => %0d", read_reg1, read_data1, read_reg2, read_data2);
  end

endmodule
