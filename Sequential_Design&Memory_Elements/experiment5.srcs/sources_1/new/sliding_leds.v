`timescale 1ns / 1ps

module sliding_leds#(
    parameter MAX_CNT_DEST = 500, // 100MHz / 10 = 10M
    parameter WIRE_SIZE = $clog2(MAX_CNT_DEST-1)
    )(
    input rst,clk,
    input [1:0]SW,
    output reg [15:0]LED
    );
    reg [WIRE_SIZE-1:0] divcounter = 0;
    reg cflag;
    always @(posedge clk or posedge rst)begin
        if(rst || LED == 16'h8000) begin 
            LED <= 16'h0001; 
           
        end
        else begin
            case(SW)
                //stop
                2'b00   : LED <= LED;
                //10Hz
                2'b01   : begin
                    if (divcounter % (MAX_CNT_DEST-1) == 0 && divcounter !=0)begin
                        LED <= LED<<1'b1;
                    end
                end
                //20Hz 
                2'b10   : begin
                    if (divcounter % ((MAX_CNT_DEST-1)/2) == 0 && divcounter !=0)begin
                        LED <= LED<<1'b1;
                    end
                end
                //50Hz 
                2'b11   : begin
                    if (divcounter % ((MAX_CNT_DEST-1)/5) == 0 && divcounter !=0)begin
                        LED <= LED<<1'b1;
                    end
                end
                default : LED <= LED;
            endcase
        end
    end
    always @(posedge clk or posedge rst)begin
        divcounter <=divcounter+1;
        if(rst)begin
            divcounter <=0;
            cflag <= 0;
        end
        else begin
            if (divcounter == MAX_CNT_DEST) begin 
                cflag <= 1;
            end
            else if (cflag == 1) begin
                cflag <= 0;
                divcounter <= 0;
            end
        end
    end
endmodule
