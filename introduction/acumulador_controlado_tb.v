`timescale 1ns/1ps

module acumulador_controlado_tb;
    reg        clk, rst, en;
    reg  [1:0] sel;
    reg  [3:0] in;
    wire [3:0] acc, next;

    acumulador_controlado dut (
        .clk(clk),
        .rst(rst),
        .en(en),
        .sel(sel),
        .in(in),
        .acc(acc),
        .next(next)
    );

    // Clock de 10 ns de período
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("acumulador_controlado.vcd");
        $dumpvars(0, acumulador_controlado_tb);

        // Reset
        rst=1; en=0; sel=2'b00; in=4'd0; #12;
        rst=0;

        // Suma: 0 -> 3 -> 6
        en=1; sel=2'b00; in=4'd3; #10;
                               #10;

        // Resta: 6 - 2 = 4
        sel=2'b01; in=4'd2;     #10;

        // XOR: 4 ^ 15 = 11
        sel=2'b10; in=4'd15;    #10;

        // Mantener: acc sigue en 11
        sel=2'b11; in=4'd5;     #10;

        // en=0: no cambia
        en=0; sel=2'b00; in=4'd1; #10;

        $finish;
    end
endmodule
