`timescale 1ns/1ps

module and_gate_tb;
    reg a, b;
    wire y;

    // Instanciamos el módulo a probar
    and_gate uut (
        .a(a),
        .b(b),
        .y(y)
    );

    initial begin
        // Creamos archivo de salida para GTKWave
        $dumpfile("and_gate.vcd");
        $dumpvars(0, and_gate_tb);

        // Probamos combinaciones
        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;

        $finish;
    end
endmodule