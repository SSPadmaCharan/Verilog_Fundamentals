`timescale 1ns/1ps

module parity_check_tb;
reg [3:0]b;
reg p;
wire error;

parity_check dut(
    .b(b),
    .p(p),
    .error(error)
);


localparam total_test_cases =2**5 ;
integer i;
localparam delay=10;

initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0,parity_check_tb);

    
 $display("========== Even parity checker Automated Test Started ==========");
    

    for (i =0;i<total_test_cases ;i=i+1 ) begin
            {p,b}=i;
        #delay;

        
    end
     $display("========== Even parity checker Automated Test Completed ==========");
    



end

initial begin
    $monitor("Time=%0t B=%b Parity Bit=%b Error=%b ",$time,b,p,error);

end

endmodule

