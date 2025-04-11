module left_rotate #(parameter N = 32) (
    input logic [N-1:0] a, 
    output logic [N-1:0] y
);

assign y = {a[(N-2):0], a[N-1]};

    
endmodule
