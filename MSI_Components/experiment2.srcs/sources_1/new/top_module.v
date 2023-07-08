`timescale 1ns / 1ps

module top_module(
    input  [7:0]sw,
    input  [3:0]btn,
    output [7:0]led,
    output [6:0]cat,
    output [3:0]an,
    output dp
    );
    //DECODER
    wire [15:0]conc1;
    DECODER decoder1(
                    .IN(sw[3:0]),
                    .OUT(conc1)
                    );
    assign {dp,cat,led} = conc1;
    assign an = 4'b1110;  
    //ENCODER
//    ENCODER_PRIMITIVE encoder1(
//                           .IN(sw[3:0]),
//                           .OUT(led[1:0]),
//                           .V(led[7])
//                           );                  
//    ENCODER_CASE encoder2(
//                         .IN(sw[3:0]),
//                         .OUT(led[1:0]),
//                         .V(led[7])
//                         ); 
    //MUX
//MUX_ASSIGN mux1(
//               .D(sw[3:0]),
//               .S(btn[1:0]),
//               .O(led[0])
//               ); 
//MUX_CASE mux2(
//              .D(sw[3:0]),
//              .S(btn[1:0]),
//              .O(led[0])
//              );    
    //DEMUX
//DEMUX demux1(
//            .D(sw[0]),
//            .S(btn[1:0]),
//            .O(led[3:0])
//            );
endmodule
