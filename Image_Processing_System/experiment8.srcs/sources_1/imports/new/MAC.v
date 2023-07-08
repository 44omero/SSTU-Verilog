`timescale 1ns / 1ps

module MAC(
    input clk,rst,
    input signed [23:0] data,weight,
    output reg signed [19:0] result
    );
    wire signed [15:0] product [2:0];
    wire signed [15:0] sum [1:0];
    reg [1:0] counter;
    MULTS_behav MULT0(.A(data[7:0]), .X(weight[7:0]), .result(product[0]));
    MULTS_behav MULT1(.A(data[15:8]), .X(weight[15:8]), .result(product[1]));
    MULTS_behav MULT2(.A(data[23:16]), .X(weight[23:16]), .result(product[2]));
    ADDER_behav ADD1(.x(product[0]), .y(product[1]), .sum(sum[0]));
    ADDER_behav ADD2(.x(product[2]), .y(sum[0]), .sum(sum[1]));
    
    always @ (posedge clk or posedge rst) begin
        if(rst) begin
            counter <= 0; 
            result <= 0; 
        end
        else begin
            result <= result + sum[1];
            counter <= counter + 1; 
        end
    end
endmodule
