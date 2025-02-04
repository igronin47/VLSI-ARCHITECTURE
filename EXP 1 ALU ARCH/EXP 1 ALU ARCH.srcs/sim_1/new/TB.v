`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.02.2024 17:23:13
// Design Name: 
// Module Name: TB
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


module TB();
parameter N=8;
reg [N-1:0] a;
reg [N-1:0] b;
reg [1:0] Sel;
reg Clk;
wire [2*N-1:0] Out;

ALU uut(a, b, Sel,Clk, Out);

initial 
begin
Clk=1'b1;
Sel=2'b00; a=8'b00000100; b=8'b00000100;
#10
Sel=2'b01; a=8'b00001100; b=8'b00000100;
#10
Sel=2'b00; a=8'b00001000; b=8'b00000100;
#10
Sel=2'b11; a=8'b00001100; b=8'b00000100;
#10
$finish;
end
always #5 Clk=~Clk;
endmodule
