`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/01/2018 10:15:07 PM
// Design Name: 
// Module Name: CRC_coding
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


module CRC_coding #(parameter Length = 8, parameter [Length:1] Tap_Coefficient = 8'b1110_0000) 
(input clk_in,rst_in,last_bit,bit_in,
 output reg [1:Length] out_stage,
 output FinishFlag
    );
integer cell_ptr;
reg out_state;
always@(posedge clk_in)
begin
    if(rst_in ==1'b0) begin
        out_stage <= 8'b0000_0000; end
    else 
     begin
        for(cell_ptr=2;cell_ptr<=Length;cell_ptr=cell_ptr+1)
        if(Tap_Coefficient[cell_ptr]==1'b1) out_stage[cell_ptr]<= out_stage[cell_ptr-1]^out_stage[Length];
        else
         out_stage[cell_ptr]<= out_stage[cell_ptr-1];
        out_stage[1]<= out_stage[Length]^bit_in;   
     end
     
    
    
end  

always @(posedge clk_in)
begin
    if(rst_in ==1'b0)  out_state <=0;
    else if(last_bit==1'b0) out_state <=0;
    else 
        out_state <=1;
end  
assign FinishFlag = 1 ? (out_state==1): 1'b0;
endmodule
