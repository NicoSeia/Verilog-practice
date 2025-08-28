`timescale 1ns/1ps

module mini_alu_tb;
    reg [3:0] a;
    reg [3:0] b;
    reg [1:0] sel;
    wire [3:0] y;

    // Instantiate the mini_alu module
    mini_alu uut (
        .a(a),
        .b(b),
        .sel(sel),
        .y(y)
    );

    initial begin
        $dumpfile("mini_alu.vcd");
        $dumpvars(0, mini_alu_tb);
        // Test AND operation
        a = 4'b1100; b = 4'b1010; sel = 2'b00; #10;
        $display("AND: %b & %b = %b", a, b, y);

        // Test OR operation
        a = 4'b1100; b = 4'b1010; sel = 2'b01; #10;
        $display("OR: %b | %b = %b", a, b, y);

        // Test ADD operation
        a = 4'b0011; b = 4'b0101; sel = 2'b10; #10;
        $display("ADD: %b + %b = %b", a, b, y);

        // Test SUBTRACT operation
        a = 4'b0110; b = 4'b0011; sel = 2'b11; #10;
        $display("SUBTRACT: %b - %b = %b", a, b, y);

        // Finish simulation
        $finish;
    end
endmodule