module CPA_adder #(parameter N = 32)
(
    input logic [N-1:0] a, b,
    input logic c_in,
    output logic [N-1:0] s,
    output logic c_out, // flag (carry)
    output logic v, //flag (overflow)
    output logic z_, //flag (zero)
    output logic n //also a flag (negative)
);


assign {c_out, s} = a + b + c_in;

//flags

assign v = (a[N-1] & ~b[N-1] & ~s[N-1]) | (~a[N-1] & b[N-1] & s[N-1]);

assign z_ = (s == 32'b0);

assign n = s[N-1];

 // Refer: David Harris and Sarah Harris. 2012. Digital Design and Computer Architecture, Second Edition (2nd. ed.). Morgan Kaufmann Publishers Inc., San Francisco, CA, USA.

    
endmodule
