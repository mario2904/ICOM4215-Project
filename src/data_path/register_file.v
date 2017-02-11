module register_file (output [31:0] OutA, OutB, input [31:0] IntA, input [3:0] SA, SB, Dec, input Clk, Ld);
    wire [31:0] Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9, Q10, Q11, Q12, Q13, Q14, Q15;
    wire [15:0] E;

    decoder_4to16 decoder (E, Dec, Ld);

    dflipflop R0 (Q0, IntA, Clk, E[0]);
    dflipflop R1 (Q1, IntA, Clk, E[1]);
    dflipflop R2 (Q2, IntA, Clk, E[2]);
    dflipflop R3 (Q3, IntA, Clk, E[3]);
    dflipflop R4 (Q4, IntA, Clk, E[4]);
    dflipflop R5 (Q5, IntA, Clk, E[5]);
    dflipflop R6 (Q6, IntA, Clk, E[6]);
    dflipflop R7 (Q7, IntA, Clk, E[7]);
    dflipflop R8 (Q8, IntA, Clk, E[8]);
    dflipflop R9 (Q9, IntA, Clk, E[9]);
    dflipflop R10 (Q10, IntA, Clk, E[10]);
    dflipflop R11 (Q11, IntA, Clk, E[11]);
    dflipflop R12 (Q12, IntA, Clk, E[12]);
    dflipflop R13 (Q13, IntA, Clk, E[13]);
    dflipflop R14 (Q14, IntA, Clk, E[14]);
    dflipflop R15 (Q15, IntA, Clk, E[15]);


    mux_16x1_32 muxA (OutA, Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9, Q10, Q11, Q12, Q13, Q14, Q15, SA);
    mux_16x1_32 muxB (OutB, Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9, Q10, Q11, Q12, Q13, Q14, Q15, SB);

endmodule
