module controller(
    input clk,
    input rst,
    input enable,
    input [3:0] opcode,

    output reg read_enable,
    output reg write_enable,

    output reg [1:0] read_address1,
    output reg [1:0] read_address2,
    output reg [1:0] write_address,

    output reg [3:0] sel_alu
);

parameter IDLE      = 3'b000;
parameter LOAD      = 3'b001;
parameter EXEC      = 3'b010;
parameter WRITEBACK = 3'b011;
parameter DONE      = 3'b100;

reg [2:0] state, next_state;

always @(posedge clk) begin
    if(rst)
        state <= IDLE;
    else
        state <= next_state;
end

always @(*) begin

    next_state = state;

    case(state)

        IDLE:
            if(enable)
                next_state = LOAD;
            else
                next_state = IDLE;

        LOAD:
            next_state = EXEC;

        EXEC:
            next_state = WRITEBACK;

        WRITEBACK:
            next_state = DONE;

        DONE:
            next_state = IDLE;

        default:
            next_state = IDLE;

    endcase
end

always @(*) begin

    read_enable   = 1'b0;
    write_enable  = 1'b0;

    read_address1 = 2'b00;
    read_address2 = 2'b00;
    write_address = 2'b00;

    sel_alu       = 4'b0000;

    case(state)

        LOAD: begin
            read_enable   = 1'b1;
            read_address1 = 2'b00;
            read_address2 = 2'b01;
        end

        EXEC: begin
           read_enable   = 1'b1;
           read_address1 = 2'b00;
            read_address2 = 2'b01;
            sel_alu = opcode;
        end

        WRITEBACK: begin
            write_enable = 1'b1;
            read_enable   = 1'b1;
           read_address1 = 2'b00;
            read_address2 = 2'b01;
            write_address = 2'b11;
        end

        DONE: begin
        end

    endcase
end

endmodule
