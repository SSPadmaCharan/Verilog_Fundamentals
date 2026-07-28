`timescale 1ns/1ps

module encoder_tb;

reg [3:0]e;
reg[1:0]exp;

wire  [1:0]y;

encoder dut(
    .e(e),
    .y(y)
);


integer i;
localparam total_test_case =2 ** 4;
localparam delay = 10;
integer f_counter=0;

initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0,encoder_tb);
    


    $display("========== 4X2 PRIORITY ENCODER  Automated Test Started ==========");

    for(i=0;i<total_test_case;i=i+1)
    begin
        e = i;

        #delay;

        if (e[3]==1) begin
          exp = 2'b11;


        end
        else if (e[2]==1) begin
            exp=2'b10;
            
        end
        else if (e[1]==1) begin
            exp = 2'b01;
            
        end
        else
        begin
            exp = 2'b00;
        end

 if (exp==y) begin
    $display("PASS : Test Case %0d", i+1); 
            //test possed
    
 end
 else 
 begin
     $display("--------------------------------------");
    $display("FAIL : Test Case %0d", i+1);
    $display("Encoding  = %b", e);
   
   
    $display("Expected  = %b", exp[1:0]);
    $display("Received  = %b", y);
    $display("--------------------------------------");
    f_counter=f_counter+1;

 end

    end
    if (f_counter == 0)
    $display("RESULT : ALL TEST CASES PASSED");
else
    $display("RESULT : %0d TEST CASE(S) FAILED", f_counter);

       $display("========== 4X2 PRIORITY ENCODER  Automated Test Completed ==========");
       $finish;
end
endmodule
