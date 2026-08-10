/*
==============================================================================
Module Name : b2bcd
Author      : Padma Charan S S
Project     : Verilog Fundamentals
Description :
    This module implements an 8-bit Binary to BCD Converter using the
    Double Dabble (Shift-and-Add-3) algorithm in Verilog HDL.

    The module accepts an 8-bit binary input representing values from
    0 to 255 and generates the corresponding 12-bit BCD output.

    The 12-bit BCD output is divided into three 4-bit decimal digits:

        BCD[11:8]  -> Hundreds
        BCD[7:4]   -> Tens
        BCD[3:0]   -> Ones

    The Double Dabble algorithm operates by repeatedly checking each BCD
    digit. If a BCD digit is greater than or equal to 5, 3 is added to
    that digit before shifting the complete working register left by one
    bit.

    The process is repeated once for each of the 8 input bits.

    Algorithm:

        1. Initialize the BCD portion of the temporary register to zero.
        2. Load the 8-bit binary input into the working register.
        3. Check the Hundreds, Tens, and Ones BCD digits.
        4. Add 3 to every digit whose value is greater than or equal to 5.
        5. Shift the complete working register left by one bit.
        6. Repeat the process 8 times.
        7. Extract the upper 12 bits as the final BCD result.

    Working Register:

        temp[19:16] -> Hundreds
        temp[15:12] -> Tens
        temp[11:8]  -> Ones
        temp[7:0]   -> Binary Input

    Implementation:
        - Combinational Procedural RTL
        - always @(*)
        - Synthesizable for Loop
        - Conditional if Statements
        - Temporary Working Register
        - Vector Part-Select
        - Left Shift Operator (<<)

    Example:

        Binary:
            11111111

        Decimal:
            255

        BCD:
            0010 0101 0101

    Applications:
        - Digital Displays
        - Seven-Segment Display Interfaces
        - Digital Meters
        - Digital Counters
        - Calculators
        - FPGA and ASIC Designs

Note:
    The Double Dabble algorithm is a hardware-friendly method for converting
    binary values into BCD without requiring conventional binary-to-decimal
    division hardware.

==============================================================================
*/


module b2bcd(
    input wire [7:0]b,
    output wire [11:0]bcd
);

reg [19:0]temp;

integer i;

always @(*) begin
    
    temp = {{12'b0},b};
   

    for (i =0 ;i<8 ;i=i+1 ) begin
       
         if (temp[19:16]>=5) begin

            temp[19:16]=temp[19:16]+3;
            
         end

           if (temp[15:12]>=5) begin

           temp[15:12]=temp[15:12]+3;
            
         end  

           if (temp[11:8]>=5) begin

           temp[11:8]=temp[11:8]+3;
            
         end 

         temp = temp << 1;


        end

   
end
 assign bcd = temp[19:8];

endmodule 
