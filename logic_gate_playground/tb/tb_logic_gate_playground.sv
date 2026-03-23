module logic_gate_playground_tb;

    logic input_a;
    logic input_b;
    logic output_and;
    logic output_or;
    logic output_xor;
    logic output_nand;

    
    logic_gate_playground dut (
        // Format: .dut_port_name (testbench_signal_name)
        .a        (input_a),
        .b        (input_b),
        .and_out  (output_and),
        .or_out   (output_or),
        .xor_out  (output_xor),   
        .nand_out (output_nand)
    );

    task automatic check_outputs(
        input logic a_val,
        input logic b_val
    );
        assert (output_and  === (a_val & b_val))
            else $error("AND mismatch for a=%0b b=%0b: got=%0b exp=%0b", a_val, b_val, output_and, (a_val & b_val));
        assert (output_or   === (a_val | b_val))
            else $error("OR mismatch for a=%0b b=%0b: got=%0b exp=%0b", a_val, b_val, output_or, (a_val | b_val));
        assert (output_xor  === (a_val ^ b_val))
            else $error("XOR mismatch for a=%0b b=%0b: got=%0b exp=%0b", a_val, b_val, output_xor, (a_val ^ b_val));
        assert (output_nand === ~(a_val & b_val))
            else $error("NAND mismatch for a=%0b b=%0b: got=%0b exp=%0b", a_val, b_val, output_nand, ~(a_val & b_val));
    endtask

    initial begin
        $dumpfile("dumps/logic_gate_playground_dump.vcd");
        $dumpvars(0, logic_gate_playground_tb);

        input_a = 0;
        input_b = 0;
        #1;

        check_outputs(input_a, input_b);

        input_a = 0;
        input_b = 1;
        #1;

        check_outputs(input_a, input_b);

        input_a = 1;
        input_b = 0;
        #1;

        check_outputs(input_a, input_b);

        input_a = 1;
        input_b = 1;
        #1;

        check_outputs(input_a, input_b);

        $display("All logic gate checks passed.");
        $finish;
    end

endmodule