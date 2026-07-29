`timescale 1ns/1ps

module decoder_tb;

reg a;
reg b;
wire [3:0]y;

decoder dut(
    .a(a),
    .b(b),

    .y(y)
);


integer i;
localparam total_test_case=2 ** 2;
localparam delay =10 ;

initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0,decoder_tb);

    $display("========== 2X4 DECODER  Automated Test Started ==========");

for (i =0 ;i<total_test_case ;i=i+1 ) begin
    {a,b} = i;
    #delay;

    
end
    $display("========== 2X4 DECODER  Automated Test Completed  ==========");

$finish;
end

initial begin
    $monitor("Time=%0t A=%b B=%b Decoded=%b",$time,a,b,y);
end
endmodule
