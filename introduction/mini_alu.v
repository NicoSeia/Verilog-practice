module mini_alu (
    input wire [3:0] a,
    input wire [3:0] b,
    input wire [1:0] sel,
    output reg [3:0] y
);
    always @(*) begin
        case (sel)
            2'b00: y = a & b;        // AND operation
            2'b01: y = a | b;        // OR operation
            2'b10: y = a + b;        // ADD operation
            2'b11: y = a - b;        // SUBTRACT operation
            default: y = 4'b0000;    // Default case
        endcase
    end
endmodule