`timescale 1ns/1ps

module sr_latch_tb;

reg enable;
reg s_n;
reg r_n;
reg exp_q=1'bx;
reg exp_q_bar=1'bx;

wire q;
wire q_bar;

sr_latch dut(

    .s_n(s_n),
    .r_n(r_n),
    .enable(enable),

    .q(q),
    .q_bar(q_bar)
);


integer i;
localparam total_test_cases =2**3 ;
localparam delay=10;
integer f_counter=0;


initial
begin
    $dumpfile("waveform.vcd");
    $dumpvars(0,sr_latch_tb);

     $display("========== Sr Latch Automated Test Started ==========");


    for (i =0 ;i<total_test_cases ;i=i+1 ) begin

        {enable,r_n,s_n}=i;
        #delay;



if(enable==0) begin
    exp_q=exp_q;
    exp_q_bar=exp_q_bar;
end

else begin
    if(s_n==0&&r_n==0)begin
        exp_q=exp_q;
        exp_q_bar=exp_q_bar;
    end

    else if (s_n==0&&r_n==1) begin
        exp_q=0;
        exp_q_bar=1;
        
    end
    else if (s_n==1&&r_n==0) begin
        exp_q=1;
        exp_q_bar=0;

        
    end



end

if (s_n==1&&r_n==1&&enable==1) begin
    $display("TEST CASE 8 = INVALID");

    
end
if(i<7) begin
if(exp_q==q&&exp_q_bar==q_bar)begin
    
              $display("PASS : Test Case %0d", i+1);
end

else begin
      $display("--------------------------------------");
           $display("FAIL : Test Case %0d", i+1);
           $display("enable=%b",enable);
            $display("s_n=%b",s_n);
            $display("r_n=%b",r_n);
            $display("Expected=%b %b",exp_q,exp_q_bar);
            $display("Recieved=%b %b",q,q_bar);
            $display("--------------------------------------");
    f_counter=f_counter+1;
end
end 
 end
$display("========== SR Latch Automated Test Completed ==========");

if (f_counter == 0)
    $display("RESULT : ALL TEST CASES PASSED");
else
    $display("RESULT : %0d TEST CASE(S) FAILED", f_counter);
 $finish;

end



endmodule
