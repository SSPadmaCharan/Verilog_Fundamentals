`timescale 1ns/1ps

module full_adder_tb;

reg a;
reg b;
reg c_in;
reg [1:0]expected;

wire s;
wire c_out;

full_adder dut(

    .a(a),
    .b(b),
    .c_in(c_in),

    .s(s),
    .c_out(c_out)
);

integer i;
localparam total_test_case = 2 ** 3;
localparam delay = 10;
integer f_count=0;


initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0,full_adder_tb);
    

 $display("========== FULL ADDER Automated Test Started ==========");


 for (i =0;i<total_test_case;i = i+1 ) 
 begin

 {a,b,c_in} = i;

 #delay;

$fflush();

expected = a + b + c_in;

 if(expected == {c_out,s})
 begin
    $display("PASS : Test Case %0d", i);
 end
 else 
 begin
    $display("--------------------------------------");
    $display("FAIL : Test Case %0d", i);
    $display("A         = %b", a);
    $display("B         = %b", b);
    $display("Cin       = %b", c_in);
    $display("Expected  = %b", expected);
    $display("Received  = %b", {c_out,s});
    $display("--------------------------------------");

    f_count=f_count+1;

 end
    
 end

 if(f_count==0)
 $display("ALL TESTS ARE PASSED");
 else
 $display("NO OF TEST CASE FAILED IS %d",f_count);

 $display("========== FULL ADDER Automated Test Completed ==========");

 $finish;



end



endmodule
