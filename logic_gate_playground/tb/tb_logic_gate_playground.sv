module tb_logic_gate_playground;

    logic input_a;
    logic input_b;

    logic output_and;
    logic output_or;
    logic output_xor;
    logic output_nand;


    logic_gate_playground dut (
        .a        (input_a),
        .b        (input_b),
        .and_out  (output_and),
        .or_out   (output_or),
        .xor_out  (output_xor),   
        .nand_out (output_nand)
    );


    task automatic check(
        input logic a_val,
        input logic b_val
    );

        assert (output_and  === (a_val & b_val))
            else $error("AND mismatch for a=%b b=%b: expected %b but got %b", a_val, b_val, (a_val & b_val), output_and);
        
        assert (output_or   === (a_val | b_val))
            else $error("OR mismatch for a=%b b=%b: expected %b but got %b", a_val, b_val, (a_val | b_val), output_or);
        
        assert (output_xor  === (a_val ^ b_val))
            else $error("XOR mismatch for a=%b b=%b: expected %b but got %b", a_val, b_val, (a_val ^ b_val), output_xor);
        
        assert (output_nand === ~(a_val & b_val))
            else $error("NAND mismatch for a=%b b=%b: expected %b but got %b", a_val, b_val, ~(a_val & b_val), output_nand);
    endtask

    initial begin
        $dumpfile("logic_gate_playground_dump.vcd");
        $dumpvars(0, tb_logic_gate_playground);

        
        input_a = 0;
        input_b = 0;
        #1;
        check(input_a, input_b);


        input_a = 0;
        input_b = 1;
        #1;
        check(input_a, input_b);


        input_a = 1;
        input_b = 0;
        #1;
        check(input_a, input_b);


        input_a = 1;
        input_b = 1;
        #1;
        check(input_a, input_b);


        $display("All logic gate checks passed.");
        $finish;
    end

endmodule