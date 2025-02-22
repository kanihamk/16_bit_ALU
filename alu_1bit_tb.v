module alu_1bit_tb;

    // Inputs
    reg a, b, cin;
    reg [2:0] sel;

    // Output
    wire result, cout;

    // Instantiate the ALU
    ALU_1bit uut (
        .a(a), 
        .b(b), 
        .cin(cin), 
        .sel(sel), 
        .result(result), 
        .cout(cout)
    );

    // Test cases
    initial begin
       
        
        // Test ADD (000)
 a = 1; b = 0; cin = 0; sel = 3'b000; #10;
 a = 1; b = 1; cin = 0; sel = 3'b000; #10;
        
        // Test SUBTRACT (001)
        a = 1; b = 0; cin = 1; sel = 3'b001; #10;
        a = 0; b = 1; cin = 1; sel = 3'b001; #10;
        
        // Test MULTIPLY (010)
        a = 1; b = 1; sel = 3'b010; #10;
        a = 0; b = 1; sel = 3'b010; #10;
        
        // Test DIVIDE (011) (Division by zero case not handled)
        a = 1; b = 1; sel = 3'b011; #10;
        
        // Test AND (100)
        a = 1; b = 0; sel = 3'b100; #10;
        a = 1; b = 1; sel = 3'b100; #10;
        
        // Test OR (101)
        a = 0; b = 1; sel = 3'b101; #10;
        a = 0; b = 0; sel = 3'b101; #10;
        
        // Test XOR (110)
        a = 1; b = 1; sel = 3'b110; #10;
        a = 0; b = 1; sel = 3'b110; #10;
        
        // Test XNOR (111)
        a = 1; b = 1; sel = 3'b111; #10;
        a = 1; b = 0; sel = 3'b111; #10;

        $display("Test Completed");
        $finish;
    end

endmodule
