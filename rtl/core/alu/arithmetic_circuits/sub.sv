module sub #(parameter N = 8)(
    input logic [N-1:0] a, b,
    output logic [N-1:0] y, 
    output logic [N-1:0] c_out, //flag
    output logic [N-1:0] z_, // zero flag
    output logic [N-1:0] v, //overflow flag
    output logic [N-1:0] n // negative flag
);

assign {c_out, y} = a - b;

assign z_ = (y == 8'b0);

assign v = (a[N-1] != b[N-1]) && (y[N-1]  != a[N-1]);

assign n = y[N-1];
    
endmodule
