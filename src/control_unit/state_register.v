module state_register (
    output reg[5:0] Q,
    input [5:0] D,
    input clk, clr
    );
    always @(posedge clk, clr)
        if(clr == 1'b0)
            Q <= 6'b000000;
        else
            Q <= D;
endmodule
