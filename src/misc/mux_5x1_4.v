module mux_5x1_4 (output reg [3:0] Y, input [2:0]S, input [3:0] I0, I1, I2, I3, I4);
    always @ (S, I0, I1, I2, I3, I4)
        case (S)
            3'b000: Y <= I0;
            3'b001: Y <= I1;
            3'b010: Y <= I2;
            3'b011: Y <= I3;
            3'b100: Y <= I4;
            default: Y <= 4'bxxxx;
        endcase
endmodule
