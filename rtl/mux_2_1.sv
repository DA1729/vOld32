module mux_2_1 #(
    parameter n = 64
) (
    input  logic [n - 1:0] in_0,
    input  logic [n - 1:0] in_1,
    input  logic           sel,
    output logic [n - 1:0] out
);

    assign out = sel ? in_1 : in_0;
endmodule
