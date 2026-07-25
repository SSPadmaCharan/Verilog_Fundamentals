`timescale 1ns/1ps

module full_adder_tb;

reg a;
reg b;
reg c_in;

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

initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0,full_adder_tb);
   
   $display("========== FULL ADDER DEMUX  Automated Test Started ==========");

    for (i =0 ;i<total_test_case ;i = i + 1 ) begin

        {a,b,c_in} = i;

        #delay;

        
    end
     $display("========== FULL ADDER DEMUX  Automated Test Completed ==========");

     $finish;

end

initial begin
    $monitor("Time=%0t A=%b B=%b c_in=%b sum=%b c_out=%b ",$time,a,b,c_in,s_u,c_out );
end

endmodule

