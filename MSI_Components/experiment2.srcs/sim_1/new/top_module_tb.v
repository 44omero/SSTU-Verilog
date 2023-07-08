`timescale 1ns / 1ps

module top_module_tb;

reg  [7:0]sw;
reg  [3:0]btn;
wire [7:0]led;
wire [6:0]cat;
wire [3:0]an;
wire dp;
top_module dut(.sw(sw),
            .btn(btn),
            .led(led),
            .cat(cat),
            .an(an),
            .dp(dp)
            );
            
initial begin
sw[0]=1'b0; btn[1:0] = 2'b00; #10
            btn[1:0] = 2'b01; #10
            btn[1:0] = 2'b10; #10
            btn[1:0] = 2'b11; #10
sw[0]=1'b1; btn[1:0] = 2'b00; #10
            btn[1:0] = 2'b01; #10
            btn[1:0] = 2'b10; #10
            btn[1:0] = 2'b11; #10

$finish;
end
endmodule
