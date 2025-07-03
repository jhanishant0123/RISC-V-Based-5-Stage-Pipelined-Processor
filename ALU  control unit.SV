SYSTEM VERILOG CODE FOR ALU CONTROL :-

// ========================================================================
// Module: ALU Control Unit (RISC-V Custom)
// Description: Decodes funct3, funct7, and ALUOp to generate ALU control
// Author: [NISHANT KUMAR JHA]
// Date: [03-07-2025]
// ========================================================================

module ALUControl (
    input  logic [1:0] alu_op,        // From main control unit
    input  logic [2:0] funct3,        // instruction[14:12]
    input  logic       funct7_bit,    // instruction[30]
    output logic [3:0] alu_ctrl       // To ALU
);

    always_comb begin
        case (alu_op)
            2'b00: alu_ctrl = 4'b0000; // ADD (for lw/sw)
            2'b01: alu_ctrl = 4'b0001; // SUB (for beq)

            2'b10: begin // R-type
                case ({funct7_bit, funct3})
                    4'b0000: alu_ctrl = 4'b0000; // ADD
                    4'b1000: alu_ctrl = 4'b0001; // SUB
                    4'b0111: alu_ctrl = 4'b0010; // AND
                    4'b0110: alu_ctrl = 4'b0011; // OR
                    4'b0100: alu_ctrl = 4'b0100; // XOR
                    4'b0001: alu_ctrl = 4'b0101; // SLL
                    4'b0101: alu_ctrl = 4'b0110; // SRL
                    4'b1101: alu_ctrl = 4'b1000; // SRA
                    4'b0010: alu_ctrl = 4'b0111; // SLT
                    4'b1001: alu_ctrl = 4'b1001; // NOR (optional)
                    default: alu_ctrl = 4'b1111; // Unknown
                endcase
            end

            2'b11: begin // I-type ALU ops
                case (funct3)
                    3'b000: alu_ctrl = 4'b0000; // ADDI
                    3'b111: alu_ctrl = 4'b0010; // ANDI
                    3'b110: alu_ctrl = 4'b0011; // ORI
                    3'b100: alu_ctrl = 4'b0100; // XORI
                    3'b001: alu_ctrl = 4'b0101; // SLLI
                    3'b101: alu_ctrl = 4'b0110; // SRLI
                    3'b010: alu_ctrl = 4'b0111; // SLTI
                    default: alu_ctrl = 4'b1111;
                endcase
            end

            default: alu_ctrl = 4'b1111; // Undefined ALUOp
        endcase

        // Debug output for simulation
        $display("ALUControl: ALUOp=%b, funct3=%b, funct7=%b => ALUCtrl=%b",
                  alu_op, funct3, funct7_bit, alu_ctrl);
    end

endmodule
