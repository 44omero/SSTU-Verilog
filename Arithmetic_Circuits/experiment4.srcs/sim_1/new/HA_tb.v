`timescale 1ns / 1ps

module HA_tb;

    reg x,y;
    wire cout,s;

    HA dut(.x(x), .y(y), .cout(cout), .s(s));
    
    initial begin
        for(integer i=0; i<4; i=i+1) begin
                #100 {x,y} = i;
        end
    $finish;
    end
endmodule
