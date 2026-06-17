module alu(
    input  [7:0] A,
    input  [7:0] B,
    input  [3:0] sel,
    output reg [7:0] Y
);

always @(*) begin
    case(sel)
        4'b0000: Y = A + B; // ADD
        4'b0001: Y = A - B; // SUB
        4'b0010: Y = A & B; // AND  
        4'b0011: Y = A | B; // OR
        4'b0100: Y = A ^ B; // XOR
        default: Y = 8'd0;
    endcase
end

endmodule
