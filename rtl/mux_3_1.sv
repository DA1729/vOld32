module mux_3_1 #(
    parameter n = 64
) (
    input logic [n - 1:0] in_0,
    input logic [n - 1:0] in_1,
    input logic [n - 1:0] in_2,
    input logic [    1:0] sel,

    output logic [n-1:0] out
);

    assign out = sel[1] ? in_2 : (sel[0] ? in_1 : in_0);
endmodule
