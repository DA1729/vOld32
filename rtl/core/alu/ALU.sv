module ALU #(parameter N = 32) (
    input logic [4:0] OpCode,
    input logic [N-1:0] a, b,
    input logic         cin,
    output logic [N-1:0] alu_out,
    output logic V, C, N_, Z_ // flags 
);

// getting the comparison module configured with the 6 to 1 mux
// using the ending three bits, we can predict which comparison operator is being called
// note that it is still possible, cuz of the first two bits that the user isn't calling a comparison at all

logic [N-1:0] op_o1, op_o2, op_o3, op_o4, op_o5, op_o6, op_o7, op_o8, op_o9, op_o10, op_o11, op_o12, op_o13, op_o14, op_o15;

logic V_add, V_sub, C_add, C_sub, N_add, N_sub, Z_add, Z_sub;  // intermediate values of the flags


logic [N-1:0] eq_o, neq_o, lt_o, lte_o, gt_o, gte_o;

mux_6_1 comp_output (.sel(OpCode[2:0]),
                        .d0(eq_o),
                        .d1(neq_o),
                        .d2(lt_o),
                        .d3(lte_o),
                        .d4(gt_o),
                        .d5(gte_o),
                        .d(op_o11));  // comparison output to the 20 to 1 mux (master mux perhaps)

// inputs to the 20 to 1 mux

// arithmetic outputs
CPA_gate add_output (.a(a), .b(b), .c(cin), .s(op_o1), .c_out(C_add), .v(V_add), .n(N_add), .z_(Z_add));  // addition output and corresponding flags

sub sub_output (.a(a), .b(b), .y(op_o2), .c_out(C_sub), .z_(Z_sub), .v(V_sub), .n(N_sub)); // subtraction output and corresponding flags

// setting the multiplier and division outputs to 0...
assign op_o3 = 32'b0;
assign op_o4 = 32'b0;

// logic gate outputs

and_gate and_output (.a(a), .b(b), .y(op_o5));  //  and output

or_gate or_output (.a(a), .b(b), .y(op_o6)); // or output

xor_gate xor_output (.a(a), .b(b), .y(op_o7)); // xor output

nor_gate nor_output (.a(a), .b(b), .y(op_o8)); // nor output

nand_gate nand_output (.a(a), .b(b), .y(op_o9)); // nand output

xnor_gate xnor_output (.a(a), .b(b), .y(op_o10)); // xnor output


//shift outputs
left_shift left_s_output (.a(a), .y(op_o12)); // left shift output

right_shift right_s_output (.a(a), .y(op_o13)); // right shift output

left_rotate left_r_output (.a(a), .y(op_o14)); // left rotate output

right_rotate right_r_output (.a(a), .y(op_o15)); // right rotate output





// implementing the master mux (for getting the desired operation's output)

mux_20_1(.sel(OpCode), 
            .d0(op_o1),
            .d1(op_o2),
            .d2(op_o3),
            .d3(op_o4),
            .d4(op_o5),
            .d5(op_o6),
            .d6(op_o7),
            .d7(op_08),
            .d8(op_o9),
            .d9(op_o10),
            .d10(op_o11),
            .d11(op_o12),
            .d12(op_o13),
            .d13(op_o14),
            .d14(op_o15),
            .d(alu_out));                    // the main output of the ALU!!



// flags output

/* we have four flags: 
V: overflow
C: carry
N: negative
Z_: zero

all these flags come from the addition and subtraction operations

keeping default values zero, we'll deploy a 2 to 1 mux  */


// overflow calculation
mux_2_1 overflow_mux_out (.sel(OpCode), .a_dd(V_add), .s_ub(V_sub), .d(V));

// carry calculation
mux_2_1 carry_mux_out (.sel(OpCode), .a_dd(C_add), .s_ub(C_sub), .d(C));

// negative calculation
mux_2_1 negative_mux_out (.sel(OpCode), .a_dd(N_add), .s_ub(N_sub), .d(N_));

// zero calculation
mux_2_1 zero_muz_out (.sel(OpCode), .a_dd(Z_add), .s_ub(Z_sub), .d(Z_));



endmodule
