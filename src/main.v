module main;
    // Initialize variables. Local signals--------------------------------------

    // Input Sources
    reg clk, clr;

    // Wires
    wire [31:0] IR;
    wire SE;
    wire [1:0] size;
    wire FR_ld;
    wire RF_ld;
    wire IR_ld;
    wire MAR_ld;
    wire MDR_ld;
    wire R_W;
    wire MOV;
    wire MOC;
    wire C_in;
    wire ZF, N, C, V;
    wire Cond;
    wire MA_1, MA_0, MB_1, MB_0, MC_2, MC_1, MC_0, MD, ME;
    wire [4:0] OP;

    // Instantiate modules
    control_unit CU (IR, SE, size, FR_ld, RF_ld, IR_ld, MAR_ld, MDR_ld, R_W, MOV, MOC, C_in, ZF, N, C, V, Cond, MA_1, MA_0, MB_1, MB_0, MC_2, MC_1, MC_0, MD, ME, OP, clk, clr);

    data_path DP (IR, MOC, Cond, SE, size, FR_ld, RF_ld, IR_ld, MAR_ld, MDR_ld, R_W, MOV, C_in, MA_1, MA_0, MB_1, MB_0, MC_2, MC_1, MC_0, MD, ME, OP, clk, clr);

    // Specify simulation time
    parameter sim_time = 3000;
    initial #sim_time $finish;

    // Initialize simulation
    initial begin
    clk = 1'b0;
    clr = 1'b0; // only used in State Register

    // Toggle clk
    repeat (450) // 237
        begin
            #5 {clk, clr} <= {!clk, 1'b1};
        end
    end
endmodule
