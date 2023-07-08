`timescale 1ns / 1ps

module SR_NAND(
    input S, R,
    output Q, Qn
    );
    
    NAND nand0(Qn,S,Q);
    NAND nand1(Q,R,Qn);
endmodule

module DFF(
    input D, CLK,
    output Q, Qn
    );
    wire notD,w1,w0;
    NOT not0(D,notD);
    NAND nand0(D,CLK,w0);
    NAND nand1(notD,CLK,w1);
    NAND nand2(w0,Qn,Q);
    NAND nand3(w1,Q,Qn);
endmodule

module MS_DFF(
    input D, CLK,
    output Q, Qn
    );
    wire Qm,notCLK;
    NOT not0(CLK,notCLK);
    
    DFF dff_master(.D(D), .CLK(CLK), .Q(Qm));
    DFF dff_slave (.D(Qm), .CLK(notCLK), .Q(Q), .Qn(Qn));
endmodule

module DFF_behav(
    input D, CLK,
    output Q, Qn
    );
    reg FF;
    always @(posedge CLK)begin
        FF = D;
    end
    assign Q = FF;
    assign Qn = ~FF;
endmodule

module register(
    input [7:0] IN,
    input CLK, CLR,
    output reg [7:0] OUT
    );
    always @(posedge CLK or posedge CLR)begin
        if(CLR) OUT <= 8'b0;
        else begin
        OUT <= IN;
        end
    end

endmodule

//module BlockRAM(
//    input clka, wea,
//    input [3:0] addra,
//    output [7:0] douta
//    );
    
//    wire [7:0] dina;
    //clock divider
//    integer counter = 0;
//    reg div_clka = 0;
//    always @(posedge clka)begin
//        counter <= counter+1;
//        if (counter % 1 == 0) div_clka = ~div_clka; 
//    end
        
//    blk_mem_gen_0 RAM
//    (.dina(dina), .clka(clka),
//    .wea(wea), .addra(addra),
//    .douta(douta));

//endmodule