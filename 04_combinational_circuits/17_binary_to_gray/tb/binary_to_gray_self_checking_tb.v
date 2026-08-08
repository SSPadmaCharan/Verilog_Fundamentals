`timescale 1ns/1ps

module bi2gray_tb;
reg [3:0]b;
reg [3:0]exp;
wire [3:0]g;

bi2gray dut(

    .b(b),
    .g(g)
);

localparam total_test_case=2**4;
integer i;
localparam delay=10;
integer f_counter=0;

initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0,bi2gray_tb);

     $display("========== Binary to Gray Automated Test Started ==========");

     for (i =0 ;i<total_test_case ;i=i+1 ) begin

        b=i;


        #delay;
        exp = {b[3], b[3]^b[2], b[2]^b[1], b[1]^b[0]};

        if (exp==g) begin
            $display("PASS : Test Case %0d", i+1);
            
        end

        else
        begin
            $display("--------------------------------------");
           $display("FAIL : Test Case %0d", i+1);
            $display("B=%b",b);
            $display("Expected=%b",exp);
            $display("Recieved=%b",g);
            $display("--------------------------------------");
    f_counter=f_counter+1;

        end

        
     end
 
$display("========== Binary to Gray Automated Test completed  ==========");

if (f_counter == 0)
    $display("RESULT : ALL TEST CASES PASSED");
else
    $display("RESULT : %0d TEST CASE(S) FAILED", f_counter);

$finish;


end

endmodule 
