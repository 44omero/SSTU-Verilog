`timescale 1ns / 1ps

module CLA_tb;
    reg [3:0]x;
    reg [3:0]y; 
    reg c0;     
    wire [3:0]s;
    wire cout;
    
    CLA dut(.x(x), 
            .y(y), 
            .c0(c0), 
            .cout(cout), 
            .s(s));
    integer i;
    initial begin
        c0=0;
        for(i=0; i<256; i=i+1) begin
                #10 {x,y} = i;
        end
    $finish;
    end
endmodule
