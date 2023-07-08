`timescale 1ns / 1ps

module FA_tb;

    reg x,y,ci;
    wire cout,s;

    FA dut(.x(x), .y(y), .ci(ci), .cout(cout), .s(s));
    
    initial begin
        for(integer i=0; i<8; i=i+1) begin
                #100 {x,y,ci} = i;
        end
    $finish;
    end
endmodule