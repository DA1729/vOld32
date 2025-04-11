# ALU 

I am going to use the following ALU architecture (1): 

![ALU-Block Diagram](Pasted_image.png)


## Opcode Table

| Operation      | OpCode |
|----------------|--------|
| ADD            | 00000  |
| SUB            | 00001  |
| MUL            | 00010  |
| DIV            | 00011  |
| AND            | 00100  |
| OR             | 00101  |
| XOR            | 00110  |
| NOR            | 00111  |
| NAND           | 01000  |
| XNOR           | 01001  |
| EQ (Equal)     | 01010  |
| NEQ (Not Eq.)  | 01011  |
| LT (Less Than) | 01100  |
| LTE (≤)        | 01101  |
| GT (Greater)   | 01110  |
| GTE (≥)        | 01111  |
| Shift Left     | 10000  |
| Shift Right    | 10001  |
| Rotate Left    | 10010  |
| Rotate Right   | 10011  |


## Additional Notes

- I am not yet implementing the hardware implementations of Multiplication and Division, as it will increase the complexity in the initial stages.
- Another reason I can get around without these implementations is because I can always perform them at the software level.
- Although I am still reserving the OpCodes for them as I intend to add them in the later stages.   

## References

[1] Huang,Z. (2023). Design and implementation of an 8-bit ALU based on verilog HDL. Theoretical and Natural Science,14,180-185.
