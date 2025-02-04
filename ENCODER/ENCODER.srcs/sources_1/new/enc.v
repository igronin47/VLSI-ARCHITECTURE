`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.03.2024 22:19:49
// Design Name: 
// Module Name: enc
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

module encoder(Ck,Clk,zk);
input Ck;
input Clk;
output zk;

reg D1=0;
reg D2=0;
reg D3=0;
reg D4=0;
wire x1,x2,x3;
wire t1,t2,t3;
wire z1,z2;

assign z1 = D1;
assign z2 = D2;
assign z3 = D3;
assign zk = D4;
always@(posedge Clk)
begin
   D1 <= (Ck ^z3^z2);
   D2 <= z1; 
   D3 <= z2;
   D4 <= z3^z1^Ck^z2^z3;   
end
endmodule
