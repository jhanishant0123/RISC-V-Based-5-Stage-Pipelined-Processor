
SYSTEM VERILOG CODE FOR HAZARD DETECTION :-
// ========================================================================
// Module: Hazard Detection Unit
// Description: Detects load-use data hazards and triggers a stall if needed
// Author: [NISHANT KUMAR JHA]
// Date: [03-07-2025]
// ========================================================================

module hazard_detection_unit (
    input        MemRead_IDEX,        // Load signal from ID/EX pipeline
    input [4:0]  Rd_IDEX,             // Destination register of load instruction
    input [31:0] instr_IFID,          // Current instruction in IF/ID stage
    output reg   stall                // Stall signal output
);

  wire [4:0] rs1_IFID;
  wire [4:0] rs2_IFID;

  // Extract source registers from IF/ID instruction (RISC-V style)
  assign rs1_IFID = instr_IFID[19:15];
  assign rs2_IFID = instr_IFID[24:20];

  always @(*) begin
    if (MemRead_IDEX && ((Rd_IDEX == rs1_IFID) || (Rd_IDEX == rs2_IFID))) begin
      stall = 1'b1; // Hazard detected
    end else begin
      stall = 1'b0; // No hazard
    end
  end

endmodule

