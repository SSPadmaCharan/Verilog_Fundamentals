`timescale 1ns/1ps

module decoder_tb;

reg a;
reg b;
reg [3:0]exp;
wire [3:0]y;

decoder dut(
    .a(a),
    .b(b),

    .y(y)
);


integer i;
localparam total_test_case=2 ** 2;
localparam delay =10 ;
integer f_counter=0;


initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0,decoder_tb);

    $display("========== 2X4 DECODER  Automated Test Started ==========");

for (i =0 ;i<total_test_case ;i=i+1 ) begin
    {a,b} = i;
    #delay;
    
    exp=0001 << i;

    if(exp==y) begin

        $display("PASS : Test Case %0d", i+1);
    end
else 
begin
     $display("--------------------------------------");
    $display("FAIL : Test Case %0d", i+1);
    $display("Encoding  = %b", {a,b});
   
   
    $display("Expected  = %b", exp[3:0]);
    $display("Received  = %b", y);
    $display("--------------------------------------");
    f_counter=f_counter+1;
end

    
end
    $display("========== 2X4 DECODER  Automated Test Completed  ==========");
     if (f_counter == 0)
    $display("RESULT : ALL TEST CASES PASSED");
else
    $display("RESULT : %0d TEST CASE(S) FAILED", f_counter);


$finish;
end

endmodule
