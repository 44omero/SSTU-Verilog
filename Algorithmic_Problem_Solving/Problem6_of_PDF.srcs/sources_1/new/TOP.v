`timescale 1ns / 1ps
//project: comparison of A and B/2
module TOP(
    input clk,rst,
    input [7:0]InA,InB,
    input start,
    output busy,
    output [7:0]Out
    );
//comparison of A and B/2
    wire wCO,wZ,wWE;
    wire [1:0]wInsSel;
    wire [2:0]wInMuxAdd;
    wire [3:0]wRegAdd,wOutMuxAdd;
    wire [7:0]wCUconst,wALUinA,wALUinB,wALUout;    
    CU control_unit(//signals
                    .clk(clk), .rst(rst), .start(start), .busy(busy),
                    //ALU
                    .InsSel(wInsSel), .CO(wCO), .Z(wZ),
                    //RB
                    .WE(wWE), .CUconst(wCUconst), .InMuxAdd(wInMuxAdd), .OutMuxAdd(wOutMuxAdd), .RegAdd(wRegAdd));
    ALU alu(//CU
            .InsSel(wInsSel), .CO(wCO), .Z(wZ),
            //RB
            .ALUinA(wALUinA), .ALUinB(wALUinB), .ALUout(wALUout));
    RB rb(//signals
          .clk(clk), .rst(rst),
          //inouts
          .InA(InA), .InB(InB), .Out(Out),
          //ALU
          .ALUinA(wALUinA), .ALUinB(wALUinB), .ALUout(wALUout),
          //CU
          .WE(wWE), .CUconst(wCUconst), .InMuxAdd(wInMuxAdd), .OutMuxAdd(wOutMuxAdd), .RegAdd(wRegAdd));
                       
endmodule
