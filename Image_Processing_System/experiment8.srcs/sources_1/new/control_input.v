`timescale 1ns / 1ps

module control_input(
    input clk,rst,
    input conv_run,
    input [71:0]kernel,
    output reg ram_enable,
    output reg [7:0] ram_address,
    output reg [23:0] weight,
    output reg conv_rst   
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
            ram_enable <= 0;
            conv_rst <= 1;
        end
        else if (conv_run) begin
            case(count)
                0:begin
                    weight <= kernel[23:0];
                    ram_address <= ram_address + 1;
                    ram_enable <= 1;
                    conv_rst <= 0;
                end
                1:begin
                    weight <= kernel[47:24];
                    ram_address <= ram_address + 1;
                    ram_enable <= 1;
                    conv_rst <= 0;
                end
                2:begin
                    weight <= kernel[71:48];
                    ram_address <= ram_address + 1;
                    ram_enable <= 1;
                    conv_rst <= 0;
                end
                3:begin
                    ram_address <= ram_address - 2;
                    ram_enable <= 1;
                    conv_rst <= 1;
                end
            endcase
        end
    end
endmodule
