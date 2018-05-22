`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/22/2018 10:17:34 PM
// Design Name: 
// Module Name: CRC_coding_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module CRC_coding_tb #(parameter Length = 8)(

    );
wire out_shift;
reg [1:Length] out_stage;
reg clk_in,rst_in,last_bit,bit_in;
CRC_coding M0(clk_in,rst_in,last_bit,bit_in,out_stage,out_shift);
initial begin
    clk_in = 0;
    forever #5 clk_in=~clk_in;
end
initial begin
 rst_in = 0;
 #20 rst_in = 1;
end
initial begin
    last_bit = 0;
end
initial begin
bit_in = 1;
#10 bit_in = 0;
end
endmodule
