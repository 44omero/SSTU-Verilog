`timescale 1ns / 1ps

module TOP(
    input clk,rst,
    input conv_run,
    input [71:0] kernel,
    output conv_done,
    output [1023:0]out
    );
    wire wram_enable,wconv_rst;
    wire [7:0]wram_address;
    wire [6:0]wram_address2;
    wire [23:0]weight;
    wire [1039:0]wbram1_out;
    wire [1023:0]wresult;
    wire [1023:0]wdata_out;
    control_input cont_in(.clk(clk), .rst(rst), .conv_run(conv_run), .kernel(kernel), .conv_rst(wconv_rst),
                          .ram_enable(wram_enable), .ram_address(wram_address), .weight(weight));
    BRAM1 bram_in(clk, wram_enable, 1'b0, wram_address, 1040'b0, wbram1_out);
    CONV128 conv128(.clk(clk), .rst(wconv_rst), .data(wbram1_out), .weight(weight), .result(wresult));
    control_output cont_out(.clk(clk), .rst(rst), .data(wresult), .conv_done(conv_done), 
                            .ram_address(wram_address2), .data_out(wdata_out));
    BRAM2 bram_out (clk, 1'b1, 1'b1, wram_address2, wdata_out, out);
endmodule
