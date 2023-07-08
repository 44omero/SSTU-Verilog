`timescale 1ns / 1ps

module Top_Module(
    input [14:0] IN,
    output [7:0] OUT
    );
    AND AND_GATE(.I1(IN[0]), .I2(IN[1]), .O(OUT[0]));
    OR OR_GATE(.I1(IN[2]), .I2(IN[3]), .O(OUT[1]));
    NOT NOT_GATE(.I(IN[4]), .O(OUT[2]));
    NAND NAND_GATE(.I1(IN[5]), .I2(IN[6]), .O(OUT[3]));
    NOR NOR_GATE(.I1(IN[7]), .I2(IN[8]), .O(OUT[4]));
    EXOR EXOR_GATE(.I1(IN[9]), .I2(IN[10]), .O(OUT[5]));
    EXNOR EXNOR_GATE(.I1(IN[11]), .I2(IN[12]), .O(OUT[6]));
    TRI TRI_GATE(.I(IN[13]), .E(IN[14]), .O(OUT[7]));

endmodule
