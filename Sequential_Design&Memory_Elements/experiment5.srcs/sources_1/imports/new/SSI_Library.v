`timescale 1ns / 1ps

module AND(
    input I1, I2,
    output O
    );
    
    assign O = I1 & I2;
endmodule

module OR(
    input I1, I2,
    output O
    );
    
    assign O = I1 || I2;
endmodule

module NOT(
    input I,
    output O
    );
    
    assign O = !I;
endmodule

module NAND(
    input I1, I2,
    output reg O
    );
    
    always @(*) begin
        O = !(I1 && I2);
    end
endmodule

module NOR(
    input I1, I2,
    output reg O
    );
    
    always @(*) begin
        O = !(I1 || I2);
    end
endmodule

module EXOR(
    input I1, I2,
    output O
    );
    
    LUT2 #(
    .INIT ( 4'b0110 ) 
	) EXOR
	(
    .I0( I1 ),
    .I1( I2 ),
    .O ( O )
    );
endmodule

module EXNOR(
    input I1, I2,
    output O
    );
    
    LUT2 #(
    .INIT ( 4'b1001 ) 
	) EXNOR
	(
    .I0( I1 ),
    .I1( I2 ),
    .O ( O )
    );
endmodule

module TRI(
    input I, E,
    output O
    );
    
    assign O = E ? I : 1'bz;
    
endmodule