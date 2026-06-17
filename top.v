module top(
    input clk,
    input rst,
    input enable,
    input [3:0] opcode
   
);

wire read_enable;
wire write_enable;

wire [1:0] read_address1;
wire [1:0] read_address2;
wire [1:0] write_address;

wire [3:0] sel_alu;

wire [7:0] read_data1;
wire [7:0] read_data2;
wire [7:0] alu_out;


controller CTRL(
    .clk(clk),
    .rst(rst),
    .enable(enable),
    .opcode(opcode),

    .read_enable(read_enable),
    .write_enable(write_enable),

    .read_address1(read_address1),
    .read_address2(read_address2),

    .write_address(write_address),

    .sel_alu(sel_alu)
);

register RF(
    .clk(clk),
    .rst(rst),

    .read_enable(read_enable),
    .write_enable(write_enable),

    .read_address1(read_address1),
    .read_address2(read_address2),

    .write_address(write_address),

    .read_data1(read_data1),
    .read_data2(read_data2),

    .write_data(alu_out)
);

alu ALU(
    .A(read_data1),
    .B(read_data2),
    .sel(sel_alu),
    .Y(alu_out)
);




endmodule
