module acumulador_controlado (
    input wire clk, rst, en,
    input wire [1:0] sel,
    input wire [3:0] in,

    output reg [3:0] acc,  // Valor actual del acumulador
    output reg [3:0] next // Siguiente valor del acumulador
);
    always @(*) begin
        // Valor por defecto para evitar latches
        next = acc;

        case (sel)
            2'b00: next = acc + in; // Suma
            2'b01: next = acc - in; // Resta
            2'b10: next = acc ^ in; // XOR
            2'b11: next = acc;      // Mantener
        endcase
    end

    always @(posedge clk) begin
        if (rst)
            acc <= 4'b0000;  // Reinicia el acumulador a 0
        else if (en)
            acc <= next;
    end
endmodule
