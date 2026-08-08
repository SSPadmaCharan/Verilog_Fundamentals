`timescale 1ns/1ps

module bi2gray_tb;
reg [3:0]b;
wire [3:0]g;

bi2gray dut(

    .b(b),
    .g(g)
);

localparam total_test_case=2**4;
integer i;
localparam delay=10;

initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0,bi2gray_tb);

     $display("========== Binary to Gray Automated Test Started ==========");

     for (i =0 ;i<total_test_case ;i=i+1 ) begin

        b=i;

        #delay;
        
     end
 
$display("========== Binary to Gray Automated Test completed  ==========");

$finish;


end

initial begin
    $monitor("Time=%0t B=%b G=%b ",$time,b,g);
end

endmodule
