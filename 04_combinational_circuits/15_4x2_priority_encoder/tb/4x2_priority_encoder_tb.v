`timescale 1ns/1ps

module encoder_tb;

reg [3:0]e;
wire  [1:0]y;

encoder dut(
    .e(e),
    .y(y)
);


integer i;
localparam total_test_case =2 ** 4;
localparam delay = 10;
initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0,encoder_tb);


    $display("========== 4X2 PRIORITY ENCODER  Automated Test Started ==========");

    for(i=0;i<total_test_case;i=i+1)
    begin
        e = i;

        #delay;

    end

       $display("========== 4X2 PRIORITY ENCODER  Automated Test Completed ==========");
       $finish;
end

initial begin
    $monitor("Time=%0t Encoding=%b Encoded=%b ",$time,e,y);

end
endmodule
