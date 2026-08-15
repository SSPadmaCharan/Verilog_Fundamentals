`timescale 1ns/1ps

module parity_gen_tb;
reg [3:0]b;
wire p;

parity_gen dut(
    .b(b),
    .p(p)
);


localparam total_test_cases =2**4 ;
integer i;
localparam delay=10;

initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0,parity_gen_tb);

    
 $display("========== Even parity generator Automated Test Started ==========");
    

    for (i =0;i<total_test_cases ;i=i+1 ) begin
        b=i;
        #delay;

        
    end
     $display("========== Even parity generator Automated Test Completed ==========");
    



end

initial begin
    $monitor("Time=%0t B=%b Parity Bit=%b ",$time,b,p);

end

endmodule

