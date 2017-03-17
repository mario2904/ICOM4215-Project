module control_signals_encoder (
    input [5:0] S,
    output reg SE,
    output reg[1:0] size,
    output reg FR_ld,
    output reg RF_ld,
    output reg IR,
    output reg MAR_ld,
    output reg MDR_ld,
    output reg R_W,
    output reg MOV,
    output reg MA_1, MA_0, MB_1, MB_0, MC_2, MC_1, MC_0, MD, ME,
    output reg[4:0] OP
    );
    always @ (S) begin
        case (S)
            //State

            //0
            6'b000000:
            begin
                SE <= 0;
                size <= 2'b00;
                FR_ld <= 0;
                RF_ld <= 1;
                IR <= 0;
                MAR_ld <= 0;
                MDR_ld <= 0;
                R_W <= 0;
                MOV <= 0;
                MA_1 <= 0;
                MA_0 <= 0;
                MB_1 <= 1;
                MB_0 <= 1;
                MC_2 <= 0;
                MC_1 <= 0;
                MC_0 <= 1;
                MD <= 1;
                ME <= 0;
                OP <= 5'b01101;
            end

            //1
            6'b000001:
            begin
                SE <= 0;
                size <= 2'b00;
                FR_ld <= 0;
                RF_ld <= 0;
                IR <= 0;
                MAR_ld <= 1;
                MDR_ld <= 0;
                R_W <= 0;
                MOV <= 0;
                MA_1 <= 1;
                MA_0 <= 0;
                MB_1 <= 0;
                MB_0 <= 0;
                MC_2 <= 0;
                MC_1 <= 0;
                MC_0 <= 0;
                MD <= 1;
                ME <= 0;
                OP <= 5'b10000;
            end

            //2
            6'b000010:
            begin
                SE <= 0;
                size <= 2'b10;
                FR_ld <= 0;
                RF_ld <= 1;
                IR <= 0;
                MAR_ld <= 0;
                MDR_ld <= 0;
                R_W <= 1;
                MOV <= 1;
                MA_1 <= 1;
                MA_0 <= 0;
                MB_1 <= 0;
                MB_0 <= 0;
                MC_2 <= 0;
                MC_1 <= 0;
                MC_0 <= 1;
                MD <= 1;
                ME <= 0;
                OP <= 5'b10001;
            end

            //3
            6'b000011:
            begin
                SE <= 0;
                size <= 2'b10;
                FR_ld <= 0;
                RF_ld <= 0;
                IR <= 1;
                MAR_ld <= 0;
                MDR_ld <= 0;
                R_W <= 1;
                MOV <= 1;
                MA_1 <= 0;
                MA_0 <= 0;
                MB_1 <= 0;
                MB_0 <= 0;
                MC_2 <= 0;
                MC_1 <= 0;
                MC_0 <= 0;
                MD <= 0;
                ME <= 0;
                OP <= 5'b00000;
            end

            //4
            6'b000100:
            begin
                SE <= 0;
                size <= 2'b00;
                FR_ld <= 0;
                RF_ld <= 0;
                IR <= 0;
                MAR_ld <= 0;
                MDR_ld <= 0;
                R_W <= 0;
                MOV <= 0;
                MA_1 <= 0;
                MA_0 <= 0;
                MB_1 <= 0;
                MB_0 <= 0;
                MC_2 <= 0;
                MC_1 <= 0;
                MC_0 <= 0;
                MD <= 0;
                ME <= 0;
                OP <= 5'b00000;
            end

            // DATA PROCESSING --------------

            //5
            6'b000101:
            begin
                SE <= 0;
                size <= 2'b01;
                FR_ld <= 1;
                RF_ld <= 0;
                IR <= 0;
                MAR_ld <= 0;
                MDR_ld <= 0;
                R_W <= 0;
                MOV <= 0;
                MA_1 <= 0;
                MA_0 <= 0;
                MB_1 <= 0;
                MB_0 <= 1;
                MC_2 <= 0;
                MC_1 <= 0;
                MC_0 <= 0;
                MD <= 0;
                ME <= 0;
                OP <= 5'b00000;
            end

            //6
            6'b000110:
            begin
                SE <= 0;
                size <= 2'b01;
                FR_ld <= 1;
                RF_ld <= 1;
                IR <= 0;
                MAR_ld <= 0;
                MDR_ld <= 0;
                R_W <= 0;
                MOV <= 0;
                MA_1 <= 0;
                MA_0 <= 0;
                MB_1 <= 0;
                MB_0 <= 1;
                MC_2 <= 0;
                MC_1 <= 0;
                MC_0 <= 0;
                MD <= 0;
                ME <= 0;
                OP <= 5'b00000;
            end

            //7
            6'b000111:
            begin
                SE <= 0;
                size <= 2'b01;
                FR_ld <= 0;
                RF_ld <= 1;
                IR <= 0;
                MAR_ld <= 0;
                MDR_ld <= 0;
                R_W <= 0;
                MOV <= 0;
                MA_1 <= 0;
                MA_0 <= 0;
                MB_1 <= 0;
                MB_0 <= 1;
                MC_2 <= 0;
                MC_1 <= 0;
                MC_0 <= 0;
                MD <= 0;
                ME <= 0;
                OP <= 5'b00000;
            end

            // BRANCH/BRANCH & LINK ----------------

            //8
            6'b001000:
            begin
                SE <= 0;
                size <= 2'b00;
                FR_ld <= 0;
                RF_ld <= 1;
                IR <= 0;
                MAR_ld <= 0;
                MDR_ld <= 0;
                R_W <= 0;
                MOV <= 0;
                MA_1 <= 1;
                MA_0 <= 0;
                MB_1 <= 0;
                MB_0 <= 1;
                MC_2 <= 0;
                MC_1 <= 0;
                MC_0 <= 1;
                MD <= 1;
                ME <= 0;
                OP <= 5'b00100;
            end

            //9
            6'b001001:
            begin
                SE <= 0;
                size <= 2'b00;
                FR_ld <= 0;
                RF_ld <= 1;
                IR <= 0;
                MAR_ld <= 0;
                MDR_ld <= 0;
                R_W <= 0;
                MOV <= 0;
                MA_1 <= 1;
                MA_0 <= 0;
                MB_1 <= 0;
                MB_0 <= 0;
                MC_2 <= 1;
                MC_1 <= 0;
                MC_0 <= 0;
                MD <= 1;
                ME <= 0;
                OP <= 5'b10000;
            end

            // LOAD/STORE

            //10
            6'b001010:
            begin
                SE <= 0;
                size <= 2'b00;
                FR_ld <= 0;
                RF_ld <= 0;
                IR <= 0;
                MAR_ld <= 1;
                MDR_ld <= 0;
                R_W <= 0;
                MOV <= 0;
                MA_1 <= 0;
                MA_0 <= 0;
                MB_1 <= 0;
                MB_0 <= 0;
                MC_2 <= 0;
                MC_1 <= 0;
                MC_0 <= 0;
                MD <= 1;
                ME <= 0;
                OP <= 5'b10000;
            end

            //11
            6'b001011:
            begin
                SE <= 0;
                size <= 2'b00;
                FR_ld <= 0;
                RF_ld <= 0;
                IR <= 0;
                MAR_ld <= 1;
                MDR_ld <= 0;
                R_W <= 0;
                MOV <= 0;
                MA_1 <= 0;
                MA_0 <= 0;
                MB_1 <= 0;
                MB_0 <= 1;
                MC_2 <= 0;
                MC_1 <= 0;
                MC_0 <= 0;
                MD <= 1;
                ME <= 0;
                OP <= 5'b00100;
            end

            //12
            6'b001100:
            begin
                SE <= 0;
                size <= 2'b00;
                FR_ld <= 0;
                RF_ld <= 0;
                IR <= 0;
                MAR_ld <= 1;
                MDR_ld <= 0;
                R_W <= 0;
                MOV <= 0;
                MA_1 <= 0;
                MA_0 <= 0;
                MB_1 <= 0;
                MB_0 <= 1;
                MC_2 <= 0;
                MC_1 <= 0;
                MC_0 <= 0;
                MD <= 1;
                ME <= 0;
                OP <= 5'b00010;
            end

            //13
            6'b001101:
            begin
                SE <= 0;
                size <= 2'b00;
                FR_ld <= 0;
                RF_ld <= 0;
                IR <= 0;
                MAR_ld <= 0;
                MDR_ld <= 0;
                R_W <= 1;
                MOV <= 1;
                MA_1 <= 0;
                MA_0 <= 0;
                MB_1 <= 0;
                MB_0 <= 0;
                MC_2 <= 0;
                MC_1 <= 0;
                MC_0 <= 0;
                MD <= 0;
                ME <= 0;
                OP <= 5'b00000;
            end

            //14
            6'b001110:
            begin
                SE <= 0;
                size <= 2'b00;
                FR_ld <= 0;
                RF_ld <= 0;
                IR <= 0;
                MAR_ld <= 0;
                MDR_ld <= 1;
                R_W <= 1;
                MOV <= 1;
                MA_1 <= 0;
                MA_0 <= 0;
                MB_1 <= 0;
                MB_0 <= 0;
                MC_2 <= 0;
                MC_1 <= 0;
                MC_0 <= 0;
                MD <= 0;
                ME <= 0;
                OP <= 5'b00000;
            end

            //15
            6'b001111:
            begin
                SE <= 0;
                size <= 2'b10;
                FR_ld <= 0;
                RF_ld <= 0;
                IR <= 0;
                MAR_ld <= 0;
                MDR_ld <= 0;
                R_W <= 1;
                MOV <= 1;
                MA_1 <= 0;
                MA_0 <= 0;
                MB_1 <= 0;
                MB_0 <= 0;
                MC_2 <= 0;
                MC_1 <= 0;
                MC_0 <= 0;
                MD <= 0;
                ME <= 0;
                OP <= 5'b00000;
            end

            //16
            6'b010000:
            begin
                SE <= 0;
                size <= 2'b10;
                FR_ld <= 0;
                RF_ld <= 0;
                IR <= 0;
                MAR_ld <= 0;
                MDR_ld <= 1;
                R_W <= 1;
                MOV <= 1;
                MA_1 <= 0;
                MA_0 <= 0;
                MB_1 <= 0;
                MB_0 <= 0;
                MC_2 <= 0;
                MC_1 <= 0;
                MC_0 <= 0;
                MD <= 0;
                ME <= 0;
                OP <= 5'b00000;
            end

            //17
            6'b010001:
            begin
                SE <= 0;
                size <= 2'b00;
                FR_ld <= 0;
                RF_ld <= 1;
                IR <= 0;
                MAR_ld <= 0;
                MDR_ld <= 0;
                R_W <= 0;
                MOV <= 0;
                MA_1 <= 0;
                MA_0 <= 0;
                MB_1 <= 1;
                MB_0 <= 0;
                MC_2 <= 0;
                MC_1 <= 0;
                MC_0 <= 0;
                MD <= 1;
                ME <= 0;
                OP <= 5'b01101;
            end

            //18
            6'b010010:
            begin
                SE <= 0;
                size <= 2'b00;
                FR_ld <= 0;
                RF_ld <= 0;
                IR <= 0;
                MAR_ld <= 0;
                MDR_ld <= 1;
                R_W <= 0;
                MOV <= 0;
                MA_1 <= 0;
                MA_0 <= 1;
                MB_1 <= 0;
                MB_0 <= 0;
                MC_2 <= 0;
                MC_1 <= 0;
                MC_0 <= 0;
                MD <= 1;
                ME <= 1;
                OP <= 5'b10000;
            end

            //19
            6'b010011:
            begin
                SE <= 0;
                size <= 2'b00;
                FR_ld <= 0;
                RF_ld <= 0;
                IR <= 0;
                MAR_ld <= 0;
                MDR_ld <= 0;
                R_W <= 0;
                MOV <= 1;
                MA_1 <= 0;
                MA_0 <= 0;
                MB_1 <= 0;
                MB_0 <= 0;
                MC_2 <= 0;
                MC_1 <= 0;
                MC_0 <= 0;
                MD <= 0;
                ME <= 0;
                OP <= 5'b00000;
            end

            //20
            6'b010100:
            begin
                SE <= 0;
                size <= 2'b00;
                FR_ld <= 0;
                RF_ld <= 0;
                IR <= 0;
                MAR_ld <= 0;
                MDR_ld <= 0;
                R_W <= 0;
                MOV <= 1;
                MA_1 <= 0;
                MA_0 <= 0;
                MB_1 <= 0;
                MB_0 <= 0;
                MC_2 <= 0;
                MC_1 <= 0;
                MC_0 <= 0;
                MD <= 0;
                ME <= 0;
                OP <= 5'b00000;
            end

            //21
            6'b010101:
            begin
                SE <= 0;
                size <= 2'b10;
                FR_ld <= 0;
                RF_ld <= 0;
                IR <= 0;
                MAR_ld <= 0;
                MDR_ld <= 0;
                R_W <= 0;
                MOV <= 1;
                MA_1 <= 0;
                MA_0 <= 0;
                MB_1 <= 0;
                MB_0 <= 0;
                MC_2 <= 0;
                MC_1 <= 0;
                MC_0 <= 0;
                MD <= 0;
                ME <= 0;
                OP <= 5'b00000;
            end

            //22
            6'b010110:
            begin
                SE <= 0;
                size <= 2'b10;
                FR_ld <= 0;
                RF_ld <= 0;
                IR <= 0;
                MAR_ld <= 0;
                MDR_ld <= 0;
                R_W <= 0;
                MOV <= 1;
                MA_1 <= 0;
                MA_0 <= 0;
                MB_1 <= 0;
                MB_0 <= 0;
                MC_2 <= 0;
                MC_1 <= 0;
                MC_0 <= 0;
                MD <= 0;
                ME <= 0;
                OP <= 5'b00000;
            end

            //23
            6'b010111:
            begin
                SE <= 0;
                size <= 2'b00;
                FR_ld <= 0;
                RF_ld <= 1;
                IR <= 0;
                MAR_ld <= 0;
                MDR_ld <= 0;
                R_W <= 0;
                MOV <= 0;
                MA_1 <= 0;
                MA_0 <= 0;
                MB_1 <= 0;
                MB_0 <= 1;
                MC_2 <= 0;
                MC_1 <= 1;
                MC_0 <= 0;
                MD <= 1;
                ME <= 0;
                OP <= 5'b00100;
            end

            //24
            6'b011000:
            begin
                SE <= 0;
                size <= 2'b00;
                FR_ld <= 0;
                RF_ld <= 1;
                IR <= 0;
                MAR_ld <= 0;
                MDR_ld <= 0;
                R_W <= 0;
                MOV <= 0;
                MA_1 <= 0;
                MA_0 <= 0;
                MB_1 <= 0;
                MB_0 <= 1;
                MC_2 <= 0;
                MC_1 <= 1;
                MC_0 <= 0;
                MD <= 1;
                ME <= 0;
                OP <= 5'b00010;
            end

            //25
            6'b011001:
            begin
                SE <= 0;
                size <= 2'b00;
                FR_ld <= 0;
                RF_ld <= 0;
                IR <= 0;
                MAR_ld <= 1;
                MDR_ld <= 0;
                R_W <= 0;
                MOV <= 0;
                MA_1 <= 0;
                MA_0 <= 0;
                MB_1 <= 0;
                MB_0 <= 0;
                MC_2 <= 0;
                MC_1 <= 0;
                MC_0 <= 0;
                MD <= 1;
                ME <= 0;
                OP <= 5'b10000;
            end

            //26
            6'b011010:
            begin
                SE <= 0;
                size <= 2'b00;
                FR_ld <= 0;
                RF_ld <= 0;
                IR <= 0;
                MAR_ld <= 1;
                MDR_ld <= 0;
                R_W <= 0;
                MOV <= 0;
                MA_1 <= 0;
                MA_0 <= 0;
                MB_1 <= 0;
                MB_0 <= 1;
                MC_2 <= 0;
                MC_1 <= 0;
                MC_0 <= 0;
                MD <= 1;
                ME <= 0;
                OP <= 5'b00100;
            end

            //27
            6'b011011:
            begin
                SE <= 0;
                size <= 2'b00;
                FR_ld <= 0;
                RF_ld <= 0;
                IR <= 0;
                MAR_ld <= 1;
                MDR_ld <= 0;
                R_W <= 0;
                MOV <= 0;
                MA_1 <= 0;
                MA_0 <= 0;
                MB_1 <= 0;
                MB_0 <= 1;
                MC_2 <= 0;
                MC_1 <= 0;
                MC_0 <= 0;
                MD <= 1;
                ME <= 0;
                OP <= 5'b00010;
            end

            //28
            6'b011100:
            begin
                SE <= 0;
                size <= 2'b01;
                FR_ld <= 0;
                RF_ld <= 0;
                IR <= 0;
                MAR_ld <= 0;
                MDR_ld <= 0;
                R_W <= 1;
                MOV <= 1;
                MA_1 <= 0;
                MA_0 <= 0;
                MB_1 <= 0;
                MB_0 <= 0;
                MC_2 <= 0;
                MC_1 <= 0;
                MC_0 <= 0;
                MD <= 0;
                ME <= 0;
                OP <= 5'b00000;
            end

            //29
            6'b011101:
            begin
                SE <= 1;
                size <= 2'b01;
                FR_ld <= 0;
                RF_ld <= 0;
                IR <= 0;
                MAR_ld <= 0;
                MDR_ld <= 1;
                R_W <= 1;
                MOV <= 1;
                MA_1 <= 0;
                MA_0 <= 0;
                MB_1 <= 0;
                MB_0 <= 0;
                MC_2 <= 0;
                MC_1 <= 0;
                MC_0 <= 0;
                MD <= 0;
                ME <= 0;
                OP <= 5'b00000;
            end

            //30
            6'b011110:
            begin
                SE <= 0;
                size <= 2'b00;
                FR_ld <= 0;
                RF_ld <= 0;
                IR <= 0;
                MAR_ld <= 0;
                MDR_ld <= 0;
                R_W <= 1;
                MOV <= 1;
                MA_1 <= 0;
                MA_0 <= 0;
                MB_1 <= 0;
                MB_0 <= 0;
                MC_2 <= 0;
                MC_1 <= 0;
                MC_0 <= 0;
                MD <= 0;
                ME <= 0;
                OP <= 5'b00000;
            end

            //31
            6'b011111:
            begin
                SE <= 1;
                size <= 2'b00;
                FR_ld <= 0;
                RF_ld <= 0;
                IR <= 0;
                MAR_ld <= 0;
                MDR_ld <= 1;
                R_W <= 1;
                MOV <= 1;
                MA_1 <= 0;
                MA_0 <= 0;
                MB_1 <= 0;
                MB_0 <= 0;
                MC_2 <= 0;
                MC_1 <= 0;
                MC_0 <= 0;
                MD <= 0;
                ME <= 0;
                OP <= 5'b00000;
            end

            //32
            6'b100000:
            begin
                SE <= 0;
                size <= 2'b01;
                FR_ld <= 0;
                RF_ld <= 0;
                IR <= 0;
                MAR_ld <= 0;
                MDR_ld <= 0;
                R_W <= 1;
                MOV <= 1;
                MA_1 <= 0;
                MA_0 <= 0;
                MB_1 <= 0;
                MB_0 <= 0;
                MC_2 <= 0;
                MC_1 <= 0;
                MC_0 <= 0;
                MD <= 0;
                ME <= 0;
                OP <= 5'b00000;
            end

            //33
            6'b100001:
            begin
                SE <= 0;
                size <= 2'b01;
                FR_ld <= 0;
                RF_ld <= 0;
                IR <= 0;
                MAR_ld <= 0;
                MDR_ld <= 1;
                R_W <= 1;
                MOV <= 1;
                MA_1 <= 0;
                MA_0 <= 0;
                MB_1 <= 0;
                MB_0 <= 0;
                MC_2 <= 0;
                MC_1 <= 0;
                MC_0 <= 0;
                MD <= 0;
                ME <= 0;
                OP <= 5'b00000;
            end

            //34
            6'b100010:
            begin
                SE <= 0;
                size <= 2'b00;
                FR_ld <= 0;
                RF_ld <= 1;
                IR <= 0;
                MAR_ld <= 0;
                MDR_ld <= 0;
                R_W <= 0;
                MOV <= 0;
                MA_1 <= 0;
                MA_0 <= 0;
                MB_1 <= 1;
                MB_0 <= 0;
                MC_2 <= 0;
                MC_1 <= 0;
                MC_0 <= 0;
                MD <= 1;
                ME <= 0;
                OP <= 5'b01101;
            end

            //35
            6'b100011:
            begin
                SE <= 0;
                size <= 2'b10;
                FR_ld <= 0;
                RF_ld <= 0;
                IR <= 0;
                MAR_ld <= 0;
                MDR_ld <= 0;
                R_W <= 1;
                MOV <= 1;
                MA_1 <= 0;
                MA_0 <= 0;
                MB_1 <= 0;
                MB_0 <= 0;
                MC_2 <= 0;
                MC_1 <= 0;
                MC_0 <= 0;
                MD <= 0;
                ME <= 0;
                OP <= 5'b00000;
            end

            //36
            6'b100100:
            begin
                SE <= 0;
                size <= 2'b10;
                FR_ld <= 0;
                RF_ld <= 0;
                IR <= 0;
                MAR_ld <= 0;
                MDR_ld <= 1;
                R_W <= 1;
                MOV <= 1;
                MA_1 <= 0;
                MA_0 <= 0;
                MB_1 <= 0;
                MB_0 <= 0;
                MC_2 <= 0;
                MC_1 <= 0;
                MC_0 <= 0;
                MD <= 0;
                ME <= 0;
                OP <= 5'b00000;
            end

            //37
            6'b100101:
            begin
                SE <= 0;
                size <= 2'b00;
                FR_ld <= 0;
                RF_ld <= 1;
                IR <= 0;
                MAR_ld <= 0;
                MDR_ld <= 0;
                R_W <= 0;
                MOV <= 0;
                MA_1 <= 0;
                MA_0 <= 0;
                MB_1 <= 1;
                MB_0 <= 0;
                MC_2 <= 0;
                MC_1 <= 0;
                MC_0 <= 0;
                MD <= 1;
                ME <= 0;
                OP <= 5'b01101;
            end

            //38
            6'b100110:
            begin
                SE <= 0;
                size <= 2'b00;
                FR_ld <= 0;
                RF_ld <= 0;
                IR <= 0;
                MAR_ld <= 0;
                MDR_ld <= 1;
                R_W <= 0;
                MOV <= 0;
                MA_1 <= 0;
                MA_0 <= 1;
                MB_1 <= 0;
                MB_0 <= 0;
                MC_2 <= 0;
                MC_1 <= 0;
                MC_0 <= 0;
                MD <= 1;
                ME <= 1;
                OP <= 5'b10000;
            end

            //39
            6'b100111:
            begin
                SE <= 0;
                size <= 2'b10;
                FR_ld <= 0;
                RF_ld <= 0;
                IR <= 0;
                MAR_ld <= 0;
                MDR_ld <= 0;
                R_W <= 0;
                MOV <= 1;
                MA_1 <= 0;
                MA_0 <= 0;
                MB_1 <= 0;
                MB_0 <= 0;
                MC_2 <= 0;
                MC_1 <= 0;
                MC_0 <= 0;
                MD <= 0;
                ME <= 0;
                OP <= 5'b00000;
            end

            //40
            6'b101000:
            begin
                SE <= 0;
                size <= 2'b10;
                FR_ld <= 0;
                RF_ld <= 0;
                IR <= 0;
                MAR_ld <= 0;
                MDR_ld <= 0;
                R_W <= 0;
                MOV <= 1;
                MA_1 <= 0;
                MA_0 <= 0;
                MB_1 <= 0;
                MB_0 <= 0;
                MC_2 <= 0;
                MC_1 <= 0;
                MC_0 <= 0;
                MD <= 0;
                ME <= 0;
                OP <= 5'b00000;
            end

            //41
            6'b101001:
            begin
                SE <= 0;
                size <= 2'b00;
                FR_ld <= 0;
                RF_ld <= 0;
                IR <= 0;
                MAR_ld <= 0;
                MDR_ld <= 1;
                R_W <= 0;
                MOV <= 0;
                MA_1 <= 1;
                MA_0 <= 1;
                MB_1 <= 0;
                MB_0 <= 0;
                MC_2 <= 0;
                MC_1 <= 0;
                MC_0 <= 0;
                MD <= 1;
                ME <= 1;
                OP <= 5'b10000;
            end

            //42
            6'b101010:
            begin
                SE <= 0;
                size <= 2'b00;
                FR_ld <= 0;
                RF_ld <= 0;
                IR <= 0;
                MAR_ld <= 1;
                MDR_ld <= 0;
                R_W <= 0;
                MOV <= 0;
                MA_1 <= 0;
                MA_0 <= 0;
                MB_1 <= 0;
                MB_0 <= 0;
                MC_2 <= 0;
                MC_1 <= 0;
                MC_0 <= 0;
                MD <= 1;
                ME <= 0;
                OP <= 5'b10001;
            end

            //43
            6'b101011:
            begin
                SE <= 0;
                size <= 2'b00;
                FR_ld <= 0;
                RF_ld <= 0;
                IR <= 0;
                MAR_ld <= 1;
                MDR_ld <= 0;
                R_W <= 0;
                MOV <= 0;
                MA_1 <= 0;
                MA_0 <= 1;
                MB_1 <= 0;
                MB_0 <= 0;
                MC_1 <= 0;
                MC_2 <= 0;
                MC_0 <= 0;
                MD <= 1;
                ME <= 0;
                OP <= 5'b10010;
            end

            //44
            6'b101100:
            begin
                SE <= 0;
                size <= 2'b00;
                FR_ld <= 0;
                RF_ld <= 0;
                IR <= 0;
                MAR_ld <= 1;
                MDR_ld <= 0;
                R_W <= 0;
                MOV <= 0;
                MA_1 <= 0;
                MA_0 <= 1;
                MB_1 <= 0;
                MB_0 <= 0;
                MC_2 <= 0;
                MC_1 <= 0;
                MC_0 <= 0;
                MD <= 1;
                ME <= 0;
                OP <= 5'b10011;
            end

            //45
            6'b101101:
            begin
                SE <= 0;
                size <= 2'b10;
                FR_ld <= 0;
                RF_ld <= 0;
                IR <= 0;
                MAR_ld <= 0;
                MDR_ld <= 0;
                R_W <= 1;
                MOV <= 1;
                MA_1 <= 0;
                MA_0 <= 0;
                MB_1 <= 0;
                MB_0 <= 0;
                MC_2 <= 0;
                MC_1 <= 0;
                MC_0 <= 0;
                MD <= 0;
                ME <= 0;
                OP <= 5'b00000;
            end

            //46
            6'b101110:
            begin
                SE <= 0;
                size <= 2'b10;
                FR_ld <= 0;
                RF_ld <= 0;
                IR <= 0;
                MAR_ld <= 0;
                MDR_ld <= 1;
                R_W <= 1;
                MOV <= 1;
                MA_1 <= 0;
                MA_0 <= 0;
                MB_1 <= 0;
                MB_0 <= 0;
                MC_2 <= 0;
                MC_1 <= 0;
                MC_0 <= 0;
                MD <= 0;
                ME <= 0;
                OP <= 5'b00000;
            end

            //47
            6'b101111:
            begin
                SE <= 0;
                size <= 2'b00;
                FR_ld <= 0;
                RF_ld <= 0;
                IR <= 1;
                MAR_ld <= 0;
                MDR_ld <= 0;
                R_W <= 0;
                MOV <= 0;
                MA_1 <= 0;
                MA_0 <= 0;
                MB_1 <= 1;
                MB_0 <= 0;
                MC_2 <= 0;
                MC_1 <= 1;
                MC_0 <= 1;
                MD <= 1;
                ME <= 0;
                OP <= 5'b01101;
            end

            //48
            6'b110000:
            begin
                SE <= 0;
                size <= 2'b10;
                FR_ld <= 0;
                RF_ld <= 0;
                IR <= 0;
                MAR_ld <= 0;
                MDR_ld <= 0;
                R_W <= 0;
                MOV <= 1;
                MA_1 <= 0;
                MA_0 <= 0;
                MB_1 <= 1;
                MB_0 <= 0;
                MC_2 <= 0;
                MC_1 <= 0;
                MC_0 <= 0;
                MD <= 0;
                ME <= 0;
                OP <= 5'b00000;
            end

            //49
            6'b110001:
            begin
                SE <= 0;
                size <= 2'b10;
                FR_ld <= 0;
                RF_ld <= 0;
                IR <= 0;
                MAR_ld <= 0;
                MDR_ld <= 0;
                R_W <= 0;
                MOV <= 1;
                MA_1 <= 0;
                MA_0 <= 0;
                MB_1 <= 1;
                MB_0 <= 0;
                MC_2 <= 0;
                MC_1 <= 0;
                MC_0 <= 0;
                MD <= 0;
                ME <= 0;
                OP <= 5'b00000;
            end

            //50
            6'b110010:
            begin
                SE <= 0;
                size <= 2'b01;
                FR_ld <= 0;
                RF_ld <= 0;
                IR <= 0;
                MAR_ld <= 0;
                MDR_ld <= 0;
                R_W <= 0;
                MOV <= 1;
                MA_1 <= 0;
                MA_0 <= 0;
                MB_1 <= 1;
                MB_0 <= 0;
                MC_2 <= 0;
                MC_1 <= 0;
                MC_0 <= 0;
                MD <= 0;
                ME <= 0;
                OP <= 5'b00000;
            end

            //51
            6'b110011:
            begin
                SE <= 0;
                size <= 2'b01;
                FR_ld <= 0;
                RF_ld <= 0;
                IR <= 0;
                MAR_ld <= 0;
                MDR_ld <= 0;
                R_W <= 0;
                MOV <= 1;
                MA_1 <= 0;
                MA_0 <= 0;
                MB_1 <= 1;
                MB_0 <= 0;
                MC_2 <= 0;
                MC_1 <= 0;
                MC_0 <= 0;
                MD <= 0;
                ME <= 0;
                OP <= 5'b00000;
            end
            default:
                $display("Error: Control Signals Encoder. State not recognized S = %b", S);
        endcase
    end
endmodule
