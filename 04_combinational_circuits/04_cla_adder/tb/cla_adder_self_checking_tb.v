`timescale 1ns/1ps

module cla_adder_tb;

reg [3:0]a;
reg [3:0]b;
reg c_in;
reg [4:0]expected;

wire [3:0]s;
wire c_out;

cla_adder dut(
 .a(a),
 .b(b),
 .c_in(c_in),

 .s(s),
 .c_out(c_out)
);

integer i;
localparam total_test_case = 512;
localparam delay = 10;
integer f_counter = 0;

initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0,cla_adder_tb);
   
   $display("========== CLA ADDER Automated Test Started ==========");

    for (i =0 ;i<total_test_case ;i = i + 1 ) begin

        {a,b,c_in} = i;

        #delay;
        expected = a + b + c_in;
        if(expected=={c_out,s})
        begin 
             $display("PASS : Test Case %0d", i+1); 
            //test possed
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

    f_counter=f_counter + 1;
end

        
    end

     $display("========== CLA ADDER Automated Test Completed ==========");

     if (f_counter == 0)
    $display("RESULT : ALL TEST CASES PASSED");
else
    $display("RESULT : %0d TEST CASE(S) FAILED", f_counter);

     $finish;


end


endmodule


