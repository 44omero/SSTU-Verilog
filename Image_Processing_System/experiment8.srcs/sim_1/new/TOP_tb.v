`timescale 1ns / 1ps

module TOP_tb;

reg clk=0, rst, conv_run;
reg [71:0] kernel;
wire conv_done;
wire [1023:0] out;
    
integer fptr;
TOP dut(.clk(clk), .rst(rst), .conv_run(conv_run), 
            .kernel(kernel), .conv_done(conv_done), .out(out));
always begin
#10 clk = ~clk;
end    
initial begin
    kernel = 72'hFF_FF_FF_FF_08_FF_FF_FF_FF;
    rst = 1; #11
    rst = 0;
    conv_run = 1;
    #119
    
    fptr = $fopen("C:/Users/omero/Desktop/SSTU/experiment8/output_image.txt","w");
    if (fptr == 0) begin
        $display("Could not open file '%s' for writing","output.txt");
        $stop; 
    end
    while(!$feof(fptr)) begin
        if(dut.conv_done == 1) $finish();
        $fwrite(fptr,"%h\n",out);
        #80;
    end

end
endmodule
