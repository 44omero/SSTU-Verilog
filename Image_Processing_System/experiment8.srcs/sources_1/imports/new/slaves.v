`timescale 1ns / 1ps

module ADDER_behav#(
    parameter bit_count = 16
    )(
    input wire signed[bit_count-1:0]x,y,
    output reg signed[bit_count-1:0]sum
    );
    always @(*)begin
        sum = x + y;
    end
endmodule

module MULTS_behav(
    input wire signed [7:0]A,X,
    output reg signed [15:0]result
    );
    
    always @(*)begin
        result = A * X;
    end
endmodule