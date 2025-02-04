`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: IIT MANDI
// Engineer: AMIT SINGH
// 
// Create Date: 07.03.2024 11:24:37
// Design Name: BLOCKS
// Module Name: units_b
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


module counter(rst,Clk,count_out);
input rst;
input Clk;
output reg [13:0]count_out;

always@(posedge Clk)
begin

if (rst)
   count_out<=0;

else if (count_out==14'd6144)
   count_out<=0;
   
else
    count_out<= count_out + 14'd1;   
end
endmodule

module BRAM(Ck,Clk,addr,en,out);
input Ck;
input en;
input Clk;
input [13:0]addr;
output reg out;

reg mem[6143:0];

always@(posedge Clk)
begin
 if (en == 0)
   mem[addr] <= Ck;
end

always@(posedge Clk)
begin
 if (en == 1)
  out <= mem[addr];
end
endmodule


module encoder1(Ck,Clk,zk);
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

/*
module encoder(Ck,Clk,zk);
input Ck;
input Clk;
output reg zk;

reg D1;
reg D2;
reg D3;

wire x1,x2,x3;
wire t1,t2,t3;
wire z1,z2;

xor G1(Ck,x1,t1);
xor G2(t1,t2,t3);
xor G3(z2,z3,x1);
xor G4(z3,t3,zk);

assign z1 = D1;
assign z2 = D2;
assign z3 = D3;

always@(posedge Clk)
begin
   D1 <= t1;
   D2 <= z1; 
   D3 <= z2;   
end
endmodule
*/

module interl (pi_out,pi_in,g_in,gout,N,rst,Clk,g);
parameter k = 14;
output [k-1:0] pi_out;
input [k-1:0]pi_in;
input [k-1:0]g_in;
input [k-1:0]gout;
input[k-1:0]N ;
input rst;
input Clk;
input [k-1:0] g;

reg init;
wire [k-1:0] a1;
wire [k-1:0] a2;

always @(posedge Clk)
 begin
    if (rst) begin
        init<=0;
    end 
    else if(pi_out!=0) begin
       init<=1'b1;
    end
    else begin
        init <= 1'b0;
    end
end

assign a1 = (init) ? pi_out:pi_in;
assign a2 = (init) ? gout:g_in;

GAMMA b1(
.gout(gout),
.gin(g_in),
.g(g),
.N(N),
.rst(rst),
.Clk(Clk)
);

ACC1 uut(
.Y(pi_out),
.N(N),
.A(a1),
.B(a2),
.Clk(Clk)
);

endmodule

module GAMMA(Clk,rst,gin,g,N,gout);
parameter K=14;
input Clk,rst;
input [K-1:0]gin;
input [K-1:0]g;
input [K-1:0]N;
output  [K-1:0]gout;

reg init;

wire [K-1:0]a;

always@(posedge Clk)
begin
   if (gout!=0)
     begin
     init <=1;
     end
   else begin
     init <=0;
   end
end

assign a=init?gout:gin;
ACC1 A1(.Clk(Clk),.rst(rst),.A(a),.B(g),.N(N),.Y(gout));

endmodule

module ACC1(Clk,rst,A,B,N,Y);
parameter K=14;
input [K-1:0]A;
input Clk,rst;
input [K-1:0]B;
input [K-1:0]N;
output reg [K-1:0]Y;


wire [K-1:0]add_out;
wire [K-1:0]sub_out;
wire [K-1:0]mux_out;

assign add_out = A + B;
assign sub_out = add_out - N;
assign mux_out = sub_out[K-1] ? add_out:sub_out;

always@(posedge Clk)
begin
 Y <= mux_out;
end
endmodule

