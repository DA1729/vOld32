module right_rotate #(parameter N = 8)(
    input logic [N-1:0] a, 
    output logic [N-1:0] y
);

assign y = {a[0], a[(N-1):1]};
    
endmodule
