`timescale 1ns / 1ps

module DECODER(
    input [3:0]IN,
    output reg [15:0]OUT
    );

    always @(*)begin
        case(IN)
            4'b0000: OUT = 16'b0000_0000_0000_0001; 
            4'b0001: OUT = 16'b0000_0000_0000_0010; 
            4'b0010: OUT = 16'b0000_0000_0000_0100; 
            4'b0011: OUT = 16'b0000_0000_0000_1000; 
            4'b0100: OUT = 16'b0000_0000_0001_0000; 
            4'b0101: OUT = 16'b0000_0000_0010_0000; 
            4'b0110: OUT = 16'b0000_0000_0100_0000; 
            4'b0111: OUT = 16'b0000_0000_1000_0000; 
            4'b1000: OUT = 16'b0000_0001_0000_0000; 
            4'b1001: OUT = 16'b0000_0010_0000_0000; 
            4'b1010: OUT = 16'b0000_0100_0000_0000; 
            4'b1011: OUT = 16'b0000_1000_0000_0000; 
            4'b1100: OUT = 16'b0001_0000_0000_0000; 
            4'b1101: OUT = 16'b0010_0000_0000_0000; 
            4'b1110: OUT = 16'b0100_0000_0000_0000; 
            4'b1111: OUT = 16'b1000_0000_0000_0000; 
            default: OUT = 16'b0;
        endcase
    end
endmodule

module ENCODER_PRIMITIVE(
    input [3:0]IN,
    output [1:0]OUT,
    output  V
    );
    //Valid
    or vor1(V, IN[0], IN[1], IN[2], IN[3]);
    //OUT[0]
    wire oo1,notin2;
    not onot1(notin2, IN[2]);
    and oand1(oo1, notin2, IN[1]);
    or oor1(OUT[0], oo1, IN[3]);
    //OUT[1]
    or oor2(OUT[1], IN[2], IN[3]);
    
endmodule

module ENCODER_CASE(
    input [3:0]IN,
    output reg[1:0]OUT,
    output reg V
    );
    always @(*) begin
        casez (IN) 
            4'b0000: begin 
                OUT = 2'b??; 
                V = 1'b0; 
            end
            4'b0001: begin 
                OUT = 2'b00; 
                V = 1'b1; 
            end
            4'b001?: begin 
                OUT = 2'b01; 
                V = 1'b1; 
            end
            4'b01??: begin 
                OUT = 2'b10; 
                V = 1'b1; 
            end
            4'b1???: begin 
                OUT = 2'b11; 
                V = 1'b1; 
            end
        endcase
    end
endmodule

module MUX_ASSIGN(
    input [3:0] D,
    input [1:0] S,
    output O
    );
    wire wa0, wa1, wa2, wa3;
    assign wa3 = (S[0] && S[1] && D[3]);
    assign wa2 = (!S[0] && S[1] && D[2]);
    assign wa1 = (S[0] && !S[1] && D[1]);
    assign wa0 = (!S[0] && !S[1] && D[0]);
    assign O = (wa0 || wa1 || wa2 || wa3);
endmodule

module MUX_CASE(
    input [3:0] D,
    input [1:0] S,
    output reg O
    );
    always @(*) begin
         case (S) 
             2'b00: O = D[0];
             2'b01: O = D[1];
             2'b10: O = D[2];
             2'b11: O = D[3];
         endcase
     end
endmodule

module DEMUX(
    input D,
    input [1:0]S,
    output [3:0]O
    );
    wire s0_not, s1_not;
    NOT not0(.I(S[0]), .O(s0_not));
    NOT not1(.I(S[1]), .O(s1_not));
    
    wire wa0, wa1, wa2, wa3;
    AND and0(.I1(s0_not), .I2(s1_not), .O(wa0));
    AND and1(.I1(S[0]), .I2(s1_not), .O(wa1));
    AND and2(.I1(s0_not), .I2(S[1]), .O(wa2));
    AND and3(.I1(S[0]), .I2(S[1]), .O(wa3));
    
    TRI tsb0(.I(D), .E(wa0), .O(O[0]));
    TRI tsb1(.I(D), .E(wa1), .O(O[1]));
    TRI tsb2(.I(D), .E(wa2), .O(O[2]));
    TRI tsb3(.I(D), .E(wa3), .O(O[3]));
endmodule


