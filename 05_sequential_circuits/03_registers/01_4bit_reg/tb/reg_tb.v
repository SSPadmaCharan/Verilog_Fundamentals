`timescale 1ns/1ps

module reg_tb;

reg [3:0]d;
reg clk;
reg en;
reg [3:0]exp_q;
wire [3:0]q;

reg_4 dut(
    .d(d),
    .clk(clk),
    .en(en),

    .q(q)
);

integer i;
localparam total_test_cases=2**5;
integer f_counter = 0;
integer test_counter = 0;

always #5 clk=~clk;

initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0,reg_tb);

    $display("4 Bit Register Automated Test Started " );

    clk=0;
    d=0;

    @(posedge clk);
    #1;

   exp_q=4'b0;

   for (i =0 ;i<total_test_cases ;i=i+1 ) begin

    {en,d}=i;

    @(posedge clk);
    #1;

    if(d&&en)begin
        exp_q=d;
    end
    else begin
        exp_q=exp_q;
    end

 test_counter = test_counter + 1;
     if (exp_q==q) begin
        
                $display("PASS : Test Case %0d", test_counter);
                
                
     end

     else begin
           $display("--------------------------------------");
                $display("FAIL : Test Case %0d", test_counter);
                $display("CLK      = %b", clk);
                $display("D        = %b", d);
                $display("Enable   = %b",en);
              
                $display("Expected = %b ", exp_q);
                $display("Received = %b ", q);
                $display("--------------------------------------");

                f_counter = f_counter + 1;
     end


   end
$display("4 Bit Regsiter Automated test Ended");

    if (f_counter == 0)
        $display("RESULT : ALL VALID TEST CASES PASSED");
    else
        $display("RESULT : %0d TEST CASE(S) FAILED", f_counter);

    $finish;
end
endmodule


