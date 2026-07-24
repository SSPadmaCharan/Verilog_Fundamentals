`timescale 1ns/1ps

module demux_tb;
reg i;
reg [1:0]s;

wire [3:0]y;

demux dut(
    .i(i),
    .s(s),

    .y(y)
);

integer j;
localparam total_test_case = 2 ** 3;
localparam delay = 10;



initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0,demux_tb);


$display("========== 1X4 DEMUX  Automated Test Started ==========");
 for (j =0 ;j<total_test_case ;j=j+1) begin

    {i,s}=j;

    #delay;

    
 end
 $display("========== 1X4 DEMUX  Automated Test Completed ==========");

 $finish;



end

initial begin
    $monitor("Time=%0t I=%b S0=%b S1=%b Y0=%b Y1=%b Y2=%b Y3=%b ",$time,i,s[0],s[1],y[0],y[1],y[2],y[3]);

end

endmodule
