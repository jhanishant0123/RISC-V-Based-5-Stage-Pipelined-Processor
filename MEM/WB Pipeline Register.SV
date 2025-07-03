SYSTEM VERILOG CODE FOR MEM/WE PIPELINE REGISTER :-
// ========================================================================
// Module: MEM/WB Pipeline Register
// Description: Buffers memory/ALU output and control signals for WB stage
// Author: [Your Name]
// Date: [Date]
// ========================================================================

module MEM_WB #(
    parameter WIDTH = 32
)(
    input  logic             clk,
    input  logic             rst,

    // Inputs from MEM stage
    input  logic [WIDTH-1:0] mem_data_in,
    input  logic [WIDTH-1:0] alu_result_in,
    input  logic [4:0]       dest_reg_in,
    input  logic             reg_write_en_in,
    input  logic             mem_to_reg_in,

    // Outputs to WB stage
    output logic [WIDTH-1:0] mem_data_out,
    output logic [WIDTH-1:0] alu_result_out,
    output logic [4:0]       dest_reg_out,
    output logic             reg_write_en_out,
    output logic             mem_to_reg_out
);

    always_ff @(posedge clk) begin
        if (rst) begin
            mem_data_out      <= '0;
            alu_result_out    <= '0;
            dest_reg_out      <= 5'd0;
            reg_write_en_out  <= 1'b0;
            mem_to_reg_out    <= 1'b0;
        end else begin
            mem_data_out      <= mem_data_in;
            alu_result_out    <= alu_result_in;
            dest_reg_out      <= dest_reg_in;
            reg_write_en_out  <= reg_write_en_in;
            mem_to_reg_out    <= mem_to_reg_in;

            // Debug print
            $display("MEM/WB: ALU=%h | MEM=%h | RD=%0d | WriteEn=%b | MemToReg=%b",
                      alu_result_in, mem_data_in, dest_reg_in,
                      reg_write_en_in, mem_to_reg_in);
        end
    end

endmodule
