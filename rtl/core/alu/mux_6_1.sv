// 6 to 1 mux for the comparison module

module mux_6_1 #(parameter N = 32) (
    input logic [2:0] sel, 
    input logic [N-1:0] d0,
    input logic [N-1:0] d1,
    input logic [N-1:0] d2,
    input logic [N-1:0] d3,
    input logic [N-1:0] d4,
    input logic [N-1:0] d5,
    output logic [N-1:0] d
);


always_comb begin
    case (sel)
        3'd2: d = d0;
        3'd3: d = d1;
        3'd4: d = d2;
        3'd5: d = d3;
        3'd6: d = d4;
        3'd7: d = d5;
        default: d = 32'b0;
    endcase
end
endmodule
