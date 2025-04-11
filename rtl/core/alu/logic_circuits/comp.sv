module comparator #(parameter N = 8) (
    input logic [N-1:0] a, b,
    output logic [N-1:0] eq, neq, lt, lte, gt, gte
);


// we get the information of the following boolean comparisons: 
// equal (eq), not equal (neq)
// lesser than (lt), lesser than or equal (lte)
// greater than (gt), greater than or equal (gte)

assign eq = (a == b);
assign neq = (a != b);
assign lt = (a < b);
assign lte = (a <= b);
assign gt = (a > b); 
assign gte = (a >= b);

    
endmodule
