`timescale 1ns / 1ps

module Add_Sub_tb;
    reg [3:0]A;
    reg [3:0]B; 
    reg Cin;     
    wire [3:0]SUM;
    wire cout,V;
    
    Add_Sub dut(.A(A), 
    .B(B), .Cin(Cin), 
    .cout(cout), .SUM(SUM), 
    .V(V));
    integer i;
    initial begin
        //all cases
        
        for(i=0; i<512; i=i+1) begin
                #10 {Cin,A,B} = i;
        end
    $finish;
    end
endmodule
