`timescale 1ns / 1ps

module MAC_normalize(
    input signed [19:0] data,
    output reg [7:0] result
    );
    always @ (*) begin
        if(data < 0)begin
            result = 0;
        end
        else if(data > 255)begin
            result = 255;
        end
        else result = data;
    end
endmodule
