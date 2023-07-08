`timescale 1ns / 1ps

// f3 = ABCD
// f2 = AB'C + ACD' >>> AC(BD)'
// f1 = A'BC + BCD' + AB'D + AC'D >>> AD xor BC
// f0 = BD

module with_SSI(
                input a,b,c,d,
                output f3,f2,f1,f0
                );
    //f3
    wire f3w1, f3w2;
    AND f3and1(a, b, f3w1);      //AB
    AND f3and2(c, d, f3w2);      //CD
    AND f3and3(f3w1, f3w2, f3);  //ABCD
    //f2
    wire f2w1, f2w2, f2w3;
    AND f2and1(b, d, f2w1);      //BD
    NOT f2not1(f2w1,f2w2);       //(BD)'
    AND f2and2(a, c, f2w3);      //AC
    AND f2and3(f2w2, f2w3, f2);  //AC(BD)'
    //f1
    wire f1w1, f1w2;
    AND f1and1(a, d, f1w1);      //AD
    AND f1and2(b, c, f1w2);      //BC
    EXOR f1exor1(f1w1, f1w2, f1);//AD xor BC
    //f0
    AND f0and1(b, d, f0);        //BD
    
endmodule

module with_decoder(
                input a,b,c,d,
                output f3,f2,f1,f0
                );
    wire [3:0]in;
    wire [15:0]out;
    assign in[3] = a;
    assign in[2] = b;
    assign in[1] = c;
    assign in[0] = d;
    DECODER decoder1(in,out);
    //minterms
    //f0 -> (15,13,7,5)
    //f1 -> (14,13,11,9,7,6)
    //f2 -> (14,11,10)
    //f3 -> (15)
    
    //f0
    wire f0w0,f0w1;
    OR f0or0(out[5],out[7],f0w0);
    OR f0or1(out[13],out[15],f0w1);
    OR f0or2(f0w0, f0w1, f0);
    
    //f1
    wire f1w0,f1w1,f1w2,f1w3;
    OR f1or0(out[6],out[7],f1w0);
    OR f1or1(out[9],out[11],f1w1);
    OR f1or2(out[13],out[14],f1w2);
    OR f1or3(f1w0,f1w1,f1w3);
    OR f1or4(f1w3,f1w2,f1);
    
    //f2
    wire f2w0;
    OR f2or0(out[10],out[11],f2w0);
    OR f2or1(f2w0,out[14],f2);
    
    //f3
    OR f3or0(1'b0,out[15],f3);
    
endmodule

module with_MUX(
                input a,b,c,d,
                output f3,f2,f1,f0
                );
//nots
wire b_not,d_not;
NOT notb(b,b_not);
NOT notd(d,d_not);
//f0
wire f0w0;
AND f0and0(b,d,f0w0);
MUX_CASE f0mux({f0w0,f0w0,f0w0,f0w0},{a,c},f0);
//f1
wire f1w0,f1w1,f1w2;
AND f1and0(b,d_not,f1w0);
AND f1and1(d,b_not,f1w1);
OR f1or0(f1w0,f1w1,f1w2);
MUX_CASE f1mux({f1w2,d,b,1'b0},{a,c},f1);
//f2
wire f2w0;
OR f2or0(b_not,d_not,f2w0);
MUX_CASE f2mux({f2w0,1'b0,1'b0,1'b0},{a,c},f2);
//f3
wire f3w0;
AND f3and0(b,d,f3w0);
MUX_CASE f3mux({f3w0,1'b0,1'b0,1'b0},{a,c},f3);                
endmodule