module alu_1bit (
    input a,          // First operand
    input b,          // Second operand
    input cin,        // Carry-in for addition/subtraction
    input [2:0] sel,  // Operation selector
    output reg result,// Result of ALU operation
    output reg cout   // Carry-out for addition/subtraction
);

always @(*) begin
    case (sel)
        3'b000: {cout, result} = a + b + cin;  // Addition
        3'b001: {cout, result} = a - b - cin;  // Subtraction
        3'b010: result = a & b;  // Multiplication (1-bit: AND)
        3'b011: result = (b == 1'b0) ? 1'b0 : a / b; // Division (undefined for b=0)
        3'b100: result = a & b;  // Logical AND
        3'b101: result = a | b;  // Logical OR
        3'b110: result = a ^ b;  // Logical XOR
        3'b111: result = ~(a ^ b); // Logical XNOR
        default: result = 1'b0;
    endcase
end

endmodule
