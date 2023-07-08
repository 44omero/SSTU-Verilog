`timescale 1ns / 1ps

module parametric_RCA_tb#(
    parameter SIZE = 8
    );

    reg [SIZE-1:0]x;
    reg [SIZE-1:0]y; 
    reg ci;     
    wire [SIZE-1:0]s;
    wire cout;
    
    localparam LOOP_COUNTER = 2**((2*SIZE)-1);
    
    parametric_RCA dut(.x(x), .y(y), .ci(ci), .cout(cout), .s(s));
    integer i;
    initial begin
        ci=0;
        for(i=0; i<LOOP_COUNTER; i=i+1) begin
                #10 {x,y} = i;
        end
    $finish;
    end
endmodule
