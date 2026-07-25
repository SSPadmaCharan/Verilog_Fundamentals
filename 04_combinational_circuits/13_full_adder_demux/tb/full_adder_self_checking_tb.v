`timescale 1ns/1ps

module full_adder_tb;

reg a;
reg b;
reg c_in;
reg [2:0]expected;

wire s_u;
wire c_out;

full_adder dut(
 .a(a),
 .b(b),
 .c_in(c_in),

 .s_u(s_u),
 .c_out(c_out)
);

integer i;
localparam total_test_case = 2 ** 3;
localparam delay = 10;
integer f_counter=0;
initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0,full_adder_tb);
   
   $display("========== FULL ADDER DEMUX  Automated Test Started ==========");

    for (i =0 ;i<total_test_case ;i = i + 1 ) begin

        {a,b,c_in} = i;

        #delay;
              expected = a + b + c_in;
        if(expected=={c_out,s_u})
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
    $display("Received  = %b", {c_out,s_u});
    $display("--------------------------------------");

    f_counter=f_counter + 1;
end

        
    end
     $display("========== FULL ADDER DEMUX  Automated Test Completed ==========");
      if (f_counter == 0)
    $display("RESULT : ALL TEST CASES PASSED");
else
    $display("RESULT : %0d TEST CASE(S) FAILED", f_counter);

     $finish;

end



endmodule

