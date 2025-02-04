`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.02.2024 17:11:51
// Design Name: 
// Module Name: ALU
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


module ALU(a, b, Sel,Clk, Out);
parameter N=8;  // total bits
parameter F=3;  // fractional bits
input [N-1:0] a;
input [N-1:0] b;
input Clk;
output [2*N-1:0] Out;
input [1:0] Sel;

parameter ADD=2'b00, SUB=2'b01, MUL=2'b11;

reg [N-1:0] a_reg;
reg [N-1:0] b_reg;

reg [2*N-1:0] out_reg;

always@(posedge Clk)
begin
a_reg <= a;
b_reg <= b;
end


always@(posedge Clk)
begin
case(Sel)
ADD: out_reg <= a_reg + b_reg;
SUB: out_reg <= a_reg - b_reg;
MUL: out_reg <= a_reg*b_reg;
10:  out_reg <= a_reg / b_reg;
endcase
end


assign Out = out_reg;

endmodule
