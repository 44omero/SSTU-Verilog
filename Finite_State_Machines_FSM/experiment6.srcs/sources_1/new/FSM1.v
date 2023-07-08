`timescale 1ns / 1ps

module FSM1(
    input x,clk,
    output z //we make "z" reg for DFF
    );
    wire Q2,Q1,Q0;
    //wire Z;
    reg q2,q1,q0;
    initial begin
    q2 = 1;
    q1 = 0;
    q0 = 1;
    end
    //Q2 = xq1q0' + xq2
    assign Q2 = (x & q1 & !q0) | (x & q2);
    //Q1 = q2'q0 + x
    assign Q1 = (!q2 & q0) | x;
    //Q0 = x'q1' + x'q2'q0 + xq2
    assign Q0 = (!x & !q1) | (!x & !q2 & q0) | (x & q2);
    //z = x'q2'q1q0 + xq2q0
    assign z = (!x & !q2 & q1 & q0) | (x & q2 & q0);
    always @(posedge clk) begin
    q2 <= Q2;
    q1 <= Q1;
    q0 <= Q0;
    //z  <= Z;
    end
endmodule
