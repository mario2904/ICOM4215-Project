module mux_2x1_5 (output reg [4:0] Y, input S, input [4:0] I0, I1);
    always @ (S, I0, I1)
        if (S) Y <= I1;
        else Y <= I0;
endmodule
