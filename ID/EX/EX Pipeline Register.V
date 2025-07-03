 ID/EX Pipeline Register

BLOCK DIAGRAM :- 

       +---------------------+
       |     ID/EX Reg       |
       |---------------------|
clk ---> | |
rst ---> | |
Inputs --->| Latches |---> Outputs to EX stage
+---------------------+

SYSTEM VERILOG CODE FOR ID/EX PIPELINE REGISTER :-

// ========================================================================
// Module: ID_EX Pipeline Register (Customized)
// Description: Buffers decoded operands and control signals between
//              Decode and Execute stages in a 5-stage pipeline.
// Author: [NISHANT KUMAR JHA]
// Date: [03-07-2025]
// ========================================================================

module ID_EX #(
    parameter RESET_VALUE = 32'd0,
    parameter CTRL_RESET  = 4'd0
)(
    input  logic        clk,
    input  logic        rst,

    // Data signals from ID stage
    input  logic [31:0] src_data_a_in,       // read_data1
    input  logic [31:0] src_data_b_in,       // read_data2
    input  logic [31:0] imm_value_in,        // immediate value
    input  logic [4:0]  dest_reg_in,         // rd
    input  logic [31:0] pc_input,            // PC of current instruction

    // Control signals from ID stage
    input  logic [3:0]  ex_control_in,       // ALU control
    input  logic        reg_write_en_in,
    input  logic        mem_write_en_in,
    input  logic        memory_enable_in,

    // Outputs to EX stage
    output logic [31:0] src_data_a_out,
    output logic [31:0] src_data_b_out,
    output logic [31:0] imm_value_out,
    output logic [4:0]  dest_reg_out,
    output logic [31:0] pc_out,

    output logic [3:0]  ex_control_out,
    output logic        reg_write_en_out,
    output logic        mem_write_en_out,
    output logic        memory_enable_out
);

    always_ff @(posedge clk) begin
        if (rst) begin
            src_data_a_out     <= RESET_VALUE;
            src_data_b_out     <= RESET_VALUE;
            imm_value_out      <= RESET_VALUE;
            dest_reg_out       <= 5'd0;
            pc_out             <= RESET_VALUE;
            ex_control_out     <= CTRL_RESET;
            reg_write_en_out   <= 1'b0;
            mem_write_en_out   <= 1'b0;
            memory_enable_out  <= 1'b0;
        end else begin
            src_data_a_out     <= src_data_a_in;
            src_data_b_out     <= src_data_b_in;
            imm_value_out      <= imm_value_in;
            dest_reg_out       <= dest_reg_in;
            pc_out             <= pc_input;
            ex_control_out     <= ex_control_in;
            reg_write_en_out   <= reg_write_en_in;
            mem_write_en_out   <= mem_write_en_in;
            memory_enable_out  <= memory_enable_in;

            // Debug print (remove/comment for synthesis)
            $display("ID/EX PIPELINE: PC=%h, RD=%0d, IMM=%h, EX_CTRL=%b",
                     pc_input, dest_reg_in, imm_value_in, ex_control_in);
        end
    end

endmodule
