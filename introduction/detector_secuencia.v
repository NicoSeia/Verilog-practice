module detector_secuencia #(
    parameter s0 = 2'b00,
    parameter s1 = 2'b01,
    parameter s2 = 2'b10,
    parameter s3 = 2'b11
)(
    input wire clk, rst,
    input wire din,
    output reg found
);

    reg [1:0] state, next_state;

    always @(*) begin
        found = 1'b0;
        case (state)
            s0: next_state = din ? s1 : s0;
            s1: next_state = din ? s1 : s2;
            s2: next_state = din ? s3 : s0;
            s3: begin
                found = 1'b1;
                next_state = din ? s1 : s2;
            end
            default: next_state = s0; // Estado por defecto
        endcase
    end

    always @(posedge clk) begin
        if (rst)
            state <= s0;
        else
            state <= next_state;
    end
endmodule
