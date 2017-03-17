module control_unit (
    input [31:0] IR,
    output SE,
    output [1:0] size,
    output FR_ld,
    output RF_ld,
    output IR_ld,
    output MAR_ld,
    output MDR_ld,
    output R_W,
    output MOV,
    input MOC,
    input ZF, N, C, V, //Flags
    input COND,
    output MA_1, MA_0, MB_1, MB_0, MC_2, MC_1, MC_0, MD, ME,
    output [4:0] OP,
    input clk, clr
    );

    // Instantiate wires--------------------------------------------------------
    wire [5:0] current_state_w, next_state_w;

    // Instantiate components---------------------------------------------------
    next_state_decoder NSD (next_state_w, current_state_w, IR, COND, MOC);
    state_register SR (current_state_w, next_state_w, clk, clr);
    control_signals_encoder CSE (current_state_w, SE, size, FR_ld, RF_ld, IR_ld, MAR_ld, MDR_ld, R_W, MOV, MA_1, MA_0, MB_1, MB_0, MC_2, MC_1, MC_0, MD, ME, OP);

endmodule
