`timescale 1ns / 1ps

module CONV128(
    input clk,rst,
    input [1039:0]data,
    input [23:0]weight,
    output [1023:0]result
    );
    wire [7:0]res_vector[127:0];
    genvar step;
    generate begin
        for (step = 0; step <128; step = step +1)begin
            CONV conv1(.clk(clk), .rst(rst), .data(data[step*8+23:step*8]), 
                       .weight(weight), .result(res_vector[step]));
            assign result[step*8+7:step*8] = res_vector[step];
        end
    end
    endgenerate
endmodule
