module mux2 (
    input wire a, b, sel,
    output reg y
);
    always @(*) begin
        if (sel == 0)
            y = a;
        else
            y = b;
    end
endmodule

# Regla de oro: Un módulo debe tener un solo bloque always.\
# Si se necesitan múltiples bloques always, se deben dividir en múltiples módulos.
# Combinacional -> always @(*) -> blocking =.
# Secuencial -> always @(posedge clk) -> non-blocking <=.