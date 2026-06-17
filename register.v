module register(
  input clk,
  input rst,
  input read_enable,
  input write_enable,
  input [1:0] read_address1,
  input [1:0] read_address2,
  input [1:0] write_address,
  output reg [7:0] read_data1,
  output reg [7:0] read_data2,
  input  [7:0] write_data
 
);
 reg [7:0] regfile [0:3];
 integer i;
always @(posedge clk) begin

if(rst) begin
for(i=0;i<4;i=i+1)
regfile[i]<=8'h00;
end
 
if(write_enable) begin
   regfile[write_address]<=write_data;
   end
end
always @(*) begin
    if(read_enable) begin
        read_data1 = regfile[read_address1];
        read_data2 = regfile[read_address2];
    end
else begin
        read_data1 = 8'h00;
        read_data2 = 8'h00;
    end
end
endmodule
