module cmp4 (
    input wire [3:0] a, b,
    output reg lt, gt, eq
);
    always @(*) begin
        // Valor por defectos para evitar latches
        lt = 1'b0;
        gt = 1'b0;
        eq = 1'b0;

        if (a < b) begin
            lt = 1'b1;
        end else if (a > b) begin
            gt = 1'b1;
        end else begin
            eq = 1'b1;
        end
    end
endmodule
