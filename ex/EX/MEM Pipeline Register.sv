SYSTEM VERILOG CODE FOR MEM PIPELINE REGISTER :-

// ========================================================================
// Module: EX/MEM Pipeline Register
// Description: Holds execution results and control signals for MEM stage
// Author: [NISHANT KUMAR JHA]
// Date: [03-07-2025]
// ========================================================================

module EX_MEM #(
    parameter WIDTH = 32
)(
    input  logic             clk,
    input  logic             rst,

    // Data inputs from EX stage
    input  logic [WIDTH-1:0] alu_out_in,
    input  logic [WIDTH-1:0] store_data_in,     // Operand B
    input  logic [4:0]       rd_ex_in,

    // Control signal inputs from EX stage
    input  logic             reg_write_ex_in,
    input  logic             mem_read_ex_in,
    input  logic             mem_write_ex_in,
    input  logic             mem_to_reg_ex_in,

    // Outputs to MEM stage
    output logic [WIDTH-1:0] alu_out_exmem,
    output logic [WIDTH-1:0] store_data_exmem,
    output logic [4:0]       rd_exmem,

    output logic             reg_write_exmem,
    output logic             mem_read_exmem,
    output logic             mem_write_exmem,
    output logic             mem_to_reg_exmem
);

    always_ff @(posedge clk) begin
        if (rst) begin
            alu_out_exmem     <= '0;
            store_data_exmem  <= '0;
            rd_exmem          <= 5'd0;
            reg_write_exmem   <= 1'b0;
            mem_read_exmem    <= 1'b0;
            mem_write_exmem   <= 1'b0;
            mem_to_reg_exmem  <= 1'b0;
        end else begin
            alu_out_exmem     <= alu_out_in;
            store_data_exmem  <= store_data_in;
            rd_exmem          <= rd_ex_in;

            reg_write_exmem   <= reg_write_ex_in;
            mem_read_exmem    <= mem_read_ex_in;
            mem_write_exmem   <= mem_write_ex_in;
            mem_to_reg_exmem  <= mem_to_reg_ex_in;

            // Debug statement
            $display("EX/MEM: ALU_OUT=%h, STORE=%h, RD=%0d, REGWRITE=%b",
                      alu_out_in, store_data_in, rd_ex_in, reg_write_ex_in);
        end
    end

endmodule
