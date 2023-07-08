`timescale 1ns / 1ps

module MULTS_signed_tb;
    reg signed [7:0]A,X;
    wire signed [15:0] result;
    
    MULTS_signed dut(.A(A), .X(X), .result(result));
    
    initial 
    begin
    A=5; X=7; #50; 
    $write("%d * %d = %d\n",A, X, result);
    A=9; X=9; #50; 
    $write("%d * %d = %d\n",A, X, result);
    A=12; X=-14; #50; 
    $write("%d * %d = %d\n",A, X, result);
    A=-23; X=42; #50; 
    $write("%d * %d = %d\n",A, X, result);
    A=0; X=2; #50; 
    $write("%d * %d = %d\n",A, X, result);
    
    $finish; 
    end
endmodule

