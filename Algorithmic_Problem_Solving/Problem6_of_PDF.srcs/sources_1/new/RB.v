`timescale 1ns / 1ps
module RB(
    input clk,rst,WE,
    input [7:0]InA,InB,
    input [7:0]CUconst,ALUout,
    input [3:0]RegAdd,
    input [3:0]OutMuxAdd,
    input [2:0]InMuxAdd,
    output [7:0]Out,ALUinA,ALUinB
    );
    wire [15:0]dcode_out;
    wire [7:0]RegOut,RegIn;
    wire [7:0]RegMuxOut [15:0];  
    Decoder_4x16 dcoder(.RegAdd(RegAdd),.WE(WE),.Out(dcode_out));
    MUX8_8 mux8x8(.I0(InA), .I1(InB),.I2(CUconst),.I3(ALUout),.I4(RegOut),
           .I5(RegOut),.I6(RegOut), .I7(RegOut),.S(InMuxAdd), .O(RegIn));
    MUX16_8 mux16x8(.I0(RegMuxOut[0]), .I1(RegMuxOut[1]), .I2(RegMuxOut[2]),
            .I3(RegMuxOut[3]), .I4(RegMuxOut[4]), .I5(RegMuxOut[5]),
            .I6(RegMuxOut[6]), .I7(RegMuxOut[7]), .I8(RegMuxOut[8]), 
            .I9(RegMuxOut[9]), .I10(RegMuxOut[10]),.I11(RegMuxOut[11]),
            .I12(RegMuxOut[12]),.I13(RegMuxOut[13]),.I14(RegMuxOut[14]), 
            .I15(RegMuxOut[15]),.S(OutMuxAdd), .O(RegOut));
    
    genvar i;
    generate 
        for (i=0;i<16;i=i+1) begin    
            register regreg(.clk(clk),.rst(rst),
            .En(dcode_out[i]),.Rin(RegIn),.Rout(RegMuxOut[i]));
        end 
    endgenerate
    
    assign Out = RegMuxOut[0];
    assign ALUinA = RegMuxOut[1];
    assign ALUinB = RegMuxOut[2];
endmodule
