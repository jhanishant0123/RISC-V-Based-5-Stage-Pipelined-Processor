
// ========================================================================
// Module: 2x1 Multiplexer (64-bit)
// Description: Selects between two 64-bit inputs based on SEL
// Author: [NISHANT KUMAR JHA]
// Date: [03-07-2025]
// ========================================================================

module twox1Mux (
    input  logic [63:0] A, B,     // 64-bit inputs
    input  logic        SEL,      // Select signal
    output logic [63:0] Y         // Output
);

    always_comb begin
        if (SEL == 1'b0)
            Y = A;
        else
            Y = B;
    end

endmodule
