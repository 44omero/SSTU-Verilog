`timescale 1ns / 1ps

module CONV(
    input clk,rst,
    input [23:0] data,weight,
    output [7:0] result
    );
    wire [19:0]w_mac;
    MAC mac1(.clk(clk), .rst(rst), .data(data), .weight(weight), .result(w_mac));
    MAC_normalize demac1(.data(w_mac), .result(result));
endmodule
