`timescale 1ns / 1ps

module RCA_tb;
    reg [3:0]x;
    reg [3:0]y; 
    reg ci;     
    wire [3:0]s;
    wire cout;
    
    RCA dut(.x(x), .y(y), .ci(ci), .cout(cout), .s(s));
    integer i;
    initial begin
        ci=0;
        for(i=0; i<128; i=i+1) begin
                #10 {x,y} = i;
        end
    $finish;
    end
endmodule
