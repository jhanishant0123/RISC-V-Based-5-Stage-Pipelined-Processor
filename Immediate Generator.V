SYSTEM VERILOG CODE FOR IMMEDIATE GENERATOR :-

// ========================================================================
// Module: Immediate Generator (ImmGen)
// Description: Extracts and sign-extends immediate values from instructions
//              Supports I, S, B, U, and J types.
// Author: [Your Name]
// Date: [Date]
// ========================================================================

module ImmGen (
    input  logic [31:0] instruction,     // 32-bit instruction input
    output logic [31:0] imm_out          // Sign-extended immediate output
);

    logic [6:0] opcode;

    assign opcode = instruction[6:0];

    always_comb begin
        case (opcode)
            7'b0010011,                 // I-type (e.g., addi)
            7'b0000011: begin           // Load (e.g., lw)
                imm_out = {{20{instruction[31]}}, instruction[31:20]};
            end

            7'b0100011: begin           // S-type (e.g., sw)
                imm_out = {{20{instruction[31]}}, instruction[31:25], instruction[11:7]};
            end

            7'b1100011: begin           // B-type (e.g., beq)
                imm_out = {{19{instruction[31]}}, instruction[31], instruction[7],
                            instruction[30:25], instruction[11:8], 1'b0};
            end

            7'b0110111,                 // U-type (e.g., lui)
            7'b0010111: begin           // auipc
                imm_out = {instruction[31:12], 12'b0};
            end

            7'b1101111: begin           // J-type (e.g., jal)
                imm_out = {{11{instruction[31]}}, instruction[31], instruction[19:12],
                            instruction[20], instruction[30:21], 1'b0};
            end

            default: imm_out = 32'd0;
        endcase

        // Debugging display (for simulation only)
        $display("IMMGEN: OPCODE=%b, IMM=%h", opcode, imm_out);
    end

endmodule
