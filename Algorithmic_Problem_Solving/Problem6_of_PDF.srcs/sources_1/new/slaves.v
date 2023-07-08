`timescale 1ns / 1ps

module AND(
    input [7:0]a,b,
    output[7:0]r
    );
    assign r = a & b;
endmodule
module XOR(
    input [7:0]a,b,
    output[7:0]r
    );
    assign r = a ^ b;
endmodule
module CLShift(
    input [7:0]a,
    output[7:0]r
    );
     assign r = {a[6:0],a[7]};
endmodule
module ZeroComp(
    input [7:0]a,
    output reg Z
    );
    always @* begin
        if(a==0)
            Z=1;
        else
            Z=0;
    end
endmodule
module Decoder_4x16(
    input [3:0]RegAdd,
	input WE,
	output reg [15:0]Out
    );
    always @(*) begin
	if(WE == 0)
		Out = 0; 
	else begin
		case(RegAdd)
			4'b0000: Out = 16'b0000_0000_0000_0001;
			4'b0001: Out = 16'b0000_0000_0000_0010;
			4'b0010: Out = 16'b0000_0000_0000_0100;
			4'b0011: Out = 16'b0000_0000_0000_1000;
			4'b0100: Out = 16'b0000_0000_0001_0000;
			4'b0101: Out = 16'b0000_0000_0010_0000;
			4'b0110: Out = 16'b0000_0000_0100_0000;
			4'b0111: Out = 16'b0000_0000_1000_0000;
			4'b1000: Out = 16'b0000_0001_0000_0000;
			4'b1001: Out = 16'b0000_0010_0000_0000;
			4'b1010: Out = 16'b0000_0100_0000_0000;
			4'b1011: Out = 16'b0000_1000_0000_0000;
			4'b1100: Out = 16'b0001_0000_0000_0000;
			4'b1101: Out = 16'b0010_0000_0000_0000;
			4'b1110: Out = 16'b0100_0000_0000_0000;
			4'b1111: Out = 16'b1000_0000_0000_0000;
		endcase
	end
end
endmodule
module register(
    input clk,rst,
	input En,
	input [7:0] Rin,
	output reg [7:0] Rout
    );
    reg [7:0]reg_next;
    reg [7:0]reg_out;
    always @(posedge clk or posedge rst) begin
        if(rst==1)
            reg_out <= 0;
        else
            reg_out <= reg_next;
    end
    always @(*) begin
        if(En)
            reg_next = Rin;
        else
            reg_next = reg_out;
    end
    always @(*) begin
        Rout = reg_out;
    end
    

endmodule

module MUX4_1(
    input I0,
	input I1,
	input I2,
	input I3,
	input S,
	output reg O
    );
    always @* begin
        case(S)
            2'b00: O = I0;
            2'b01: O = I1;
            2'b10: O = I2;
            2'b11: O = I3;
        endcase
    end
endmodule
module MUX4_8(
    input [7:0]I0,
	input [7:0]I1,
	input [7:0]I2,
	input [7:0]I3,
	input [1:0]S,
	output reg [7:0]O
    );
    always @* begin
        case(S)
            2'b00: O = I0;
            2'b01: O = I1;
            2'b10: O = I2;
            2'b11: O = I3;
        endcase
    end
endmodule
module MUX8_8(
    input [7:0]I0,
	input [7:0]I1,
	input [7:0]I2,
	input [7:0]I3,
	input [7:0]I4,
	input [7:0]I5,
	input [7:0]I6,
	input [7:0]I7,
	input [2:0]S,
	output reg [7:0]O
    );
    always @* begin
        case(S)
            3'b000: O = I0;
            3'b001: O = I1;
            3'b010: O = I2;
            3'b011: O = I3;
            3'b100: O = I4;
            3'b101: O = I5;
            3'b110: O = I6;
            3'b111: O = I7;
        endcase
    end
endmodule
module MUX16_8(
    input [7:0]I0,
	input [7:0]I1,
	input [7:0]I2,
	input [7:0]I3,
	input [7:0]I4,
	input [7:0]I5,
	input [7:0]I6,
	input [7:0]I7,
	input [7:0]I8,
	input [7:0]I9,
	input [7:0]I10,
	input [7:0]I11,
	input [7:0]I12,
	input [7:0]I13,
	input [7:0]I14,
	input [7:0]I15,
    input [3:0]S,
	output reg [7:0]O
    );
    always @* begin
        case(S)
            4'b0000: O = I0;
            4'b0001: O = I1;
            4'b0010: O = I2;
            4'b0011: O = I3;
            4'b0100: O = I4;
            4'b0101: O = I5;
            4'b0110: O = I6;
            4'b0111: O = I7;
            4'b1000: O = I8;
            4'b1001: O = I9;
            4'b1010: O = I10;
            4'b1011: O = I11;
            4'b1100: O = I12;
            4'b1101: O = I13;
            4'b1110: O = I14;
            4'b1111: O = I15;
        endcase
    end
endmodule
module ADD(
    input [7:0]a,b,
    output[7:0]r,
    output cout
    );
    wire [8:0] temp;
    assign temp[0] = 0;
    genvar i;
    generate 
        for (i=0;i<8;i=i+1) begin
            FA adder(.x(a[i]), .y(b[i]), .Cin(temp[i]),.Cout(temp[i+1]),.Sum(r[i]));
        end 
    endgenerate
    assign cout=temp[8];
endmodule
module FA(
    input x,y,Cin,
    output Cout,Sum
    );
    wire wsum,w1,w2;
    HA ha0(.x(x),.y(y),.Cout(w1),.Sum(wsum));
    HA ha1(.x(wsum),.y(Cin),.Cout(w2),.Sum(Sum));
    or or0(Cout,w1,w2);
endmodule
module HA(
    input x,y,
    output Cout,Sum
    );
    xor (Sum, x, y);
    and (Cout,x, y);
endmodule