`timescale 1ns / 1ps

module ALU(
    input [7:0]ALUinA, ALUinB,
    input [1:0]InsSel,
    output [7:0]ALUout,
    output CO, Z
    );
    wire [7:0] w_and,w_xor,w_add,w_cls;
    wire w_cout0;
    AND      aluAND  (.a(ALUinA),.b(ALUinB),.r(w_and));
    XOR      aluXOR  (.a(ALUinA),.b(ALUinB),.r(w_xor));
    ADD      aluADD  (.a(ALUinA),.b(ALUinB),.r(w_add),.cout(w_cout0));
    CLShift  aluCLS  (.a(ALUinA),.r(w_cls));
    MUX4_8   aluMUX0 (.I0(w_and),.I1(w_xor),.I2(w_add),.I3(w_cls),.S(InsSel),.O(ALUout));
    MUX4_1   aluMUX1 (.I0(1'b0),.I1(1'b0),.I2(w_cout0),.I3(w_cls[0]),.S(InsSel),.O(CO));
    ZeroComp aluZC   (.a(ALUout), .Z(Z));
endmodule
