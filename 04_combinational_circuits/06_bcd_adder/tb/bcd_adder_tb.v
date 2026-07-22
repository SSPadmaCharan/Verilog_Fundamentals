

`timescale 1ns/1ps

module bcd_adder_tb;

reg [3:0]a;
reg [3:0]b;
reg c_in;

wire [3:0]s;
wire c_out;

 bcd_adder dut(

    .a(a),
    .b(b),
    .c_in(c_in),

    .s(s),
    .c_out(c_out)
);

 integer i;
 localparam delay = 10;
 localparam total_test_case=512;

initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0,bcd_adder_tb);

 $display("========== BCD ADDER Automated Test Started ==========");

    for(i=0;i<total_test_case;i=i+1)
    begin
        {a,b,c_in} = i;
        
        #delay;
          $fflush();
    end
   $display("========== Test Completed Successfully ==========");

    $finish;

end

initial begin
    
    $monitor("Time=%0t A=%b B=%b c_in=%b 10's=%b 1's=%b ",$time,a,b,c_in,c_out,s );
end

endmodule