`timescale 1ns / 1ps

module convo(
    input clk,rst,
    input signed [23:0] data, 
    input signed [23:0] weight,
    output [19:0] result
    );
    MAC MAC0( 
    .clk(clk),.rst(rst),.data(data),
    .weight(weight),.result(result)
    );
    
endmodule
