`timescale 1ns / 1ps
(* DONT_TOUCH = "TRUE" *)
module CSA3(
    input  [15:0] inA,inB,
    output [15:0] C,
    output cout,overflow
    );
    wire [15:0]outC;
    //Conditional Cells
    wire c0_0;
    CC cc0 (.inX(inA[0]) , .inY(inB[0]) , .s0(outC[0]), .c0(c0_0)); //no outputs with 1 because there is no carry on first step
    wire s0_1,c0_1,s1_1,c1_1;
    CC cc1 (.inX(inA[1]) , .inY(inB[1]) , .s0(s0_1), .c0(c0_1), .s1(s1_1), .c1(c1_1));
    wire s0_2,c0_2,s1_2,c1_2;
    CC cc2 (.inX(inA[2]) , .inY(inB[2]) , .s0(s0_2), .c0(c0_2), .s1(s1_2), .c1(c1_2));
    wire s0_3,c0_3,s1_3,c1_3;
    CC cc3 (.inX(inA[3]) , .inY(inB[3]) , .s0(s0_3), .c0(c0_3), .s1(s1_3), .c1(c1_3));
    wire s0_4,c0_4,s1_4,c1_4;
    CC cc4 (.inX(inA[4]) , .inY(inB[4]) , .s0(s0_4), .c0(c0_4), .s1(s1_4), .c1(c1_4));
    wire s0_5,c0_5,s1_5,c1_5;
    CC cc5 (.inX(inA[5]) , .inY(inB[5]) , .s0(s0_5), .c0(c0_5), .s1(s1_5), .c1(c1_5));
    wire s0_6,c0_6,s1_6,c1_6;
    CC cc6 (.inX(inA[6]) , .inY(inB[6]) , .s0(s0_6), .c0(c0_6), .s1(s1_6), .c1(c1_6));
    wire s0_7,c0_7,s1_7,c1_7;
    CC cc7 (.inX(inA[7]) , .inY(inB[7]) , .s0(s0_7), .c0(c0_7), .s1(s1_7), .c1(c1_7));
    wire s0_8,c0_8,s1_8,c1_8;
    CC cc8 (.inX(inA[8]) , .inY(inB[8]) , .s0(s0_8), .c0(c0_8), .s1(s1_8), .c1(c1_8));
    wire s0_9,c0_9,s1_9,c1_9;
    CC cc9 (.inX(inA[9]) , .inY(inB[9]) , .s0(s0_9), .c0(c0_9), .s1(s1_9), .c1(c1_9));
    wire s0_10,c0_10,s1_10,c1_10;
    CC cc10(.inX(inA[10]), .inY(inB[10]), .s0(s0_10), .c0(c0_10), .s1(s1_10), .c1(c1_10));
    wire s0_11,c0_11,s1_11,c1_11;
    CC cc11(.inX(inA[11]), .inY(inB[11]), .s0(s0_11), .c0(c0_11), .s1(s1_11), .c1(c1_11));
    wire s0_12,c0_12,s1_12,c1_12;
    CC cc12(.inX(inA[12]), .inY(inB[12]), .s0(s0_12), .c0(c0_12), .s1(s1_12), .c1(c1_12));
    wire s0_13,c0_13,s1_13,c1_13;
    CC cc13(.inX(inA[13]), .inY(inB[13]), .s0(s0_13), .c0(c0_13), .s1(s1_13), .c1(c1_13));
    wire s0_14,c0_14,s1_14,c1_14;
    CC cc14(.inX(inA[14]), .inY(inB[14]), .s0(s0_14), .c0(c0_14), .s1(s1_14), .c1(c1_14));
    wire s0_15,c0_15,s1_15,c1_15;
    CC cc15(.inX(inA[15]), .inY(inB[15]), .s0(s0_15), .c0(c0_15), .s1(s1_15), .c1(c1_15));
    //main carrys
    wire C1,C3,C7,C15;
    
    MUX2_1bit mux0(.I0(s0_1),.I1(s1_1),.S(c0_0),.O(outC[1]));
    MUX2_1bit mux1(.I0(c0_1),.I1(c1_1),.S(c0_0),.O(C1));
    //
    //end of 2-bit
    //
    wire wtemps03,wtempc03;
    MUX2_1bit mux2(.I0(s0_3),.I1(s1_3),.S(c0_2),.O(wtemps03));
    MUX2_1bit mux3(.I0(c0_3),.I1(c1_3),.S(c0_2),.O(wtempc03));
    wire wtemps13,wtempc13;
    MUX2_1bit mux4(.I0(s0_3),.I1(s1_3),.S(c1_2),.O(wtemps13));
    MUX2_1bit mux5(.I0(c0_3),.I1(c1_3),.S(c1_2),.O(wtempc13));
    //
    MUX2_1bit mux6(.I0(s0_2),.I1(s1_2),.S(C1),.O(outC[2]));
    MUX2_1bit mux7(.I0(s0_3),.I1(s1_3),.S(C1),.O(outC[3]));
    MUX2_1bit mux8(.I0(c0_3),.I1(c1_3),.S(C1),.O(C3));
    //
    //end of 4-bit
    //
    wire wtemps05,wtempc05;
    MUX2_1bit mux9(.I0(s0_5),.I1(s1_5),.S(c0_4),.O(wtemps05));
    MUX2_1bit mux10(.I0(c0_5),.I1(c1_5),.S(c0_4),.O(wtempc05));
    wire wtemps15,wtempc15;
    MUX2_1bit mux11(.I0(s0_5),.I1(s1_5),.S(c1_4),.O(wtemps15));
    MUX2_1bit mux12(.I0(c0_5),.I1(c1_5),.S(c1_4),.O(wtempc15));
    //
    wire wtemps07,wtempc07;
    MUX2_1bit mux13(.I0(s0_7),.I1(s1_7),.S(c0_6),.O(wtemps07));
    MUX2_1bit mux14(.I0(c0_7),.I1(c1_7),.S(c0_6),.O(wtempc07));
    wire wtemps17,wtempc17;
    MUX2_1bit mux15(.I0(s0_7),.I1(s1_7),.S(c1_6),.O(wtemps17));
    MUX2_1bit mux16(.I0(c0_7),.I1(c1_7),.S(c1_6),.O(wtempc17));
    //
    wire wtemps06,wtemps07_1,wtempc07_1;
    MUX2_1bit mux17(.I0(s0_6),.I1(s1_6),.S(wtempc05),.O(wtemps06));
    MUX2_1bit mux18(.I0(wtemps07),.I1(wtemps17),.S(wtempc05),.O(wtemps07_1));
    MUX2_1bit mux19(.I0(wtempc07),.I1(wtempc17),.S(wtempc05),.O(wtempc07_1));
    wire wtemps16,wtemps17_1,wtempc17_1;
    MUX2_1bit mux20(.I0(s0_6),.I1(s1_6),.S(wtempc15),.O(wtemps16));
    MUX2_1bit mux21(.I0(wtemps07),.I1(wtemps17),.S(wtempc15),.O(wtemps17_1));
    MUX2_1bit mux22(.I0(wtempc07),.I1(wtempc17),.S(wtempc15),.O(wtempc17_1));
    //
    MUX2_1bit mux23(.I0(s0_4),.I1(s1_4),.S(C3),.O(outC[4]));
    MUX2_1bit mux24(.I0(wtemps05),.I1(wtemps15),.S(C3),.O(outC[5]));
    MUX2_1bit mux25(.I0(wtemps06),.I1(wtemps16),.S(C3),.O(outC[6]));
    MUX2_1bit mux26(.I0(wtemps07_1),.I1(wtemps17_1),.S(C3),.O(outC[7]));
    MUX2_1bit mux27(.I0(wtempc07_1),.I1(wtempc17_1),.S(C3),.O(C7));
    //
    // end of 8-bit
    //
    wire wtemps09,wtempc09;
    MUX2_1bit mux28(.I0(s0_9),.I1(s1_9),.S(c0_8),.O(wtemps09));
    MUX2_1bit mux29(.I0(c0_9),.I1(c1_9),.S(c0_8),.O(wtempc09));
    wire wtemps19,wtempc19;
    MUX2_1bit mux30(.I0(s0_9),.I1(s1_9),.S(c1_8),.O(wtemps19));
    MUX2_1bit mux31(.I0(c0_9),.I1(c1_9),.S(c1_8),.O(wtempc19));
    //
    wire wtemps011,wtempc011;
    MUX2_1bit mux32(.I0(s0_11),.I1(s1_11),.S(c0_10),.O(wtemps011));
    MUX2_1bit mux33(.I0(c0_11),.I1(c1_11),.S(c0_10),.O(wtempc011));
    wire wtemps111,wtempc111;
    MUX2_1bit mux34(.I0(s0_11),.I1(s1_11),.S(c1_10),.O(wtemps111));
    MUX2_1bit mux35(.I0(c0_11),.I1(c1_11),.S(c1_10),.O(wtempc111));
    //
    wire wtemps010,wtemps011_1,wtempc011_1;
    MUX2_1bit mux36(.I0(s0_10),.I1(s1_10),.S(wtempc09),.O(wtemps010));
    MUX2_1bit mux37(.I0(wtemps011),.I1(wtemps111),.S(wtempc09),.O(wtemps011_1));
    MUX2_1bit mux38(.I0(wtempc011),.I1(wtempc111),.S(wtempc09),.O(wtempc011_1));
    wire wtemps110,wtemps111_1,wtempc111_1;
    MUX2_1bit mux39(.I0(s0_10),.I1(s1_10),.S(wtempc19),.O(wtemps110));
    MUX2_1bit mux40(.I0(wtemps011),.I1(wtemps111),.S(wtempc19),.O(wtemps111_1));
    MUX2_1bit mux41(.I0(wtempc011),.I1(wtempc111),.S(wtempc19),.O(wtempc111_1));
    //
    //
    wire wtemps013,wtempc013;
    MUX2_1bit mux42(.I0(s0_13),.I1(s1_13),.S(c0_12),.O(wtemps013));
    MUX2_1bit mux43(.I0(c0_13),.I1(c1_13),.S(c0_12),.O(wtempc013));
    wire wtemps113,wtempc113;
    MUX2_1bit mux44(.I0(s0_13),.I1(s1_13),.S(c1_12),.O(wtemps113));
    MUX2_1bit mux45(.I0(c0_13),.I1(c1_13),.S(c1_12),.O(wtempc113));
    //
    wire wtemps015,wtempc015;
    MUX2_1bit mux46(.I0(s0_15),.I1(s1_15),.S(c0_14),.O(wtemps015));
    MUX2_1bit mux47(.I0(c0_15),.I1(c1_15),.S(c0_14),.O(wtempc015));
    wire wtemps115,wtempc115;
    MUX2_1bit mux48(.I0(s0_15),.I1(s1_15),.S(c1_14),.O(wtemps115));
    MUX2_1bit mux49(.I0(c0_15),.I1(c1_15),.S(c1_14),.O(wtempc115));
    //
    wire wtemps014,wtemps015_1,wtempc015_1;
    MUX2_1bit mux50(.I0(s0_14),.I1(s1_14),.S(wtempc013),.O(wtemps014));
    MUX2_1bit mux51(.I0(wtemps015),.I1(wtemps115),.S(wtempc013),.O(wtemps015_1));
    MUX2_1bit mux52(.I0(wtempc015),.I1(wtempc115),.S(wtempc013),.O(wtempc015_1));
    wire wtemps114,wtemps115_1,wtempc115_1;
    MUX2_1bit mux53(.I0(s0_14),.I1(s1_14),.S(wtempc113),.O(wtemps114));
    MUX2_1bit mux54(.I0(wtemps015),.I1(wtemps115),.S(wtempc113),.O(wtemps115_1));
    MUX2_1bit mux55(.I0(wtempc015),.I1(wtempc115),.S(wtempc113),.O(wtempc115_1));
    //
    wire wtemps012,wtemps013_1,wtemps014_1,wtemps015_2,wtempc015_2;
    MUX2_1bit mux56(.I0(s0_12),.I1(s1_12),.S(wtempc011_1),.O(wtemps012));
    MUX2_1bit mux57(.I0(wtemps013),.I1(wtemps113),.S(wtempc011_1),.O(wtemps013_1));
    MUX2_1bit mux58(.I0(wtemps014),.I1(wtemps114),.S(wtempc011_1),.O(wtemps014_1));
    MUX2_1bit mux59(.I0(wtemps015_1),.I1(wtemps115_1),.S(wtempc011_1),.O(wtemps015_2));
    MUX2_1bit mux60(.I0(wtempc015_1),.I1(wtempc115_1),.S(wtempc011_1),.O(wtempc015_2));
    //
    wire wtemps112,wtemps113_1,wtemps114_1,wtemps115_2,wtempc115_2;
    MUX2_1bit mux61(.I0(s0_12),.I1(s1_12),.S(wtempc111_1),.O(wtemps112));
    MUX2_1bit mux62(.I0(wtemps013),.I1(wtemps113),.S(wtempc111_1),.O(wtemps113_1));
    MUX2_1bit mux63(.I0(wtemps014),.I1(wtemps114),.S(wtempc111_1),.O(wtemps114_1));
    MUX2_1bit mux64(.I0(wtemps015_1),.I1(wtemps115_1),.S(wtempc111_1),.O(wtemps115_2));
    MUX2_1bit mux65(.I0(wtempc015_1),.I1(wtempc115_1),.S(wtempc111_1),.O(wtempc115_2));
    //
    MUX2_1bit mux66(.I0(s0_8)       ,.I1(s1_8)       ,.S(C7),.O(outC[8]));
    MUX2_1bit mux67(.I0(wtemps09)   ,.I1(wtemps19)   ,.S(C7),.O(outC[9]));
    MUX2_1bit mux68(.I0(wtemps010)  ,.I1(wtemps110)  ,.S(C7),.O(outC[10]));
    MUX2_1bit mux69(.I0(wtemps011_1),.I1(wtemps111_1),.S(C7),.O(outC[11]));
    MUX2_1bit mux70(.I0(wtemps012)  ,.I1(wtemps112)  ,.S(C7),.O(outC[12]));
    MUX2_1bit mux71(.I0(wtemps013_1),.I1(wtemps113_1),.S(C7),.O(outC[13]));
    MUX2_1bit mux72(.I0(wtemps014_1),.I1(wtemps114_1),.S(C7),.O(outC[14]));
    MUX2_1bit mux73(.I0(wtemps015_2),.I1(wtemps115_2),.S(C7),.O(outC[15]));
    MUX2_1bit mux74(.I0(wtempc015_2),.I1(wtempc115_2),.S(C7),.O(C15));
    
    assign C = (inA[15]&&inB[15]) ? outC  : outC;
    
    assign cout = C15;
    assign overflow = c1_14 ^ c1_15;
    
endmodule