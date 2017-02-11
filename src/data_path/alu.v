module alu (output reg [31:0] O, output reg [3:0] Flags, input [31:0] A, B, input [4:0] OP, input CIN);
    // A = Rn
    // B = shifter_operand
    // O = Rd
    // Flag[0] = V
    // Flag[1] = C
    // Flag[2] = Z
    // Flag[3] = N
    always@(OP, A, B) begin
        case(OP)
                                                        //                                   Status Flags  ARM Manual
                                                        //                                    N  Z  C  V    Section
            5'b00000: O = A & B;                        // AND - Logical AND                  *  *  -  -    A4.1.4
            5'b00001: O = A ^ B;                        // EOR - Logical Exclusive OR         *  *  -  -    A4.1.18
            5'b00010: begin                             // SUB - Subtract                     *  *  *  *    A4.1.106
                      {Flags[1], O} = A - B;            // Save Subtraction, C Flag Update
                      Flags[0] = (A[31] != B[31])       // V Flag Update
                                  && (O[31] == B[31]);
                    end
            5'b00011: begin                             // RSB - Reverse Subtract             *  *  *  *    A4.1.60
                      {Flags[1], O} = B - A;            // Save Subtraction, C Flag Update
                      Flags[0] = (A[31] != B[31])       // V Flag Update
                                  && (O[31] == A[31]);
                    end
            5'b00100: begin                             // ADD - Addition                     *  *  *  *    A4.1.3
                      {Flags[1], O} = A + B;            // Save Addition, C Flag Update
                      Flags[0] = (A[31] == B[31])       // V Flag Update
                                && (A[31] != O[31]);
                    end
            5'b00101: begin                             // ADC - Addition with Carry          *  *  *  *    A4.1.2
                      {Flags[1], O} = A + B + CIN;      // Save Addition, C Flag Update
                      Flags[0] = ((A[31] == B[31])      // V Flag Update
                                && A[31] != O[31]);
                    end
            5'b00110: begin                             // SBC - Subtract with Carry          *  *  *  *    A4.1.65
                      {Flags[1], O} = A - B - ~CIN;     // Save Subtraction, C Flag Update
                      Flags[0] = (A[31] != B[31])       // V Flag Update
                                  && (O[31] == B[31]);
                    end
            5'b00111: begin                             // RSC - Reverse Subtract with Carry  *  *  *  *    A4.1.61
                      {Flags[1], O} = B - A - ~CIN;     // Save Subtraction, C Flag Update
                      Flags[0] = (A[31] != B[31])       // V Flag Update
                                  && (O[31] == A[31]);
                    end
            5'b01000: O = A & B;                        // TST - Test             (AND)       *  *  -  -    A4.1.117
            5'b01001: O = A ^ B;                        // TEQ - Test Equivalence (EOR)       *  *  -  -    A4.1.116
            5'b01010: begin                             // CMP - Compare          (SUB)       *  *  *  *    A4.1.15
                      {Flags[1], O} = A - B;            // Save Subtraction, C Flag Update
                      Flags[0] = (A[31] != B[31])       // V Flag Update
                                  && (O[31] == B[31]);
                    end
            5'b01011: begin                             // CMN - Compare Negated  (ADD)       *  *  *  *    A4.1.14
                      {Flags[1], O} = A + B;            // Save Addition, C Flag Update
                      Flags[0] = (A[31] == B[31])       // V Flag Update
                                && (A[31] != O[31]);
                    end
            5'b01100: O = A | B;                        // ORR - Logical OR                   *  *  -  -    A4.1.42
            5'b01101: O = B;                            // MOV - Move                         *  *  -  -    A4.1.35
            5'b01110: O = A & ~B;                       // BIC - Bit Clear                    *  *  -  -    A4.1.6
            5'b01111: O = ~B;                           // MVN - Move Not                     *  *  -  -    A4.1.41
            // Special use for CU operations-----------------------------------------------------------------------
            5'b10000: O = A;                            // Return A
            5'b10001: O = A + 3'b100;                   // Return A + 4
            5'b10010: O = A + B + 3'b100;               // Return A + B + 4
            5'b10011: O = A - B + 3'b100;               // Return A - B + 4
            // default: $display("Error: ALU OP not defined");
        endcase
        // Always update N Z Flags
        Flags[3] = O[31];               // N Flag Update
        Flags[2] = !O;                  // Z Flag Update
    end
endmodule
