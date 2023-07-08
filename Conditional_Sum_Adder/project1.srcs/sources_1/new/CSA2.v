`timescale 1ns / 1ps
(* DONT_TOUCH = "TRUE" *)
module CSA2(
    input [31:0]inA,
    input [31:0]inB,
    input Cin,
    output [31:0]out,
    output reg overflow, cout
    );
    //bit0
    wire c0,s0;
    FA fa0cin(.inX(inA[0]), .inY(inB[0]), .Cin(Cin), .Cout(c0), .sum(s0));
    assign out[0] = s0;
    //bit1
    wire [1:0]c1,s1;
    FA fa1c0(.inX(inA[1]), .inY(inB[1]), .Cin(1'b0), .Cout(c1[0]), .sum(s1[0]));
    FA fa1c1(.inX(inA[1]), .inY(inB[1]), .Cin(1'b1), .Cout(c1[1]), .sum(s1[1]));
    //
    wire wmuxsum0,wmuxmaincarry0;
    MUX2_1bit mux1_00(.I1(s1[1]),.I0(s1[0]),.S(c0),.O(wmuxsum0));
    MUX2_1bit mux1_01(.I1(c1[1]),.I0(c1[0]),.S(c0),.O(wmuxmaincarry0));
    wire [1:0]sumchannel2bit;
    assign out[1] = wmuxsum0;
    //
    //bit2
    wire [1:0]c2,s2;
    FA fa2c0(.inX(inA[2]), .inY(inB[2]), .Cin(1'b0), .Cout(c2[0]), .sum(s2[0]));
    FA fa2c1(.inX(inA[2]), .inY(inB[2]), .Cin(1'b1), .Cout(c2[1]), .sum(s2[1]));
    //bit3
    wire [1:0]c3,s3;
    FA fa3c0(.inX(inA[3]), .inY(inB[3]), .Cin(1'b0), .Cout(c3[0]), .sum(s3[0]));
    FA fa3c1(.inX(inA[3]), .inY(inB[3]), .Cin(1'b1), .Cout(c3[1]), .sum(s3[1]));
    //
    wire wmuxsum0_1,wmuxcarry0_1;
    MUX2_1bit mux1_10(.I1(s3[1]),.I0(s3[0]),.S(c2[0]),.O(wmuxsum0_1));
    MUX2_1bit mux1_11(.I1(c3[1]),.I0(c3[0]),.S(c2[0]),.O(wmuxcarry0_1));
    wire wmuxsum1_2,wmuxcarry1_2;
    MUX2_1bit mux1_20(.I1(s3[1]),.I0(s3[0]),.S(c2[1]),.O(wmuxsum1_2));
    MUX2_1bit mux1_21(.I1(c3[1]),.I0(c3[0]),.S(c2[1]),.O(wmuxcarry1_2));
    wire [1:0]concsum23_0,concsum23_1;
    assign concsum23_0 = {wmuxsum0_1,s2[0]};
    assign concsum23_1 = {wmuxsum1_2,s2[1]};
    //
    wire [1:0]wmuxconcsumA;
    wire wmuxmaincarry1;
    MUX2_2bit mux2_30(.I1(concsum23_1),.I0(concsum23_0),.S(wmuxmaincarry0),.O(wmuxconcsumA));
    MUX2_1bit mux1_31(.I1(wmuxcarry0_1),.I0(wmuxcarry1_2),.S(wmuxmaincarry0),.O(wmuxmaincarry1));
    wire [3:0]sumchannel4bit;
    assign sumchannel4bit= {wmuxconcsumA,sumchannel2bit};
    // 4bit csa
    
    //bit4
    wire [1:0]c4,s4;
    FA fa4c0(.inX(inA[4]), .inY(inB[4]), .Cin(1'b0), .Cout(c4[0]), .sum(s4[0]));
    FA fa4c1(.inX(inA[4]), .inY(inB[4]), .Cin(1'b1), .Cout(c4[1]), .sum(s4[1]));
    //bit5
    wire [1:0]c5,s5;
    FA fa5c0(.inX(inA[5]), .inY(inB[5]), .Cin(1'b0), .Cout(c5[0]), .sum(s5[0]));
    FA fa5c1(.inX(inA[5]), .inY(inB[5]), .Cin(1'b1), .Cout(c5[1]), .sum(s5[1]));
    //
    wire wmuxsum3_1,wmuxcarry3_1;
    MUX2_1bit mux1_40(.I1(s5[1]),.I0(s5[0]),.S(c4[0]),.O(wmuxsum3_1));
    MUX2_1bit mux1_41(.I1(c5[1]),.I0(c5[0]),.S(c4[0]),.O(wmuxcarry3_1));
    wire wmuxsum4_2,wmuxcarry4_2;
    MUX2_1bit mux1_50(.I1(s5[1]),.I0(s5[0]),.S(c4[1]),.O(wmuxsum4_2));
    MUX2_1bit mux1_51(.I1(c5[1]),.I0(c5[0]),.S(c4[1]),.O(wmuxcarry4_2));
    
    //bit6
    wire [1:0]c6,s6;
    FA fa6c0(.inX(inA[6]), .inY(inB[6]), .Cin(1'b0), .Cout(c6[0]), .sum(s6[0]));
    FA fa6c1(.inX(inA[6]), .inY(inB[6]), .Cin(1'b1), .Cout(c6[1]), .sum(s6[1]));
    //bit7
    wire [1:0]c7,s7;
    FA fa7c0(.inX(inA[7]), .inY(inB[7]), .Cin(1'b0), .Cout(c7[0]), .sum(s7[0]));
    FA fa7c1(.inX(inA[7]), .inY(inB[7]), .Cin(1'b1), .Cout(c7[1]), .sum(s7[1]));
    //bit8
    wire [1:0]c8,s8;
    FA fa8c0(.inX(inA[8]), .inY(inB[8]), .Cin(1'b0), .Cout(c8[0]), .sum(s8[0]));
    FA fa8c1(.inX(inA[8]), .inY(inB[8]), .Cin(1'b1), .Cout(c8[1]), .sum(s8[1]));
    //bit9                                                              
    wire [1:0]c9,s9;                                                    
    FA fa9c0(.inX(inA[9]), .inY(inB[9]), .Cin(1'b0), .Cout(c9[0]), .sum(s9[0]));
    FA fa9c1(.inX(inA[9]), .inY(inB[9]), .Cin(1'b1), .Cout(c9[1]), .sum(s9[1]));
    //bit10
    wire [1:0]c10,s10;
    FA fa10c0(.inX(inA[10]), .inY(inB[10]), .Cin(1'b0), .Cout(c10[0]), .sum(s10[0]));
    FA fa10c1(.inX(inA[10]), .inY(inB[10]), .Cin(1'b1), .Cout(c10[1]), .sum(s10[1]));
    //bit11
    wire [1:0]c11,s11;
    FA fa11c0(.inX(inA[11]), .inY(inB[11]), .Cin(1'b0), .Cout(c11[0]), .sum(s11[0]));
    FA fa11c1(.inX(inA[11]), .inY(inB[11]), .Cin(1'b1), .Cout(c11[1]), .sum(s11[1]));
    //bit12
    wire [1:0]c12,s12;
    FA fa12c0(.inX(inA[12]), .inY(inB[12]), .Cin(1'b0), .Cout(c12[0]), .sum(s12[0]));
    FA fa12c1(.inX(inA[12]), .inY(inB[12]), .Cin(1'b1), .Cout(c12[1]), .sum(s12[1]));
    //bit13
    wire [1:0]c13,s13;
    FA fa13c0(.inX(inA[13]), .inY(inB[13]), .Cin(1'b0), .Cout(c13[0]), .sum(s13[0]));
    FA fa13c1(.inX(inA[13]), .inY(inB[13]), .Cin(1'b1), .Cout(c13[1]), .sum(s13[1]));
    //bit14
    wire [1:0]c14,s14;
    FA fa14c0(.inX(inA[14]), .inY(inB[14]), .Cin(1'b0), .Cout(c14[0]), .sum(s14[0]));
    FA fa14c1(.inX(inA[14]), .inY(inB[14]), .Cin(1'b1), .Cout(c14[1]), .sum(s14[1]));
    //bit15
    wire [1:0]c15,s15;
    FA fa15c0(.inX(inA[15]), .inY(inB[15]), .Cin(1'b0), .Cout(c15[0]), .sum(s15[0]));
    FA fa15c1(.inX(inA[15]), .inY(inB[15]), .Cin(1'b1), .Cout(c15[1]), .sum(s15[1]));
    //bit16
    wire [1:0]c16,s16;
    FA fa16c0(.inX(inA[16]), .inY(inB[16]), .Cin(1'b0), .Cout(c16[0]), .sum(s16[0]));
    FA fa16c1(.inX(inA[16]), .inY(inB[16]), .Cin(1'b1), .Cout(c16[1]), .sum(s16[1]));
    //bit17
    wire [1:0]c17,s17;
    FA fa17c0(.inX(inA[17]), .inY(inB[17]), .Cin(1'b0), .Cout(c17[0]), .sum(s17[0]));
    FA fa17c1(.inX(inA[17]), .inY(inB[17]), .Cin(1'b1), .Cout(c17[1]), .sum(s17[1]));
    //bit18
    wire [1:0]c18,s18;
    FA fa18c0(.inX(inA[18]), .inY(inB[18]), .Cin(1'b0), .Cout(c18[0]), .sum(s18[0]));
    FA fa18c1(.inX(inA[18]), .inY(inB[18]), .Cin(1'b1), .Cout(c18[1]), .sum(s18[1]));
    //bit19
    wire [1:0]c19,s19;
    FA fa19c0(.inX(inA[19]), .inY(inB[19]), .Cin(1'b0), .Cout(c19[0]), .sum(s19[0]));
    FA fa19c1(.inX(inA[19]), .inY(inB[19]), .Cin(1'b1), .Cout(c19[1]), .sum(s19[1]));
    //bit20
    wire [1:0]c20,s20;
    FA fa20c0(.inX(inA[20]), .inY(inB[20]), .Cin(1'b0), .Cout(c20[0]), .sum(s20[0]));
    FA fa20c1(.inX(inA[20]), .inY(inB[20]), .Cin(1'b1), .Cout(c20[1]), .sum(s20[1]));
    //bit21
    wire [1:0]c21,s21;
    FA fa21c0(.inX(inA[21]), .inY(inB[21]), .Cin(1'b0), .Cout(c21[0]), .sum(s21[0]));
    FA fa21c1(.inX(inA[21]), .inY(inB[21]), .Cin(1'b1), .Cout(c21[1]), .sum(s21[1]));
    //bit22
    wire [1:0]c22,s22;
    FA fa22c0(.inX(inA[22]), .inY(inB[22]), .Cin(1'b0), .Cout(c22[0]), .sum(s22[0]));
    FA fa22c1(.inX(inA[22]), .inY(inB[22]), .Cin(1'b1), .Cout(c22[1]), .sum(s22[1]));
    //bit23
    wire [1:0]c23,s23;
    FA fa23c0(.inX(inA[23]), .inY(inB[23]), .Cin(1'b0), .Cout(c23[0]), .sum(s23[0]));
    FA fa23c1(.inX(inA[23]), .inY(inB[23]), .Cin(1'b1), .Cout(c23[1]), .sum(s23[1]));
    //bit24
    wire [1:0]c24,s24;
    FA fa24c0(.inX(inA[24]), .inY(inB[24]), .Cin(1'b0), .Cout(c24[0]), .sum(s24[0]));
    FA fa24c1(.inX(inA[24]), .inY(inB[24]), .Cin(1'b1), .Cout(c24[1]), .sum(s24[1]));
    //bit25
    wire [1:0]c25,s25;
    FA fa25c0(.inX(inA[25]), .inY(inB[25]), .Cin(1'b0), .Cout(c25[0]), .sum(s25[0]));
    FA fa25c1(.inX(inA[25]), .inY(inB[25]), .Cin(1'b1), .Cout(c25[1]), .sum(s25[1]));
    //bit26
    wire [1:0]c26,s26;
    FA fa26c0(.inX(inA[26]), .inY(inB[26]), .Cin(1'b0), .Cout(c26[0]), .sum(s26[0]));
    FA fa26c1(.inX(inA[26]), .inY(inB[26]), .Cin(1'b1), .Cout(c26[1]), .sum(s26[1]));
    //bit27
    wire [1:0]c27,s27;
    FA fa27c0(.inX(inA[27]), .inY(inB[27]), .Cin(1'b0), .Cout(c27[0]), .sum(s27[0]));
    FA fa27c1(.inX(inA[27]), .inY(inB[27]), .Cin(1'b1), .Cout(c27[1]), .sum(s27[1]));
    //bit28
    wire [1:0]c28,s28;
    FA fa28c0(.inX(inA[28]), .inY(inB[28]), .Cin(1'b0), .Cout(c28[0]), .sum(s28[0]));
    FA fa28c1(.inX(inA[28]), .inY(inB[28]), .Cin(1'b1), .Cout(c28[1]), .sum(s28[1]));
    //bit29
    wire [1:0]c29,s29;
    FA fa29c0(.inX(inA[29]), .inY(inB[29]), .Cin(1'b0), .Cout(c29[0]), .sum(s29[0]));
    FA fa29c1(.inX(inA[29]), .inY(inB[29]), .Cin(1'b1), .Cout(c29[1]), .sum(s29[1]));
    //bit30
    wire [1:0]c30,s30;
    FA fa30c0(.inX(inA[30]), .inY(inB[30]), .Cin(1'b0), .Cout(c30[0]), .sum(s30[0]));
    FA fa30c1(.inX(inA[30]), .inY(inB[30]), .Cin(1'b1), .Cout(c30[1]), .sum(s30[1]));
    //bit31
    wire [1:0]c31,s31;
    FA fa31c0(.inX(inA[31]), .inY(inB[31]), .Cin(1'b0), .Cout(c31[0]), .sum(s31[0]));
    FA fa31c1(.inX(inA[31]), .inY(inB[31]), .Cin(1'b1), .Cout(c31[1]), .sum(s31[1]));
    //
    
    //
    
endmodule
