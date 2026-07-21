`timescale 1ns/1ps

module cla_adder_tb;

reg [3:0]a;
reg [3:0]b;
reg c_in;

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

initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0,cla_adder_tb);
   
   $display("========== CLA ADDER Automated Test Started ==========");

    for (i =0 ;i<total_test_case ;i = i + 1 ) begin

        {a,b,c_in} = i;

        #delay;

        
    end
     $display("========== CLA ADDER Automated Test Completed ==========");

     $finish;

end

initial begin
    $monitor("Time=%0t A=%b B=%b c_in=%b sum=%b c_out=%b ",$time,a,b,c_in,s,c_out );
end

endmodule

