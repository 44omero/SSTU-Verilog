`timescale 1ns / 1ps

module Sequence_Detector(
    input clk,x,
    output reg z
    );
    reg [4:0]state = 4'b0000;
    parameter IDLE   = 4'b0000,
              I      = 4'b0001,
              IO     = 4'b0010,
              IOI    = 4'b0011,
              IOII   = 4'b0100,
              IOIIO  = 4'b0101,
              IOIIOI = 4'b0110,
              IOO    = 4'b0111,
              IOOI   = 4'b1000,
              IOOIO  = 4'b1001,
              IOOIOO = 4'b1010;
              
    always @(posedge clk)begin
        case(state)
            IDLE : begin
                if(x) begin
                    state <= I;
                    z     <= 0;
                end
                else begin
                    state <= IDLE;
                    z     <= 0;
                end
            end
            I : begin
                if(x) begin
                    state <= I;
                    z     <= 0;
                end
                else begin
                    state <= IO;
                    z     <= 0;
                end
            end
            IO : begin
                if(x) begin
                    state <= IOI;
                    z     <= 0;
                end
                else begin
                    state <= IOO;
                    z     <= 0;
                end
            end
            IOI : begin
                if(x) begin
                    state <= IOII;
                    z     <= 0;
                end
                else begin
                    state <= IO;
                    z     <= 0;
                end
            end
            IOII : begin
                if(x) begin
                    state <= I;
                    z     <= 0;
                end
                else begin
                    state <= IOIIO;
                    z     <= 0;
                end
            end
            IOIIO : begin
                if(x) begin
                    state <= I;
                    z     <= 1;
                end
                else begin
                    state <= IOO;
                    z     <= 0;
                end
            end
            //no need because same as "I" state
//            IOIIOI : begin
//                if(x) begin
//                    state <= I;
//                    z     <= 0;
//                end
//                else begin
//                    state <= IO;
//                    z     <= 0;
//                end
//            end
            IOO : begin
                if(x) begin
                    state <= IOOI;
                    z     <= 0;
                end
                else begin
                    state <= IDLE;
                    z     <= 0;
                end
            end
            IOOI : begin
                if(x) begin
                    state <= I;
                    z     <= 0;
                end
                else begin
                    state <= IOOIO;
                    z     <= 0;
                end
            end
            IOOIO : begin
                if(x) begin
                    state <= IOI;
                    z     <= 0;
                end
                else begin
                    state <= IDLE;
                    z     <= 1;
                end
            end
            //no need because same as "IDLE" state
//            IOOIOO : begin
//                if(x) begin
//                    state <= I;
//                    z     <= 0;
//                end
//                else begin
//                    state <= IDLE;
//                    z     <= 0;
//                end
//            end
        endcase
    end
endmodule