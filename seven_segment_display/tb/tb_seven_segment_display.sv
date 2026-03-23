module tb_seven_segment_display ();

    logic [3:0] in; 
    logic [6:0] out;

    seven_segment_display dut (
        .number (in),
        .signal (out)
    );

    localparam logic [6:0] look_up_table [0:9] = '{
        7'b1111110, // 0
        7'b0110000, // 1
        7'b1101101, // 2
        7'b1111001, // 3
        7'b0110011, // 4
        7'b1011011, // 5
        7'b1011111, // 6
        7'b1110000, // 7
        7'b1111111, // 8
        7'b1111011  // 9
    }; 

    initial begin
        $dumpfile("seven_segment_display_dump.vcd");
        $dumpvars(0, tb_seven_segment_display);

        for (int i = 0; i < 16; i++) begin
            in = i[3:0];
            #1;

            $display("Testing input: %0d", i);

            if (i >= 0 && i <= 9) begin
                assert (out === look_up_table[i])
                    else $error("Error at %0d: expected %b, got %b", i, look_up_table[i], out);
            end else begin
                assert (out === 7'b1111001)
                    else $error("Error at %0d: expected E (1111001), got %b", i, out);
            end
        end
        
        $display("Testing complete.");
        $finish;
    end

endmodule