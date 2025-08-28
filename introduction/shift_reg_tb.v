`timescale 1ns/1ps

module shift_reg_tb;
    reg clk, rst, din;
    wire [3:0] q;

    shift_reg dut (.clk(clk), .rst(rst), .din(din), .q(q));

    // Generador de clock
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // periodo = 10 ns
    end

    initial begin
        $dumpfile("shift_reg.vcd");
        $dumpvars(0, shift_reg_tb);

        // Reset
        rst = 1; din = 0; #12;
        rst = 0;

        // Cargamos bits en serie
        din = 1; #10;
        din = 0; #10;
        din = 1; #10;
        din = 1; #10;
        din = 0; #10;

        #20 $finish;
    end
endmodule
