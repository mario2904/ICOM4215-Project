module dflipflop_4(output reg [3:0] Q, input [3:0] D, input clk, ld);
    always @(posedge clk)
        if(ld)
            Q <= D;
endmodule
