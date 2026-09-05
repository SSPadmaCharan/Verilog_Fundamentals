`timescale 1ns/1ps

module d_ff_tb;

reg d;
reg clk;
reg exp_q;
reg exp_q_bar;

wire q;
wire q_bar;

d_ff dut (
    .d(d),
    .clk(clk),

    .q(q),
    .q_bar(q_bar)
);

integer i;
localparam delay =10 ;
localparam total_test_cases =2**2 ;
integer f_counter=0;
integer test_counter=0;

initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0,d_ff_tb);

    for (i =0 ;i<total_test_cases ;i=i+1 ) begin

        {d,clk}=i;
        #delay;
        test_counter=test_counter+1;
     
     if(clk==1) begin exp_q=d;
     exp_q_bar=~d; end

        if (exp_q===q&&exp_q_bar===q_bar) begin

 $display("PASS : Test Case %0d", test_counter);
end
else begin
    
        $display("--------------------------------------");
        $display("FAIL : Test Case %0d", test_counter);
      $display("CLK     = %b", clk);
     
        $display("D     = %b", d);
     
        $display("Expected= %b %b", exp_q, exp_q_bar);
        $display("Received= %b %b", q, q_bar);
        $display("--------------------------------------");

        f_counter = f_counter + 1;
end

        
    end
      if (f_counter == 0)
        $display("RESULT : ALL VALID TEST CASES PASSED");
    else
        $display("RESULT : %0d TEST CASE(S) FAILED", f_counter);

   
   $finish;
end

endmodule