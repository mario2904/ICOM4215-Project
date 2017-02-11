module dflipflop(output reg [31:0] Q, input [31:0] D, input clk, ld);
    always @(posedge clk)
        if(ld)
            Q <= D;
endmodule
