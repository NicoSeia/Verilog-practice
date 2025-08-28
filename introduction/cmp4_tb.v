`timescale 1ns/1ps

module cmp4_tb;
    reg  [3:0] a, b;
    wire lt, eq, gt;

    cmp4 dut (.a(a), .b(b), .lt(lt), .eq(eq), .gt(gt));

    initial begin
        $dumpfile("cmp4.vcd");
        $dumpvars(0, cmp4_tb);

        // Casos de prueba básicos
        a = 4'd0;  b = 4'd0;  #10;   // eq=1
        a = 4'd3;  b = 4'd7;  #10;   // lt=1
        a = 4'd8;  b = 4'd2;  #10;   // gt=1
        a = 4'd15; b = 4'd15; #10;   // eq=1
        a = 4'd9;  b = 4'd10; #10;   // lt=1
        a = 4'd10; b = 4'd9;  #10;   // gt=1

        // Barrido rápido
        a = 0; b = 0;
        repeat (8) begin
            #5 a = a + 1;
            #5 b = b + 2;
        end

        #10 $finish;
    end
endmodule