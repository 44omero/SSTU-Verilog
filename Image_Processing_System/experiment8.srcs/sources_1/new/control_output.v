`timescale 1ns / 1ps

module control_output(
    input clk,rst,
    input [1023:0]data,
    output reg conv_done,
    output reg [6:0] ram_address,
    output reg [1023:0] data_out    
    );
    reg [1:0]count;
    //counter
    always @(posedge clk or posedge rst)begin
        if(rst)begin
            count <= 0;
        end
        else begin
            if(count < 3)begin
                count <= count + 1;
            end
            else count <= 0;
        end
    end
    //
    always @(posedge clk or posedge rst)begin
        if(rst)begin
            ram_address <= 8'h00;
            data_out <= 0;
            conv_done <= 0;
        end
        else if (count == 3) begin
            data_out <= data;
            ram_address <= ram_address + 1;
            if(ram_address == 127)begin
                conv_done <= 1;
            end
        end
    end
endmodule
