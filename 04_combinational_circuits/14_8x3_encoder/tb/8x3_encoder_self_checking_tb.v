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
integer f_counter=0; 


initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0,encoder_tb);

    
   $display("========== 8X3 ENCODER  Automated Test Started ==========");

   for (j=0 ;j<total_test_case ;j=j+1 ) begin


        i=8'b00000001 << j;
        #delay;
        if (b==j) begin

             
             $display("PASS : Test Case %0d", j+1); 
            //test possed
        end

else
begin
    $display("--------------------------------------");
    $display("FAIL : Test Case %0d", j);
    $display("I         = %b", i);
    $display("B        = %b", b);
   
    $display("Expected  = %b", j[2:0]);
    $display("Received  = %b", b);
    $display("--------------------------------------");

    f_counter=f_counter + 1;
end
    
    
   end
      $display("========== 8X3 ENCODER  Automated Test Completed ==========");
      if (f_counter == 0)
    $display("RESULT : ALL TEST CASES PASSED");
else
    $display("RESULT : %0d TEST CASE(S) FAILED", f_counter);
    $finish;

end

  
endmodule
