`timescale 1ns / 1ps

module SR_NAND_tb;
    reg S, R;
    wire Q, Qn;
    
    SR_NAND dut(.S(S), .R(R), .Q(Q), .Qn(Qn));
    
    initial begin
    S = 1'b1; R = 1'b0; #10
    S = 1'b1; R = 1'b1; #10
    S = 1'b0; R = 1'b1; #10
    S = 1'b1; R = 1'b1; #10
    $finish;
    end
endmodule
