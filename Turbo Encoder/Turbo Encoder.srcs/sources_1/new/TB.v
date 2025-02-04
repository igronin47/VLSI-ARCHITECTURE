`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: IIT MANDI
// Engineer: AMIT SINGH
// 
// Create Date: 07.03.2024 15:21:28
// Design Name: TESTBENCH
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
reg Ck;
reg Clk;
reg en;
reg enc;
reg rst;
reg [13:0] g_in;
reg [13:0] g;
reg [13:0] pi_in;
reg [13:0] N;
wire Zk;
wire zk;
wire [13:0] count_out;
wire [13:0] gout;
wire [13:0] pi_out;
wire Zkk;
wire zkk;



Main_Encoder uut(Ck,Clk,en,enc, Zk, zk,pi_out,pi_in,g_in,gout,N,rst,g,count_out,Zkk,zkk);


initial
begin
rst = 1;
Clk=0;
Ck=1;
en=0;
enc=1'b0;
g_in = 10'b1011100111;
g = 10'b1111000000;
pi_in = 1'b0;
N=13'b1100000000000;
#10
rst = 0;

   
#500000 en=1'b1;
#1000 enc=1'b1;
end

always #4   Ck = ~Ck;
always #5 Clk = ~Clk;
endmodule
