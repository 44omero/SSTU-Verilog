`timescale 1ns / 1ps

module HA(
    input x, y,
    output cout, s
    );
    xor xorHA(s,x,y);
    and andHA(cout,x,y);
endmodule

module FA(
    input x, y, ci,
    output cout, s
    );
    wire ha0cout, ha0s, ha1cout;
    HA HA0(x,y,ha0cout,ha0s);
    HA HA1(ha0s, ci, ha1cout,s);
    or orFA(cout,ha0cout,ha1cout);
endmodule

module RCA(
    input [3:0]x,
    input [3:0]y,
    input ci,
    output cout,
    output [3:0]s
    );
    
    wire cout0,cout1,cout2;
    FA fa0(.x(x[0]), .y(y[0]), .ci(ci), .cout(cout0), .s(s[0]));
    FA fa1(.x(x[1]), .y(y[1]), .ci(cout0), .cout(cout1), .s(s[1]));
    FA fa2(.x(x[2]), .y(y[2]), .ci(cout1), .cout(cout2), .s(s[2]));
    FA fa3(.x(x[3]), .y(y[3]), .ci(cout2), .cout(cout), .s(s[3]));
endmodule

module parametric_RCA#(
    parameter SIZE = 8
    )(
    input [SIZE-1:0]x,
    input [SIZE-1:0]y,
    input ci,
    output cout,
    output [SIZE-1:0]s
    );
    
    wire [SIZE:0]wcout;
    assign wcout[0] = ci;
    
    genvar step;
    generate
        for (step = 0 ; step < SIZE ; step = step + 1)begin
            FA p_fa(.x(x[step]), 
                    .y(y[step]), 
                    .ci(wcout[step]), 
                    .cout(wcout[step+1]), 
                    .s(s[step]));
        end
    endgenerate
    assign cout = wcout[SIZE];
endmodule

module CLA(
    input [3:0]x,
    input [3:0]y,
    input c0,
    output cout,
    output [3:0]s
    );
    wire [3:0]p,g,wcout,c;
    //propagate
    assign p[0]=x[0]^y[0];
    assign p[1]=x[1]^y[1];
    assign p[2]=x[2]^y[2];
    assign p[3]=x[3]^y[3];
    //generate
    assign g[0] = x[0] & y[0];
    assign g[1] = x[1] & y[1];
    assign g[2] = x[2] & y[2];
    assign g[3] = x[3] & y[3];
    //c0
    assign c[0]     = p[0] & c0;
    assign wcout[0] = c[0] | g[0];
    //c1
    assign c[1]     = p[1] & wcout[0];
    assign wcout[1] = c[1] | g[1];
    //c2
    assign c[2]     = p[2] & wcout[1];
    assign wcout[2] = c[2] | g[2];
    //c3
    assign c[3]     = p[3] & wcout[2];
    assign wcout[3] = c[3] | g[3];
    //sums
    assign s[0] = p[0] ^ c0;
    assign s[1] = p[1] ^ wcout[0];
    assign s[2] = p[2] ^ wcout[1];
    assign s[3] = p[3] ^ wcout[2];
    //cout
    assign cout = wcout[3];
endmodule

module Add_Sub(
    input [3:0]A,
    input [3:0]B,
    input Cin,
    output cout, V,
    output [3:0]SUM
    );

    wire wfa0in,wfa1in,wfa2in,wfa3in;
    wire wfa0cout,wfa1cout,wfa2cout,wfa3cout;
    assign wfa0in = Cin ^ B[0];
    assign wfa1in = Cin ^ B[1];
    assign wfa2in = Cin ^ B[2];
    assign wfa3in = Cin ^ B[3];
    
    FA fa0(.x(A[0]), .y(wfa0in), .ci(Cin), .cout(wfa0cout), .s(SUM[0]));
    FA fa1(.x(A[1]), .y(wfa1in), .ci(wfa0cout), .cout(wfa1cout), .s(SUM[1]));
    FA fa2(.x(A[2]), .y(wfa2in), .ci(wfa1cout), .cout(wfa2cout), .s(SUM[2]));
    FA fa3(.x(A[3]), .y(wfa3in), .ci(wfa2cout), .cout(cout), .s(SUM[3]));
    
    assign V = cout ^ wfa2cout; 
endmodule


