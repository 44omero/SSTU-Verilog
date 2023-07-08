`timescale 1ns / 1ps

module Seq_Detector(
    input clk,rst,
    input X,
    output reg Y
    );
    reg [1:0]ninecount,sevencount;
    reg [3:0]register;
    // my last two digits are 9 so i choose 9 and 7
    // 1001 - 0111
    always @(posedge clk or posedge rst)begin
        if(rst)begin
            ninecount  <= 2'b0;
            sevencount <= 2'b0;
            register <= 4'b0;
            Y <= 0;
        end
        else begin
            register <= {register[2:0], X};
            if (ninecount != 2 && sevencount != 2)begin
                if (register == 4'b1001)begin
                    ninecount <= ninecount + 1;
                    Y <= 1;
                end
                else if (register == 4'b0111)begin
                    sevencount <= sevencount + 1;
                    Y <= 1;
                end
                else Y <= 0;
            end
            
        end
    end
endmodule
