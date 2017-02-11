module ram_256 (
    output reg[31:0] DataOut,
    output reg MOC,
    input [31:0] DataIn,
    input R_W,
    input MOV,
    input [7:0] Address,
    input [1:0] size
    );
    reg[7:0] Mem[0:255];

    // For loading instructions to RAM
    integer fd, code;
    reg[7:0] data, ptr;

    // Task to print memory contents
    task print_memory;
    begin
        ptr = 0;
        $display("Address  | Content");
        $display("----------------------------------------------");
        repeat(256 / 4) begin
            $write("%d      | ", ptr);
            repeat(4) begin
                $write("%b ", Mem[ptr]);
                ptr = ptr + 1;
            end
            $write("\n");
        end
        $display("\n");
    end
    endtask

    always @(MOV, R_W)
        begin
            if (MOV)
                begin
                    if(R_W)
                        case(size)
                            // READING
                            // Byte
                            2'b00:
                                begin
                                    DataOut[7:0] <= Mem[Address];
                                    DataOut[31:8] <= 24'b0;
                                end
                            // Halfword
                            2'b01:
                                begin
                                    DataOut[15:8] <= Mem[Address];
                                    DataOut[7:0] <= Mem[Address + 1];
                                    DataOut[31:16] <= 16'b0;
                                end
                            // Word
                            2'b10:
                                begin
                                    DataOut[31:24] <= Mem[Address];
                                    DataOut[23:16] <= Mem[Address+1];
                                    DataOut[15:8] <= Mem[Address+2];
                                    DataOut[7:0] <= Mem[Address+3];
                                end
                        endcase
                    else
                        case(size)
                            // WRITING
                            // Byte
                            2'b00: Mem[Address] <= DataIn[7:0];
                            // Halfword
                            2'b01:
                                begin
                                    Mem[Address] <= DataIn[15:8];
                                    Mem[Address + 1] <= DataIn[7:0];
                                end
                            // Word
                            2'b10:
                                begin
                                    Mem[Address] <= DataIn[31:24];
                                    Mem[Address+1] <= DataIn[23:16];
                                    Mem[Address+2] <= DataIn[15:8];
                                    Mem[Address+3] <= DataIn[7:0];
                                end
                        endcase
                    // Turn MOC on After Operation was successful
                    MOC = 1;
                end
            else
                begin
                    //DataOut = 32'bz;
                    MOC = 0;
                end
        end

    initial begin
        ptr = 0;
        // Load RAM with instructions ------------------------------------------
        fd = $fopen("../test/input/testcode_arm1.txt", "r");
        while(!($feof(fd)) && $fscanf(fd, "%b", data)) begin
            Mem[ptr] = data;
            ptr = ptr + 1;
        end
        // Print Initial Memory Contents ---------------------------------------
        $display("----------------------------------------------");
        $display("\nInitial memory content. Instructions Loaded.\n");
        print_memory();

        #2200  // Increment time delay if necessary.
        // Print Final Memory Contents -----------------------------------------
        $display("----------------------------------------------");
        $display("\nFinal memory content.\n");
        print_memory();
    end

endmodule
