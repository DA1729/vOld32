module mux_20_1 #(parameter N = 8) (
    input logic [4:0] sel,
    input logic [N-1:0] d0,
    input logic [N-1:0] d1,
    input logic [N-1:0] d2,
    input logic [N-1:0] d3,
    input logic [N-1:0] d4,
    input logic [N-1:0] d5,
    input logic [N-1:0] d6,
    input logic [N-1:0] d7,
    input logic [N-1:0] d8,
    input logic [N-1:0] d9,
    input logic [N-1:0] d10,
    input logic [N-1:0] d11,
    input logic [N-1:0] d12,
    input logic [N-1:0] d13,
    input logic [N-1:0] d14,
    output logic [N-1:0] d
);

always_comb begin
case (sel)
    5'd0: d = d0;
    5'd1: d = d1;
    5'd2: d = d2;
    5'd3: d = d3;
    5'd4: d = d4;
    5'd5: d = d5;
    5'd6: d = d6;
    5'd7: d = d7;
    5'd8: d = d8;
    5'd9: d = d9;
    5'd10: d = d10;
    5'd11: d = d10;
    5'd12: d = d10;
    5'd13: d = d10;
    5'd14: d = d10;
    5'd15: d = d10;
    5'd16: d = d11;
    5'd17: d = d12;
    5'd18: d = d13;
    5'd19: d = d14;
    default: d = 8'b0;
endcase
end

endmodule
