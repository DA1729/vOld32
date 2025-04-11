module mux_2_1 #(parameter N = 8) (
    input logic [4:0] sel,
    input logic s_ub, a_dd, 
    output logic d
);

always_comb begin
    case (sel)
        5'd0: d = a_dd;
        5'd1: d = s_ub;
        default: d = 1'b0;
    endcase
end

endmodule
