`timescale 1ns / 1ps

module FSM2_tb;
    reg x,clk=0;
    wire z;
    
    FSM2 dut(.clk(clk), .x(x), .z(z));
    
    always begin
    #10 clk=~clk;
    end
    initial begin
    x = 0; #20 x = 1; #20
    x = 0; #20 x = 0; #20
    x = 1; #20 x = 1; #20 
    x = 0; #20 x = 0; #20 
    x = 0; #20 x = 1; #20 
    x = 1; #20 x = 1; #20 
    x = 0; #20 x = 0; #20 
    x = 0; #20 x = 0; #20 
    x = 1; #20 x = 1; #20 
    x = 1; #20 x = 1; #20 
    x = 0; #20 x = 0; #20 
    x = 0; #20 x = 0; #20 
    x = 0; #20 x = 1; #20 
    x = 1; #20 x = 1; #20 
    x = 1; #20 x = 1; #20 
    x = 0; #20 x = 0; #20 
    x = 0; #20 x = 0; #20 
    x = 0; #20 x = 0; #20 
    x = 1; #20 x = 1; #20 
    x = 1; #20 x = 1; #20 
    x = 1; #20 x = 1; #20 
    $finish;
    end 
endmodule
