`timescale 1ns/1ps

module b2bcd_tb;

reg [7:0]b;
wire [11:0]bcd;
reg [11:0]exp;
reg [3:0]hun;
reg [3:0]ten;

reg [3:0]ones;


b2bcd dut(

   .b(b),
   .bcd(bcd)

);

integer i;
localparam total_test_case=2**8;
localparam delay=10;

integer f_counter=0;

initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0,b2bcd_tb);


 $display("========== Binary to BCD Automated Test Started ==========");
    for(i=0;i<total_test_case;i=i+1)begin
        b={i};
        #delay;

        if (i>99)begin
            hun=i/100;
            
            ten=(i%100)/10;
            ones = (i%100)%10;

            exp={hun,ten,ones};
        end

        else begin
            hun=0;
            ten=i/10;
            ones=i%10;

            exp={hun,ten,ones};
        end

        if (exp==bcd) begin

              $display("PASS : Test Case %0d", i+1);
        end
         else 
         begin
            $display("--------------------------------------");
           $display("FAIL : Test Case %0d", i+1);
            $display("B=%b",b);
            $display("Expected=%b",exp);
            $display("Recieved=%b",bcd);
            $display("--------------------------------------");
    f_counter=f_counter+1;
         end

end

    
    $display("========== Binary to BCD Automated Test Completed ==========");
    
if (f_counter == 0)
    $display("RESULT : ALL TEST CASES PASSED");
else
    $display("RESULT : %0d TEST CASE(S) FAILED", f_counter);
 $finish;
end

endmodule
