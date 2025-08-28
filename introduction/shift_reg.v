module shift_reg (
    input wire clk,
    input wire rst,
    input wire din,
    output reg [3:0] q
);
    always @(posedge clk) begin
        if (rst)
            q <= 4'b0000;
        else
            q <= {q[2:0], din}; // Desplaza a la izquierda y agrega din en el LSB
    end
endmodule
