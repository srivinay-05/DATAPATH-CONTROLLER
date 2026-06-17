 
`timescale 1ns/1ps

module tb;

reg clk;
reg rst;
reg enable;
reg [3:0] opcode;


top DUT(
    .clk(clk),
    .rst(rst),
    .enable(enable),
    .opcode(opcode)

);

always #5 clk = ~clk;

initial begin

    clk = 0;
    rst = 1;
    enable = 0;
   

    #20;
    rst = 0;

    DUT.RF.regfile[0] = 8'd10;
    DUT.RF.regfile[1] = 8'd5;
    opcode = 4'b0000; 

    #10;
    enable = 1;

    #10;
    enable = 0;

    #60;

    $display("R0 = %0d", DUT.RF.regfile[0]);
    $display("R1 = %0d", DUT.RF.regfile[1]);
    $display("R2 = %0d", DUT.RF.regfile[2]);
     $display("R3 = %0d", DUT.RF.regfile[3]);

    $finish;

end

initial begin
    $monitor("TIME=%0t STATE=%0d R0=%0d R1=%0d R2=%0d R3=%0d",
              $time,
              DUT.CTRL.state,
              DUT.RF.regfile[0],
              DUT.RF.regfile[1],
              DUT.RF.regfile[2],
              DUT.RF.regfile[3]

              );
end

initial begin
    $dumpfile("datapath.vcd");
    $dumpvars(0,tb);
end

endmodule



 





  
