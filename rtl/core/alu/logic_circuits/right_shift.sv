module right_shift #(parameter N = 32) (
    input logic [N-1:0] a, 
    output logic [N-1:0] y
);

assign y = a >> 1;

endmodule
