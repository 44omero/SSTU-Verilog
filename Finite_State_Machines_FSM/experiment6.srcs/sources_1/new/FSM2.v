`timescale 1ns / 1ps

module FSM2(
    input x,clk,
    output reg z //we make "z" reg for DFF
    );
    wire Q2,Q1,Q0,a;
    wire Z;
    reg q2,q1,q0;
    initial begin
    q2 = 1;
    q1 = 0;
    q0 = 1;
    end
    //Q2 = aq1
    assign Q2 = (a & q1);
    //Q1 = a
    assign Q1 = (a);
    //Q0 = x'
    assign Q0 = (!x);
    //z = aq2
    assign Z = (a & q2);
    //a = x^q0
    assign a = (x^q0);
    always @(posedge clk) begin
    q2 <= Q2;
    q1 <= Q1;
    q0 <= Q0;
    z  <= Z;
    end
endmodule
