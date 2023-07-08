`timescale 1ns / 1ps

module MULTS(
    input [7:0]A,X,
    output [15:0] result
    );
    wire [15:0]PP[7:0];
    
    genvar step;
    generate
        for (step = 0; step <8; step=step+1)begin
            assign PP[step] = (X[step] * A) << step;
        end
    endgenerate
    
    wire [15:0]sum[6:0];
    wire [6:0]trashout;
    CLA16 cla0(.x(PP[0]),.y(PP[1]),.cin(1'b0),.s(sum[0]),.cout(trashout[0]));
    CLA16 cla1(.x(PP[2]),.y(PP[3]),.cin(1'b0),.s(sum[1]),.cout(trashout[1]));
    CLA16 cla2(.x(PP[4]),.y(PP[5]),.cin(1'b0),.s(sum[2]),.cout(trashout[2]));
    CLA16 cla3(.x(PP[6]),.y(PP[7]),.cin(1'b0),.s(sum[3]),.cout(trashout[3]));
    //
    CLA16 cla4(.x(sum[0]),.y(sum[1]),.cin(1'b0),.s(sum[4]),.cout(trashout[4]));
    CLA16 cla5(.x(sum[2]),.y(sum[3]),.cin(1'b0),.s(sum[5]),.cout(trashout[5]));
    //
    CLA16 cla6(.x(sum[4]),.y(sum[5]),.cin(1'b0),.s(sum[6]),.cout(trashout[6]));
    
    assign result = sum[6];
endmodule
