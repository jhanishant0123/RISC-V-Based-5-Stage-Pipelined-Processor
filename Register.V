Register :- 

BLOCK DIAGRAM :-

           +---------------------+
     rs1 → |                     | → rd1 (value of rs1)
     rs2 → |  Register File      | → rd2 (value of rs2)
   clk  → |                     |


SYSTEM VERILOG CODE FOR REGISTER :-

// ========================================================================
// Module: Register File
// Description: 32 x 32-bit register file with 2 read ports and 1 write port.
//              Register x0 is hardwired to zero.
// Author: [NISHANT KUMAR JHA]
// Date: [03_07_2025]
// ========================================================================

module RegisterFile (
    input  logic        clk,             // Clock signal
    input  logic        reg_write,       // Register write enable
    input  logic [4:0]  rs1,             // Read address 1
    input  logic [4:0]  rs2,             // Read address 2
    input  logic [4:0]  rd,              // Write address
    input  logic [31:0] wd,              // Write data
    output logic [31:0] rd1,             // Output of rs1
    output logic [31:0] rd2              // Output of rs2
);

    // Internal 32 registers (x0 to x31)
    logic [31:0] reg_file [0:31];

    // Read operations (combinational)
    assign rd1 = (rs1 == 5'd0) ? 32'd0 : reg_file[rs1];
    assign rd2 = (rs2 == 5'd0) ? 32'd0 : reg_file[rs2];

    // Write operation (synchronous)
    always_ff @(posedge clk) begin
        if (reg_write && rd != 5'd0) begin
            reg_file[rd] <= wd;
        end
    end

endmodule
 
