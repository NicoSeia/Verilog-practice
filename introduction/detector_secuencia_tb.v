`timescale 1ns/1ps
module detector_secuencia_tb;
    reg clk, rst, din;
    wire found;

    detector_secuencia dut(.clk(clk), .rst(rst), .din(din), .found(found));

    // clock 10 ns
    initial begin clk=0; forever #5 clk=~clk; end

    initial begin
        $dumpfile("detector_secuencia.vcd");
        $dumpvars(0, detector_secuencia_tb);

        rst=1; din=0; #12; rst=0;

        // 101 → found=1 una vez
        din=1; #10; din=0; #10; din=1; #10;

        // 1101 → found=1 al final
        din=1; #10; din=1; #10; din=0; #10; din=1; #10;

        // 10101 → dos pulsos
        din=1; #10; din=0; #10; din=1; #10; din=0; #10; din=1; #10;

        $finish;
    end
endmodule
