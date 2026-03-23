module logic_gate_playground (
    input   logic a, b,
    output  logic and_out, or_out, xor_out, nand_out
);

    assign  and_out  = a & b,
            or_out   = a | b,
            xor_out  = a ^ b,
            nand_out = ~(a & b);

endmodule