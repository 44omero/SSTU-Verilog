`timescale 1ns / 1ps

module CSA_tb;

    reg  [15:0]inA;
    reg  [15:0]inB;
    wire [15:0]C;
    wire overflow, cout;
    
    CSA3 dut(.inA(inA), .inB(inB), .C(C), .overflow(overflow), .cout(cout));
    
    initial begin
    inA=0; inB=0;
    #10
    inA = 8; inB = 13;
    #50
    inA = -1; inB = -1;
    #50
    inA = -1; inB = -2;
    #50
    inA = -1; inB = -3;
    #50
    inA = -1; inB = -4;
    #50
    inA = -1; inB = -5;
    #50
    inA = -1; inB = -6;
    #50
    inA = -1; inB = -7;
    #50
    inA = -1; inB = -8;
    #50
    inA = -1; inB = -9;
    #50
    inA = -2; inB = -1;
    #50
    inA = -2; inB = -2;
    #50
    inA = -2; inB = -3;
    #50
    inA = -2; inB = -4;
    #50
    inA = -2; inB = -5;
    #50
    inA = -2; inB = -6;
    #50
    inA = -2; inB = -7;
    #50
    inA = -2; inB = -8;
    #50
    inA = -2; inB = -9;
    #50
    inA = -3; inB = -1;
    #50
    inA = -3; inB = -2;
    #50
    inA = -3; inB = -3;
    #50
    inA = -3; inB = -4;
    #50
    inA = -3; inB = -5;
    #50
    inA = -3; inB = -6;
    #50
    inA = -3; inB = -7;
    #50
    inA = -3; inB = -8;
    #50
    inA = -3; inB = -9;
    #50
    inA = -4; inB = -1;
    #50
    inA = -4; inB = -2;
    #50
    inA = -4; inB = -3;
    #50
    inA = -4; inB = -4;
    #50
    inA = -4; inB = -5;
    #50
    inA = -4; inB = -6;
    #50
    inA = -4; inB = -7;
    #50
    inA = -4; inB = -8;
    #50
    inA = -4; inB = -9;
    #50
    inA = -5; inB = -1;
    #50
    inA = -5; inB = -2;
    #50
    inA = -5; inB = -3;
    #50
    inA = -5; inB = -4;
    #50
    inA = -5; inB = -5;
    #50
    inA = -5; inB = -6;
    #50
    inA = -5; inB = -7;
    #50
    inA = -5; inB = -8;
    #50
    inA = -5; inB = -9;
    #50
    inA = -6; inB = -1;
    #50
    inA = -6; inB = -2;
    #50
    inA = -6; inB = -3;
    #50
    inA = -6; inB = -4;
    #50
    inA = -6; inB = -5;
    #50
    inA = -6; inB = -6;
    #50
    inA = -6; inB = -7;
    #50
    inA = -6; inB = -8;
    #50
    inA = -6; inB = -9;
    #50
    inA = -7; inB = -1;
    #50
    inA = -7; inB = -2;
    #50
    inA = -7; inB = -3;
    #50
    inA = -7; inB = -4;
    #50
    inA = -7; inB = -5;
    #50
    inA = -7; inB = -6;
    #50
    inA = -7; inB = -7;
    #50
    inA = -7; inB = -8;
    #50
    inA = -7; inB = -9;
    #50
    inA = -8; inB = -1;
    #50
    inA = -8; inB = -2;
    #50
    inA = -8; inB = -3;
    #50
    inA = -8; inB = -4;
    #50
    inA = -8; inB = -5;
    #50
    inA = -8; inB = -6;
    #50
    inA = -8; inB = -7;
    #50
    inA = -8; inB = -8;
    #50
    inA = -8; inB = -9;
    #50
    inA = -9; inB = -1;
    #50
    inA = -9; inB = -2;
    #50
    inA = -9; inB = -3;
    #50
    inA = -9; inB = -4;
    #50
    inA = -9; inB = -5;
    #50
    inA = -9; inB = -6;
    #50
    inA = -9; inB = -7;
    #50
    inA = -9; inB = -8;
    #50
    inA = -9; inB = -9;
    #50
   
    inA = -11233; inB = -8;
    #50
    inA = 16'b1011_1111_1111_1011; 
    inB = 16'b1011_1111_1111_1010; 
    #50
    inA = 16'b0111_1111_1111_1011; 
    inB = 16'b0111_1111_1111_1010; 
    #50
    $finish;
    end
endmodule
