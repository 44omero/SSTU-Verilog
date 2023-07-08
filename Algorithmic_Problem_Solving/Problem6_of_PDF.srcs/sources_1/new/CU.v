`timescale 1ns / 1ps

module CU(
    input clk,rst,
    input start,
    input CO,Z,
    output reg busy,WE,
    output reg [1:0] InsSel,
    output reg [2:0] InMuxAdd,
    output reg [3:0] OutMuxAdd,RegAdd,
    output reg [7:0] CUconst
    );
    reg [7:0]state;
    always @(posedge clk)begin
        if(rst==1) state <= 0;
    
        case(state)
            0:begin
                CUconst <=0;
                busy <= 1'b0;
                if(start)state<=8'd1;
            end
            1:begin
                busy <= 1'b1;
                state <= 8'd2;
            end
            2:begin //take B
                InMuxAdd <= 3'd1; //we take B
                WE<=1'b1; //enable decoder
                RegAdd<= 4'd1;//B to register1 for LCShift
                InsSel <= 2'b11; //LCS
                state <= 8'd3;
            end
            3,4,5,6,7,8,9:begin
                InMuxAdd <= 3'd3;
                WE<=1'b1; //enable decoder
                RegAdd<= 4'd1;//B to register1 for LCShift
                InsSel <= 2'b11; //LCS
                state <= state + 1'b1;
            end
            10:begin
                InMuxAdd <= 3'd3;//we took one bit right shifted B
                WE<=1'b1; //enable decoder
                RegAdd<= 4'd1; // B to reg1
                WE<=1'b0; //disable decoder
                
                state <= 8'd11;
            end
            11:begin
                CUconst <= 8'b0111_1111; //constant for making MSB of B zero
                InMuxAdd <= 3'd2;//we took const
                RegAdd <= 4'd2; // const to reg2
                WE <= 1'b1; // enable decoder
                InsSel <= 2'b00; //choose AND 
                state <= 8'd12; 
                //ALUout is B/2
            end
            12:begin
                InMuxAdd <= 3'd3; //choose B/2
                WE <=1; //enable decoder
                RegAdd <=4'd1; // B/2 to reg1
                WE <= 0;//disable
                state <= 8'd13;
            end
            
            13:begin
                CUconst <= 8'b1111_1111; //constant to take 1's complement
                InMuxAdd <= 3'd2;//we took const
                RegAdd <= 4'd2; // const to reg2
                WE <= 1'b1; // enable decoder
                InsSel <= 2'b01; //choose XOR
                state <= 8'd14; 
                //ALUout is 1's complement of B/2
            end
            14:begin
                InMuxAdd <= 3'd3; //choose compB/2
                WE <=1; //enable decoder
                RegAdd <=4'd1; // compB/2 to reg1
                WE <= 0;//disable
                state <= 8'd15;
            end
            15:begin
                CUconst <= 8'b0000_0001; //constant to take 2's complement
                InMuxAdd <= 3'd2;//we took const
                RegAdd <= 4'd2; // const to reg2
                WE <= 1'b1; // enable decoder
                InsSel <= 2'b10; //choose ADD
                state <= 8'd16; 
                //ALUout is 2's complement of B/2
            end
            16:begin
                InMuxAdd <= 3'd3; //we took ALUout
                WE <= 1'b1; // enable decoder
                RegAdd <= 4'd2; // -B/2 to reg2
                WE<= 1'b0; //disable decoder
                state <= 8'd17;
            end
            17:begin
                InMuxAdd <= 3'd0; //we took A
                RegAdd <= 4'd1; // A to reg1
                WE <= 1'b1; // enable decoder
                InsSel <= 2'b10; // selecet ADD
                state <= 8'd18;
            end
            18:begin
                if(Z==1) CUconst<= 8'd1; // if addition equals to zero CUconst = 1
                else if(Z==0&&CO==0) CUconst <= 8'd2; //if addition not equal to zero and no carry CUconst = 2
                else if (Z==0 &&CO==1) CUconst <= 8'd0;//if addition not equal to zero and carry = 1 CUconst = 0
                state <=8'd19;
            end
            19:begin
                InMuxAdd <= 3'd2; //select CUconst
                WE <= 1'b1; //enable decoder
                RegAdd<=4'd0; // add to register 0
                state <= 19;
            end
        endcase
    end
endmodule
