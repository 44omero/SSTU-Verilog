`timescale 1ns / 1ps

module MULTS_behav(
    input wire signed [7:0]A,X,
    output reg signed [15:0]result
    );
    
    always @(*)begin
        result = A * X;
    end
endmodule
