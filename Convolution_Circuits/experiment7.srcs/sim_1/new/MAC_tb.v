`timescale 1ns / 1ps

module MAC_tb();
    reg clk=0, rst;
    reg [23:0] data;
    reg [23:0] weight;
    wire [19:0] result;
    
    MAC dut(.clk(clk),.rst(rst),.data(data),
           .weight(weight),.result(result));
           
    always begin
    #10 clk = ~clk;
    end
    initial begin 
    rst = 1; #6
    rst = 0;
    data   = 24'b00000000_00000100_00000000; //  0  4  0 
    weight = 24'b11111111_11111111_11111111; // -1 -1 -1 
    #20 
    data   = 24'b00000001_00001001_00000000; //  1  9  0 
    weight = 24'b11111111_00001000_11111111; // -1  8 -1 
    #20 
    data   = 24'b00000000_00001001_00001001; //  0  9  9
    weight = 24'b11111111_11111111_11111111; // -1 -1 -1 
    #20
    $write("Data = [0 4 0; 1 9 0; 0 9 9], Weights = [-1 -1 -1; -1 8 -1; -1 -1 -1]\n");
    $write("Result Matrix = [0 -4 0; -1 72 0; -7 -4 -5]\n");
    $write("Result = R11 + R12 + R13 + R21 + R22 + R23 + R31 + R32 + R33\n");
    $write("Result = %d\n", result);
    $finish; 
    end
endmodule

