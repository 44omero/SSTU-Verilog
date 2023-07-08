`timescale 1ns / 1ps

module MULTS_signed(
    input [7:0]A,X,
    output [15:0] result
    );
    wire [7:0]PP[7:0];
    
    genvar step_0;
    generate
        for (step_0 = 0; step_0 <8; step_0=step_0+1)begin
            assign PP[step_0] = (X[step_0] * A);
        end
    endgenerate
    wire [7:0]PP_BW[7:0];
    
    genvar step_1, step_2;
    generate
        for (step_1 = 0; step_1 <8; step_1=step_1+1)begin
            for (step_2 = 0; step_2 <8; step_2=step_2+1)begin
                 if(step_1 != 7)begin
                    if(step_2 != 7)begin
                        assign PP_BW[step_1][step_2] = PP[step_1][step_2];
                    end
                    else assign PP_BW[step_1][step_2] = ~PP[step_1][step_2];
                 end
                 else begin
                     if(step_2 == 7) 
                        assign PP_BW[step_1][step_2] = PP[step_1][step_2];
                     else
                        assign PP_BW[step_1][step_2] = ~PP[step_1][step_2];
                 end
            end
        end
    endgenerate
    wire [15:0]PP_shifted[7:0];
    genvar step_shift;
    generate
        for(step_shift = 0; step_shift < 8; step_shift = step_shift + 1) begin
            assign PP_shifted[step_shift] = PP_BW[step_shift] << step_shift;
        end
    endgenerate
    
    wire [15:0]sum[7:0];
    wire [7:0]trashout;
    CLA16 cla0(.x(PP_shifted[0]),.y(PP_shifted[1]),.cin(1'b0),.s(sum[0]),.cout(trashout[0]));
    CLA16 cla1(.x(PP_shifted[2]),.y(PP_shifted[3]),.cin(1'b0),.s(sum[1]),.cout(trashout[1]));
    CLA16 cla2(.x(PP_shifted[4]),.y(PP_shifted[5]),.cin(1'b0),.s(sum[2]),.cout(trashout[2]));
    CLA16 cla3(.x(PP_shifted[6]),.y(PP_shifted[7]),.cin(1'b0),.s(sum[3]),.cout(trashout[3]));
    //
    CLA16 cla4(.x(sum[0]),.y(sum[1]),.cin(1'b0),.s(sum[4]),.cout(trashout[4]));
    CLA16 cla5(.x(sum[2]),.y(sum[3]),.cin(1'b0),.s(sum[5]),.cout(trashout[5]));
    //
    CLA16 cla6(.x(sum[4]),.y(sum[5]),.cin(1'b0),.s(sum[6]),.cout(trashout[6]));
    //
    CLA16 cla7(.x(sum[6]),.y(16'h8100),.cin(1'b0),.s(sum[7]),.cout(trashout[7]));
    assign result = sum[7];
endmodule
