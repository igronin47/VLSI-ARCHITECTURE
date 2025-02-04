`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.02.2024 23:58:31
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
parameter K=14;
reg clk;
reg reset;
reg [K-1:0]g_in;
reg [K-1:0]g;
reg [K-1:0]N;
reg [K-1:0]pi_in;
wire [K-1:0]gout;
wire [K-1:0]pi_out;


// ACC  uut(T01,g1,N1,INIT,T1);

// GAMMA  uut(Clk,reset,gin,g,N,gout);

// PIE uut(.Clk(Clk),.reset(reset),.pi_in(pi_in),.g(g), .g_out(g_out), .gin(gin),.N(N),.pi_out(pi_out));

interl uut(pi_out,pi_in,g_in,gout,N,reset,clk,g);

initial 
begin
clk = 1'b1; reset=1'b1;

#10 reset=1'b0; g_in=10'b1011100111;
g=10'b1111000000;
N=13'b1100000000000;
pi_in=1'b0;

end
always #30 clk=~clk;
endmodule
