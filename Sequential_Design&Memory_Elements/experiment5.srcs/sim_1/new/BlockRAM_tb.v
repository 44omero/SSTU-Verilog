`timescale 1ns / 1ps

module BlockRAM_tb;

    reg clka=0, wea=0;
    reg [3:0] addra;
    wire [7:0] douta;
    
    BlockRAM dut(.clka(clka), .wea(wea), .addra(addra), .douta(douta));
    
    always begin
    #10 clka=~clka;
    end
    initial begin
    addra = 4'b0000; #40
    addra = 4'b0001; #40
    addra = 4'b0010; #40
    addra = 4'b0011; #40
    addra = 4'b0100; #40
    addra = 4'b0101; #40
    addra = 4'b0110; #40
    addra = 4'b0111; #40
    addra = 4'b1000; #40
    addra = 4'b1001; #40
    addra = 4'b1010; #40
    addra = 4'b1011; #40
    addra = 4'b1100; #40
    addra = 4'b1101; #40
    addra = 4'b1110; #40
    addra = 4'b1111; #100
    $finish;
    end
endmodule
