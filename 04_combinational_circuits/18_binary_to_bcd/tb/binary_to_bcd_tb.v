`timescale 1ns/1ps

module b2bcd_tb;

reg [7:0]b;
wire [11:0]bcd;


b2bcd dut(

   .b(b),
   .bcd(bcd)

);

integer i;
localparam total_test_case=2**8;
localparam delay=10;

initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0,b2bcd_tb);


 $display("========== Binary to BCD Automated Test Started ==========");
    for(i=0;i<total_test_case;i=i+1)begin
        b={i};
        #delay;
    end

    
    $display("========== Binary to BCD Automated Test Completed ==========");

 $finish;
end
 initial begin
    $monitor("Time=%0t B=%b BCD=%b ",$time,b,bcd);
 end

endmodule
