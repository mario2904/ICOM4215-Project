module shifter (output reg[31:0] OUT, input [31:0] IR, RM);
    // Temporary register
    reg [31:0] temp;
    always @ (IR, RM)
        // Addressing Mode 1: Data processing
        if((IR[27:25] == 3'b001) || (IR[27:25] == 3'b000 && IR[4] == 1'b0))
            // Immediate
            if(IR[25] == 1'b1)
                // IR[11:8] = rotate_imm
                // IR[7:0] = immed_8
                // shifter_operand = Shift immed_8 right by 2 * rotate_imm
                // Props to: http://stackoverflow.com/questions/6316653/defining-a-rightrotate-function-with-non-fixed-rotation-length
                begin
                    {temp} = IR[7:0];
                    {OUT} = {temp, temp} >> (2 * IR[11:8]);
                end
            // Shift by Immediate Shifter Operand
            else if(IR[25] == 1'b0 && IR[4] == 1'b0)
                // IR[11:7] = shift_imm.
                // IR[6:5] = shift:= LSL | LSR | ASR | ROR
                case(IR[6:5])
                    // LSL = Logical Shift Left
                    // shifter_operand = Rm logically shifted to the left 'shift' times.
                    2'b00: {OUT} <= RM << IR[11:7];
                    // LSR = Logical Shift Right
                    // shifter_operand = Rm logically shifted to the right 'shift' times.
                    2'b01: {OUT} <= RM >> IR[11:7];
                    // ASR = Arithmetic Shift Right
                    // shifter_operand = Rm arithmetically shifted to the right 'shift' times.
                    // Use the $signed() operator: https://groups.google.com/forum/#!topic/comp.lang.verilog/LEZ2tBLRV_E
                    2'b10: {OUT} <= $signed(RM) >>> IR[11:7];
                    // ROR = Rotate Right
                    // shifter_operand = Rm rotated to the right 'shift' times.
                    2'b11: {OUT} <= {RM, RM} >> IR[11:7];
                endcase
            // Error: Shift by Register Is not and will not be implemented!
            else
                $display("Error: Shift by Register Is not implemented!");
        // Addressing Mode 2: Load Store
        else if(IR[27:26] == 2'b01)
            // Immediate
            if(IR[25] == 1'b0)
                // offset = offset_12 => IR[11:0]
                {OUT} <= IR[11:0];
            // Register
            else
                // offset = content of register IR[3:0] => RM
                {OUT} <= RM;
        // Addressing Mode 3: Load Store Miscellaneous
        else if(IR[27:25] == 3'b000 && IR[4] == 1'b1)
            // Immediate
            if(IR[22] == 1'b1)
                // IR[11:8] = ImmedH
                // IR[3:0] = ImmedL
                // offset = {ImmedH, ImmedL} = offset_8
                {OUT} <= {IR[11:8], IR[3:0]};
            // Register
            else
                // offset = content of register IR[3:0] => RM
                {OUT} <= RM;
        // Addressing Mode 4: Load Store Multiple (TODO)
        // else if()
        // Addressing Mode 5: Branch and Branch & Link
        else if(IR[27:25] == 3'b101)
            // offset = IR[23:0]. range: -33554432 to +33554428
            // OUT = 4 x offset (sign extender)
            // Props to : http://excamera.com/sphinx/fpga-verilog-sign.html
            {OUT} <= {{8{IR[23]}},IR[23:0]} << 2;
        // Error: Unexpected instruction
        else
            $display("Error: Unexpected instruction");

endmodule
