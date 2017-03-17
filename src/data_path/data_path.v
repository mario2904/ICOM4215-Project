module data_path(
    output [31:0] IR_OUT,
    output MOC,
    output Cond,
    input SE,
    input [1:0] size,
    input FR_ld,
    input RF_ld,
    input IR_ld,
    input MAR_ld,
    input MDR_ld,
    input R_W,
    input MOV,
    input MA_1, MA_0, MB_1, MB_0, MC_2, MC_1, MC_0, MD, ME,
    input [4:0] OP,
    input clk, clr
    );

    // Static defined values----------------------------------------------------

    parameter PC = 4'b1111;
    parameter LR = 4'b1110;
    parameter NPI_32 = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; // Not USED For NOW
    parameter ZERO = 32'b00000000000000000000000000000000;

    // Instantiate wires--------------------------------------------------------

    // Muxes
    wire [3:0] mux_A_to_RF, mux_C_to_RF;
    wire [4:0] mux_D_to_ALU;
    wire [31:0] mux_B_to_ALU, mux_E_to_MDR;

    // D-Flip-Flop Outputs
    wire [31:0] current_IR, current_MAR, current_MDR;
    wire [3:0] current_flags;

    // Shifter Outputs
    wire [31:0] shifter_to_mux_B;
    wire shifter_carry_out;

    // Register-File Outputs
    wire [31:0] rf_PA_to_ALU, rf_PB_to_shifter;

    // RAM Outputs
    wire [31:0] mem_data_out_to_sign_extender;

    // ALU Flags Outputs
    wire [3:0] alu_flags;

    // One to many
    wire [31:0] data_out;
    wire [31:0] alu_out;

    // Instantiate components---------------------------------------------------

    // D-Flip-Flop
    dflipflop IR (current_IR, data_out, clk, IR_ld);
    dflipflop MAR (current_MAR, alu_out, clk, MAR_ld);
    dflipflop MDR (current_MDR, mux_E_to_MDR, clk, MDR_ld);
    dflipflop_4 FR (current_flags, alu_flags, clk, FR_ld);

    // Muxes
    mux_4x1_4 mux_A (mux_A_to_RF, {MA_1, MA_0}, current_IR[19:16], current_IR[15:12], PC, (current_IR[15:12] + 1'b1)); // Last one for Miscellaneous
    mux_5x1_4 mux_C (mux_C_to_RF, {MC_2, MC_1, MC_0}, current_IR[15:12], PC, current_IR[19:16], (current_IR[15:12] + 1'b1), LR); // Last one for Miscellaneous
    mux_2x1_5 mux_D (mux_D_to_ALU, MD, {1'b0, current_IR[24:21]}, OP );
    mux_4x1_32 mux_B (mux_B_to_ALU, {MB_1, MB_0}, NPI_32, shifter_to_mux_B, current_MDR, ZERO);
    mux_2x1_32 mux_E (mux_E_to_MDR, ME, data_out, alu_out);

    // ALU
    alu mega_alu(alu_out, alu_flags, rf_PA_to_ALU, mux_B_to_ALU, mux_D_to_ALU, current_flags[1], shifter_carry_out);

    // Condition Tester
    condition_tester cond_test(Cond, current_IR[31:28], current_flags[3], current_flags[2], current_flags[1], current_flags[0]);

    // Shifter
    shifter mega_shifter (shifter_to_mux_B, shifter_carry_out, current_IR, rf_PB_to_shifter, current_flags[1]);

    // RAM
    ram_256 ram (mem_data_out_to_sign_extender, MOC, current_MDR, R_W, MOV, current_MAR[7:0], size);

    // Sign extender
    sign_extender sign_extend (data_out , mem_data_out_to_sign_extender, size[0], SE);

    // Register File
    register_file RF (rf_PA_to_ALU, rf_PB_to_shifter, alu_out, mux_A_to_RF, current_IR[3:0], mux_C_to_RF, clk, RF_ld);

    // Assign current_IR to output IR_OUT
    assign IR_OUT = current_IR;

    // For debugging...
    initial begin
      $display("----------------------------------------------");
    end

    always @ (current_MAR) begin
        $display("Data Path: MAR = %d", current_MAR);
    end

endmodule
