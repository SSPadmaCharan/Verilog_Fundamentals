`timescale 1ns/1ps

module seven_seg_tb;

reg [3:0]b;
wire [6:0]seg;


seven_seg dut(
    .b(b),
    .seg(seg)
);

integer i;
localparam total_test_cases =2**4 ;
localparam delay=10;


initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0,seven_seg_tb);


 $display("========== Seven Segment Display Automated Test Started ==========");


    for (i =0 ;i<total_test_cases ;i=i+1 ) begin

        b=i;
        #delay;

        
    end

    
 $display("========== Seven Segment Display Automated Test Completed ==========");

    $finish;




end

initial begin
    $monitor("Time=%0t B=%b  Segments=%b",$time,b,seg);
end
endmodule
