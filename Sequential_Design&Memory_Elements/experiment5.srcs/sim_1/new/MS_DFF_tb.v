`timescale 1ns / 1ps

module MS_DFF_tb;
    reg D, CLK;
    wire Q, Qn;
    
    MS_DFF dut(.D(D),.CLK(CLK),.Q(Q),.Qn(Qn));
    
    initial begin
    CLK = 1'b0; D = 1'b0; #10
    CLK = 1'b0; D = 1'b1; #10
    CLK = 1'b1; D = 1'b1; #10
    CLK = 1'b1; D = 1'b0; #10
    CLK = 1'b0; D = 1'b0; #10
    CLK = 1'b0; D = 1'b0; #10
    CLK = 1'b0; D = 1'b0; #10
    CLK = 1'b1; D = 1'b0; #10
    CLK = 1'b1; D = 1'b1; #10
    CLK = 1'b1; D = 1'b1; #10
    CLK = 1'b1; D = 1'b1; #10
    CLK = 1'b0; D = 1'b1; #10
    CLK = 1'b1; D = 1'b1; #10
    CLK = 1'b1; D = 1'b0; #10
    CLK = 1'b0; D = 1'b0; #10
    CLK = 1'b0; D = 1'b0; #10
    
    $finish;
    end
endmodule
