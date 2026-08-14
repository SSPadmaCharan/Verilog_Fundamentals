`timescale 1ns/1ps

module seven_seg_tb;

reg [3:0]b;
reg [6:0] exp;
wire [6:0]seg;


seven_seg dut(
    .b(b),
    .seg(seg)
);

integer i;
localparam total_test_cases =2**4 ;
localparam delay=10;
integer f_counter=0;


initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0,seven_seg_tb);


 $display("========== Seven Segment Display Automated Test Started ==========");


    for (i =0 ;i<total_test_cases ;i=i+1 ) begin

        b=i;
        #delay;

        if (i<=9) begin
            exp[6]=b[3] | b[1] | (~(b[2]^b[0])) ;
            exp[5]=b[3] | ~b[2] | (~(b[1]^b[0]));
            exp[4]=b[3] | ~b[1] |b[2] | b[0];
            exp[3]=b[3] | (b[1]&~b[0]) | (b[1]&~b[2]) | (~b[2]&~b[0]) | (~b[1]&b[2]&b[0]);
            exp[2]=(b[1]&~b[0]) | (~b[0]&~b[2]);
            exp[1]=(b[2]&~b[1])|(~(b[1]|b[0])) | (b[2]&~b[0]) |b[3];
            exp[0]=b[3]| (b[1]&~b[0])|(~b[2]&b[1])|(b[2]&~b[1]);
        end
        else 
        begin
            exp=7'b0000000;

        end

        if (exp==seg) begin
              $display("PASS : Test Case %0d", i+1);
            
        end

        else 
        begin
           $display("--------------------------------------");
           $display("FAIL : Test Case %0d", i+1);
            $display("B=%b",b);
            $display("Expected=%b",exp);
            $display("Recieved=%b",seg);
            $display("--------------------------------------");
    f_counter=f_counter+1;
         end 
        end
        if (f_counter == 0)
    $display("RESULT : ALL TEST CASES PASSED");
else
    $display("RESULT : %0d TEST CASE(S) FAILED", f_counter);

$display("========== Seven Segment Display Automated Test Completed ==========");
  $finish;
        
    end

   



endmodule
