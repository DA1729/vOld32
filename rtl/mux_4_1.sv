module mux_4_1 #(
    parameter n = 64
) (
    input logic [n-1 : 0] in_0,
    input logic [n-1 : 0] in_1,
    input logic [n-1 : 0] in_2,
    input logic [n-1 : 0] in_3,
    input logic [    1:0] sel,

    output logic [n-1 : 0] out
);

    always_comb begin : out_proc
        case (sel)
            2'b00:   out = in_0;
            2'b01:   out = in_1;
            2'b10:   out = in_2;
            2'b11:   out = in_3;
            default: out = 'bx;
        endcase
    end

endmodule
