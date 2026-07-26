`timescale 1ns/1ps

module encoder_tb;
reg [7:0]i;

wire [2:0]b;

encoder dut(
    .i(i),
    .b(b)
);
integer j;
localparam total_test_case=8;
localparam delay=10;

initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0,encoder_tb);

    
   $display("========== 8X3 ENCODER  Automated Test Started ==========");

   for (j=0 ;j<total_test_case ;j=j+1 ) begin


        i=8'b00000001 << j;
        #delay;

    
   end
      $display("========== 8X3 ENCODER  Automated Test Completed ==========");
end

initial begin
    $monitor("Time=%0t I=%b B=%b ",$time,i,b);

end
endmodule
