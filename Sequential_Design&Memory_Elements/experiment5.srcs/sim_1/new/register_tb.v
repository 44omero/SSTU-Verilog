`timescale 1ns / 1ps

module register_tb;
    reg [7:0] IN;
    reg CLK=0, CLR;
    wire [7:0] OUT;
    
    register dut(.IN(IN), .CLK(CLK), .CLR(CLR), .OUT(OUT));
    
    always begin
    #5 CLK=~CLK;
    end
    initial begin
    CLR = 0; #23
    CLR = 1; #10
    CLR = 0; #17;
    end
    initial begin
    IN = 8'ha1; #10
    IN = 8'hb2; #10
    IN = 8'h32; #10
    IN = 8'h62; #10
    IN = 8'h7e; #10
    
    $finish;
    end
endmodule
