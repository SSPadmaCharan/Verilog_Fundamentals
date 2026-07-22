
`timescale 1ns/1ps

module csa_adder_tb;

reg [7:0]a;
reg [7:0]b;
reg c_in;

wire [7:0]s;
wire c_out;

csa_adder dut(

    .a(a),
    .b(b),
    .c_in(c_in),

    .s(s),
    .c_out(c_out)
);

 integer i;
 localparam total_test_case = 2 ** 17;
 localparam delay = 10;

initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0,csa_adder_tb);

 $display("========== CSA ADDER Automated Test Started ==========");

    for(i=0;i<total_test_case;i=i+1)
    begin
        {a,b,c_in} = i;
        
        #delay;
    end
   $display("========== Test Completed Successfully ==========");

    $finish;

end

initial begin
    
    $monitor("Time=%0t A=%b B=%b c_in=%b sum=%b c_out=%b ",$time,a,b,c_in,s,c_out );
end

endmodule