module next_state_decoder (
    output reg[5:0] NS,
    input [5:0] S,
    input [31:0] IR,
    input Cond, MOC
    );

    always @ (S, MOC, Cond) begin
        case (S)
            // 0 -> 1
            6'b000000: NS <= 6'b000001;
            // 1 -> 2
            6'b000001: NS <= 6'b000010;
            // 2 -> 3
            6'b000010: NS <= 6'b000011;
            // 3 -> 4
            6'b000011:
                if (!MOC)
                    NS <= 6'b000011;
                else
                    NS <= 6'b000100;
            // 4
            6'b000100:
                begin
                // 4 -> 1
                if (!Cond)
                    NS <= 6'b000001;
                else
                    begin
                        // Data Processing
                        if ((IR[27:25] == 3'b001) || (IR[27:25] == 3'b000 && IR[4] == 1'b0))
                            // 4 -> 5
                            if (IR[24:23] == 2'b10)
                                NS <= 6'b000101;       // CMP || CMN || TST || TEQ (S doesn't matter)
                            else
                                // 4 -> 6
                                if (IR[20] == 1'b1)
                                    NS <= 6'b000110;
                                // 4 -> 7
                                else
                                    NS <= 6'b000111;
                        // Branch and Branch and Link
                        else if (IR[27:25] == 3'b101)
                            // 4 -> 8
                            if(IR[24] == 1'b0)
                                NS <= 6'b001000;
                            // 4 -> 9
                            else
                                NS <= 6'b001001;
                        // Load and Store
                        else if(IR[27:26] == 2'b01)
                            // Post Index
                            // 4 -> 10
                            if(IR[24] == 1'b0)
                                NS <= 6'b001010;
                            else
                                // 4 -> 11
                                if(IR[23] == 1'b1)
                                  	NS <= 6'b001011;
                                // 4 -> 12
                                else
                                  	NS <= 6'b001100;
                        // Load and Store Miscellaneous (Same)
                        else if(IR[27:25] == 3'b000 && IR[4] == 1'b1)
                            // Post Index
                            // 4 -> 25
                            if(IR[24] == 1'b0)
                                NS <= 6'b011001;
                            else
                                // 4 -> 26
                                if(IR[23] == 1'b1)
                                    NS <= 6'b011010;
                                // 4 -> 27
                                else
                                    NS <= 6'b011011;
                        // Unknown instruction
                        else
                            begin
                                $display("Error: Could not decipher the instruction. Returning to fetch state.");
                                NS <= 6'b000001;
                            end
                    end
                end
            // 5 -> 1
            6'b000101: NS <= 6'b000001;
            // 6 -> 1
            6'b000110: NS <= 6'b000001;
            // 7 -> 1
            6'b000111: NS <= 6'b000001;
            // 8 -> 1
            6'b001000: NS <= 6'b000001;
            // 9 -> 8
            6'b001001: NS <= 6'b001000;
            // 10
            6'b001010:
                // LOAD
                if(IR[20] == 1'b1)
                    // Unsigned Byte
                    // 10 -> 13
                    if(IR[22] == 1'b1)
                        NS <= 6'b001101;
                    // Word
                    // 10 -> 15
                    else
                        NS <= 6'b001111;
                // STORE
                // 10 -> 18
                else
                    NS <= 6'b010010;
            // 11
            6'b001011:
                // LOAD
                if(IR[20] == 1'b1)
                    // Unsigned Byte
                    // 11 -> 13
                    if(IR[22] == 1'b1)
                        NS <= 6'b001101;
                    // Word
                    // 11 -> 15
                    else
                        NS <= 6'b001111;
                // STORE
                // 11 -> 18
                else
                    NS <= 6'b010010;
            // 12
            6'b001100:
                // LOAD
                if(IR[20] == 1'b1)
                    // Unsigned Byte B==1
                    // 12 -> 13
                    if(IR[22] == 1'b1)
                        NS <= 6'b001101;
                    // Word B==0
                    // 12 -> 15
                    else
                        NS <= 6'b001111;
                // STORE
                // 12 -> 18
                else
                    NS <= 6'b010010;
            // 13 -> 14
            6'b001101: NS <= 6'b001110;
            // 14 -> 17
            6'b001110:
                if(!MOC)
                    NS <= 6'b001110;
                else
                    NS <= 6'b010001;
            // 15 -> 16
            6'b001111: NS <= 6'b010000;
            // 16 -> 17
            6'b010000:
                if(!MOC)
                    NS <= 6'b010000;
                else
                    NS <= 6'b010001;
            // 17
            6'b010001:
                // OFFSET P==1 && W==0
                // 17 -> 1
                if(IR[24] == 1'b1 && IR[21]==1'b0)
                    NS <= 6'b000001;
                else
                    // U==1
                    // 17 -> 23
                    if(IR[23] == 1'b1)
                        NS <= 6'b010111;
                    // U==0
                    // 17 -> 24
                    else
                        NS <= 6'b011000;
            // 18
            6'b010010:
                // Unsigned Byte B==1
                // 18 -> 19
                if(IR[22] == 1'b1)
                    NS <= 6'b010011;
                // Word B==0
                // 18 -> 21
                else
                    NS <= 6'b010101;
            // 19 -> 20
            6'b010011: NS <= 6'b010100;
            // 20
            6'b010100:
                if(!MOC)
                    NS <= 6'b010100;
                else
                    // OFFSET P==1 && W==0
                    // 17 -> 1
                    if(IR[24] == 1'b1 && IR[21]==1'b0)
                        NS <= 6'b000001;
                    else
                        // U==1
                        // 17 -> 23
                        if(IR[23] == 1'b1)
                            NS <= 6'b010111;
                        // U==0
                        // 17 -> 24
                        else
                            NS <= 6'b011000;
            // 21 -> 22
            6'b010101: NS <= 6'b010110;
            // 22
            6'b010110:
                if(!MOC)
                    NS <= 6'b010100;
                else
                    // OFFSET P==1 && W==0
                    // 17 -> 1
                    if(IR[24] == 1'b1 && IR[21]==1'b0)
                        NS <= 6'b000001;
                    else
                        // U==1
                        // 17 -> 23
                        if(IR[23] == 1'b1)
                            NS <= 6'b010111;
                        // U==0
                        // 17 -> 24
                        else
                            NS <= 6'b011000;
            // 23 -> 1
            6'b010111: NS <= 6'b000001;
            // 24 -> 1
            6'b011000: NS <= 6'b000001;
            // 25
            6'b011001:
                if (!(IR[5] == 1'b1 && IR[20] == 1'b0))
                    if (IR[20] == 1'b1)
                        if (IR[6] == 1'b1)
                            if (IR[5] == 1'b1)
                                //25 -> 28
                                NS <= 6'b011100;
                            else
                                //25 -> 30
                                NS <= 6'b011110;
                        else
                            //25 -> 32
                            NS <= 6'b100000;
                    else
                        //25 -> 35
                        NS <= 6'b100011;
                else
                    //25 -> 38
                    NS <= 6'b100110;
            // 26
            6'b011010:
                if (!(IR[5] == 1'b1 && IR[20] == 1'b0))
                    if (IR[20] == 1'b1)
                        if (IR[6] == 1'b1)
                            if (IR[5] == 1'b1)
                                //26 -> 28
                                NS <= 6'b011100;
                            else
                                //26 -> 30
                                NS <= 6'b011110;
                        else
                            //26 -> 32
                            NS <= 6'b100000;
                    else
                        //26 -> 35
                        NS <= 6'b100011;
                else
                    //26 -> 38
                    NS <= 6'b100110;
            // 27
            6'b011011:
                if (!(IR[5] == 1'b1 && IR[20] == 1'b0))
                    if (IR[20] == 1'b1)
                        if (IR[6] == 1'b1)
                            if (IR[5] == 1'b1)
                                //27 -> 28
                                NS <= 6'b011100;
                            else
                                //27 -> 30
                                NS <= 6'b011110;
                        else
                            //27 -> 32
                            NS <= 6'b100000;
                    else
                        //27 -> 35
                        NS <= 6'b100011;
                else
                    //27 -> 38
                    NS <= 6'b100110;
            //28 -> 29
            6'b011100: NS <= 6'b011101;
            //29
            6'b011101:
                if(MOC)
                    //29 -> 34
                    NS <= 6'b100010;
                else
                    //29 -> 29
                    NS <= 6'b011101;
            //30 -> 31
            6'b011110: NS <= 6'b011111;
            //31
            6'b011111:
                if(MOC)
                    //31 -> 34
                    NS <= 6'b100010;
                else
                    //31 -> 31
                    NS <= 6'b011111;
            //32 -> 33
            6'b100000: NS <= 6'b100001;
            //33
            6'b100001:
                if(MOC)
                    //33 -> 34
                    NS <= 6'b100010;
                else
                    //33 -> 33
                    NS <= 6'b100001;
            //34
            6'b100010:
                // OFFSET P==1 && W==0
                // 34 -> 1
                if(IR[24] == 1'b1 && IR[21]==1'b0)
                    NS <= 6'b000001;
                    else
                    // U==1
                    // 34 -> 23
                    if(IR[23] == 1'b1)
                        NS <= 6'b010111;
                        // U==0
                        // 34 -> 24
                    else
                        NS <= 6'b011000;
            //35 -> 36
            6'b100011: NS <= 6'b100100;
            //36
            6'b100100:
                if(MOC)
                    //36 -> 37
                    NS <= 6'b100101;
                else
                    //36 -> 36
                    NS <= 6'b100100;
            //37
            6'b100101:
                // Post Index
                // 37 -> 42
                if(IR[24] == 1'b0)
                    NS <= 6'b011001;
                else
                    // 37 -> 43
                    if(IR[23] == 1'b1)
                        NS <= 6'b011010;
                    // 37 -> 44
                    else
                        NS <= 6'b011011;
            //38
            6'b100110:
                if(IR[6] == 1'b1)
                    //38 -> 39
                    NS <= 6'b100111;
                else
                    //38 -> 50
                    NS <= 6'b110010;
            //39 -> 40
            6'b100111: NS <= 6'b101000;
            //40
            6'b101000:
                if(MOC)
                    //40 -> 41
                    NS <= 6'b101001;
                else
                    //40 -> 40
                    NS <= 6'b101000;
            //41
            6'b101001:
                // Post Index
                // 41 -> 42
                if(IR[24] == 1'b0)
                    NS <= 6'b101010;
                else
                    // 41 -> 43
                    if(IR[23] == 1'b1)
                        NS <= 6'b101011;
                    // 41 -> 44
                    else
                        NS <= 6'b101100;
            //42
            6'b101010:
                // LOAD
                if (!(IR[5] == 1'b1 && IR[20] == 1'b0))
                    // 42 -> 45
                    NS <= 6'b101101;
                // STORE
                else
                    //42 -> 48
                    NS <= 6'b110000;
            //43
            6'b101011:
                // LOAD
                if (!(IR[5] == 1'b1 && IR[20] == 1'b0))
                    // 43 -> 45
                    NS <= 6'b101101;
                // STORE
                else
                    //43 -> 48
                    NS <= 6'b110000;
            //44
            6'b101100:
                // LOAD
                if (!(IR[5] == 1'b1 && IR[20] == 1'b0))
                    // 44 -> 45
                    NS <= 6'b101101;
                // STORE
                else
                    //44 -> 48
                    NS <= 6'b110000;
            //45 - > 46
            6'b101101: NS <= 6'b101110;
            //46
            6'b101110:
                if(MOC)
                    //46 -> 47
                    NS <= 6'b101111;
                else
                    //46 -> 46
                    NS <= 6'b101110;
            //47
            6'b101111:
                // OFFSET P==1 && W==0
                // 47 -> 1
                if(IR[24] == 1'b1 && IR[21]==1'b0)
                    NS <= 6'b000001;
                else
                    // U==1
                    // 47 -> 23
                    if(IR[23] == 1'b1)
                        NS <= 6'b010111;
                    // U==0
                    // 47 -> 24
                    else
                        NS <= 6'b011000;
            //48 -> 49
            6'b110000: NS <= 6'b110001;
            //49
            6'b110001:
                if(MOC)
                    // OFFSET P==1 && W==0
                    // 49 -> 1
                    if(IR[24] == 1'b1 && IR[21]==1'b0)
                        NS <= 6'b000001;
                    else
                        // U==1
                        // 49 -> 23
                        if(IR[23] == 1'b1)
                            NS <= 6'b010111;
                        // U==0
                        // 49 -> 24
                        else
                            NS <= 6'b011000;
                else
                    //49 -> 49
                    NS <= 6'b110001;
            //50 -> 51
            6'b110010: NS <= 6'b110011;
            //51
            6'b110011:
                if(MOC)
                    // OFFSET P==1 && W==0
                    // 51 -> 1
                    if(IR[24] == 1'b1 && IR[21]==1'b0)
                        NS <= 6'b000001;
                    else
                        // U==1
                        // 51 -> 23
                        if(IR[23] == 1'b1)
                            NS <= 6'b010111;
                        // U==0
                        // 51 -> 24
                        else
                            NS <= 6'b011000;
                else
                    //51 -> 51
                    NS <= 6'b110011;
            // Should never happen. unknown state. (Go to fetch again)
            default:
              begin
                $display("Error: Undefined state. Returning to state 0.");
                NS <= 6'b000000;
              end
        endcase
    end
endmodule
