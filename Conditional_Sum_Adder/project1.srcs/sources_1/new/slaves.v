`timescale 1ns / 1ps

module CC(
    input inX,inY,
    output s0,c0,s1,c1
    );
    or (c1,inX,inY);
    and(c0,inX,inY);
    xor(s0,inX,inY);
    not(s1,s0);
endmodule
module HA(
    input inX, inY,
    output Cout, sum
    );
    xor xorHA(sum,inX,inY);
    and andHA(Cout,inX,inY);
endmodule

module FA(
    input inX, inY, Cin,
    output Cout, sum
    );
    wire ha0cout, ha0sum, ha1cout;
    HA HA0(.inX(inX), .inY(inY),.Cout(ha0cout), .sum(ha0sum));
    HA HA1(.inX(ha0sum), .inY(Cin), .Cout(ha1cout),.sum(sum));
    or orFA(Cout,ha0cout,ha1cout);
endmodule


module MUX2_1bit(
    input I0,I1,
    input S,
    output O
);
    
assign O = S ? I1 : I0;    
endmodule

module MUX2_2bit(
    input [1:0]I0,I1,
    input S,
    output [1:0]O
);
    
assign O = S ? I1 : I0;    
endmodule

module MUX2_4bit(
    input [3:0]I0,I1,
    input S,
    output [3:0]O
);
    
assign O = S ? I1 : I0;    
endmodule

module MUX2_8bit(
    input [7:0]I0,I1,
    input S,
    output [7:0]O
);
    
assign O = S ? I1 : I0;    
endmodule

module MUX2_16bit(
    input [15:0]I0,I1,
    input S,
    output [15:0]O
);
    
assign O = S ? I1 : I0;    
endmodule
