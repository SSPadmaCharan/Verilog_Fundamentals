`timescale 1ns/1ps

module mag_comp_tb;

reg [1:0]a;
reg [1:0]b;

wire gt;
wire les;
wire eq;

mag_comp dut(
    .a(a),
    .b(b),

    .gt(gt),
    .les(les),
    .eq(eq)
);
localparam total_test_case = 16;
integer f_count;
integer i;
localparam delay=10;
initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0,mag_comp_tb);

 $display("========== Magnitude comparator Automated Test Started ==========");

  for (i=0; i<total_test_case;i=i+1 ) begin

    {a,b} =i;
    #delay;
    
  end
        $display("========== Test Completed Successfully ==========");
   $finish;

end

initial begin
    $monitor("Time=%0t A1=%b A2=%B B1=%b B2=%b Greater=%b Lesser=%b Equal=%b",$time,a[0],a[1],b[0],b[1],gt,les,eq);

end
endmodule
