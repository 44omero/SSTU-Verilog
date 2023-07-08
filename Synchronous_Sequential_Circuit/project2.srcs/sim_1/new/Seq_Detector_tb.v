`timescale 1ns / 1ps

module Seq_Detector_tb;
    reg clk=0,rst,X;
    wire Y;
    
    Seq_Detector dut(.clk(clk), .rst(rst), .X(X), .Y(Y));
    
    always begin
    #5 clk = ~clk;
    end
    // possible sequence states
    // 1001001
    // 100111
    // 0111001
    // 01110111
    // 10011001
    initial begin
    rst = 1; #114
    rst = 0;
    X = 0; #10
    X = 1; #10
    X = 0; #10
    X = 0; #10
    X = 1; #10
    X = 0; #10
    X = 0; #10
    X = 1; #10
    X = 1; #10
    X = 0; #10
    rst = 1; #10
    rst = 0;
    X = 0; #10
    X = 1; #10
    X = 0; #10
    X = 0; #10
    X = 1; #10
    X = 1; #10
    X = 1; #10
    X = 1; #10
    X = 0; #10
    rst = 1; #10
    rst = 0;
    X = 0; #10
    X = 0; #10
    X = 1; #10
    X = 1; #10
    X = 1; #10
    X = 0; #10
    X = 0; #10
    X = 1; #10
    X = 1; #10
    X = 0; #10
    rst = 1; #10
    rst = 0;
    X = 0; #10
    X = 0; #10
    X = 1; #10
    X = 1; #10
    X = 1; #10
    X = 0; #10
    X = 1; #10
    X = 1; #10
    X = 1; #10
    X = 1; #10
    X = 0; #10
    rst = 1; #10
    rst = 0;
    X = 0; #10
    X = 1; #10
    X = 0; #10
    X = 0; #10
    X = 1; #10
    X = 1; #10
    X = 0; #10
    X = 0; #10
    X = 1; #10
    X = 1; #10
    X = 0; #10
    rst = 1; #10
    rst = 0;
    X = 0; #10
    $finish;
    end
endmodule
