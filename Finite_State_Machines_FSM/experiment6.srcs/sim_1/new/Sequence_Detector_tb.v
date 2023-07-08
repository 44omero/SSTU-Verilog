`timescale 1ns / 1ps

module Sequence_Detector_tb;
    reg clk=0,x;
    wire z;
    
    Sequence_Detector dut(.clk(clk), .x(x), .z(z));
    always begin
    #10 clk = ~clk;
    end
    initial begin
    x = 0; #20
    x = 1; #20
    x = 0; #20
    x = 1; #20
    x = 1; #20
    x = 0; #20
    x = 1; #20
    x = 0; #20
    x = 0; #20
    x = 1; #20
    x = 0; #20
    x = 0; #20
    x = 1; #20
    x = 0; #20
    x = 0; #20
    $finish;
    end
endmodule
