`timescale 1ns / 1ps

module TOP_tb_t;
    reg clk=0,rst;
    reg [7:0]InA,InB;
    reg start=0;
    wire busy;
    wire [7:0]Out;
    
    TOP dut(.clk(clk),.rst(rst),.InA(InA),.InB(InB),.start(start),.busy(busy),.Out(Out));
    always begin
        #5 clk = ~clk;
    end
    initial begin
        rst=1; #10
        rst=0;
        InA= 8'd15;
        InB= 8'd40;
        start = 1'b1; #300
        $finish;
    end
endmodule
