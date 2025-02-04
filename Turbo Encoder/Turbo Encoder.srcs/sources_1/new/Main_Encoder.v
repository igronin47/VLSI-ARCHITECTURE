`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: IIT MANDI
// Engineer: AMIT SINGH
// 
// Create Date: 07.03.2024 11:23:33
// Design Name: TURBO ENCODER
// Module Name: Main_Encoder
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


module Main_Encoder(Ck,Clk,en,enc, Zk, zk,pi_out,pi_in,g_in,gout,N,rst,g,count_out,Zkk,zkk);
input Ck;
input Clk;
input en;
input enc;
input rst;
input [13:0]pi_in;
input [13:0] g_in;
input [13:0]N;
input [13:0] g;
//input en_cont;
output [13:0]gout;
output [13:0] pi_out;
output Zk;
output zk;
output [13:0]count_out;
output Zkk;
output zkk;

reg sel;
wire [13:0]mux_out;
wire Zkk1;
wire zkk1;

interl B1(.pi_out(pi_out),.pi_in(pi_in),.g_in(g_in),.gout(gout),.N(N),.rst(rst),.Clk(Clk),.g(g));
counter B2(.rst(rst),.Clk(Clk),.count_out(count_out));
BRAM B3(.Ck(Ck),.Clk(Clk),.addr(count_out),.en(en),.out(Zk));
BRAM B4(.Ck(Ck),.Clk(Clk),.addr(mux_out),.en(en),.out(zk));

encoder1 E1(.Ck(Zkk1),.Clk(Clk),.zk(Zkk));
encoder1 E2(.Ck(zkk1),.Clk(Clk),.zk(zkk));

assign Zkk1 = enc ? Zk:0;
assign zkk1 = enc ? zk:0;

assign mux_out = sel ? count_out:pi_out;
 

always@(posedge Clk)
begin
   if (en==0)
     sel <=1;
   else if (en==1)
     sel <=0;
end
endmodule
