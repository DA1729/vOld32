module alu
#(parameter n = 64)
(
input logic [n-1 : 0]       src_1,
input logic [n-1 : 0]       src_2,
input logic [3: 0]          control,
input logic                 is_word,
output logic [n-1 : 0]      result
);

logic [31:0] result_word;

always_comb
    begin: result_proc
        if (!is_word)
       begin
           case(control)
            4'b0000: result = src_1 + src_2;                               // add/addi
            4'b0001: result = src_1 - src_2;                               // sub
            4'b0110: result = src_1 ^ src_2;                               // xor/xori
            4'b0011: result = src_1 | src_2;                               // or/ori
            4'b0010: result = src_1 & src_2;                               // and/andi
            4'b0100: result = $signed(src_1) << src_2[5:0];                // sll/slli
            4'b0111: result = $signed(src_1) >> src_2[5:0];                // srl/srli
            4'b1111: result = $signed(src_1) >>> src_2[5:0];               // sra/srai
            4'b0101: result = $signed(src_1) < $signed(src_2);             // slt/slti
            4'b1000: result = $unsigned(src_1) < $unsigned(src_2);         // sltu/sltiu
            default: result = 'hxxxx_xxxx_xxxx_xxxx;
           endcase
       end

       else
       begin
           case(control)
            4'b0000: result_word = src_1 + src_2;                           // addw/addwi
            4'b0001: result_word = src_1 - src_2;                           // subw
            4'b0100: result_word = $signed(src_1[31:0]) << src_2[4:0];      // sllw/sllwi
            4'b0111: result_word = $signed(src_1[31:0]) >> src_2[4:0];      // srlw/srlwi
            4'b1111: result_word = $signed(src_1[31:0]) >>> src_2[4:0];     // sraw/srawi
            default: result_word = 'hxxxx_xxxx;
        endcase
       end
    end
