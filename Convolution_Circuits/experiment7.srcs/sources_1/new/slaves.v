`timescale 1ns / 1ps

module ADDER_behav#(
    parameter bit_count = 16
    )(
    input wire signed[bit_count-1:0]x,y,
    output reg signed[bit_count-1:0]sum
    );
    always @(*)begin
        sum = x + y;
    end
endmodule
module CLA16(
    input [15:0] x,y,
    input cin,
    output [15:0] s,
    output cout
    );
wire c1,c2,c3;

CLA4 cla0 (.x(x[3:0])  , .y(y[3:0])  , .c0(cin), .s(s[3:0]),   .cout(c1));
CLA4 cla1 (.x(x[7:4])  , .y(y[7:4])  , .c0(c1),  .s(s[7:4]),   .cout(c2));
CLA4 cla2 (.x(x[11:8]) , .y(y[11:8]) , .c0(c2),  .s(s[11:8]),  .cout(c3));
CLA4 cla3 (.x(x[15:12]), .y(y[15:12]), .c0(c3),  .s(s[15:12]), .cout(cout));

    
endmodule

module CLA4( 
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
 assign c[0] = p[0] & c0; 
 assign wcout[0] = c[0] | g[0]; 
 //c1
 assign c[1] = p[1] & wcout[0]; 
 assign wcout[1] = c[1] | g[1]; 
 //c2
 assign c[2] = p[2] & wcout[1]; 
 assign wcout[2] = c[2] | g[2]; 
 //c3
 assign c[3] = p[3] & wcout[2]; 
 assign wcout[3] = c[3] | g[3]; 
 //sums
 assign s[0] = p[0] ^ c0; 
 assign s[1] = p[1] ^ wcout[0]; 
 assign s[2] = p[2] ^ wcout[1]; 
 assign s[3] = p[3] ^ wcout[2]; 
 //cout
 assign cout = wcout[3]; 
endmodule
