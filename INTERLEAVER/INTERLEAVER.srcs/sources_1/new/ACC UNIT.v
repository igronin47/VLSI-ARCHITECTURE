`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.02.2024 23:01:43
// Design Name: 
// Module Name: ACC UNIT
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

module interl (pi_out,pi_in,g_in,gout,N,reset,clk,g);
parameter k = 14;
output [k-1:0] pi_out;
input [k-1:0]pi_in;
input [k-1:0]g_in;
input [k-1:0]gout;
input[k-1:0]N ;
input reset;
input clk;
input [k-1:0] g;

reg init;
wire [k-1:0] a1;
wire [k-1:0] a2;

always @(posedge clk)
 begin
    if (reset) begin
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
.reset(reset),
.clk(clk)
);

ACC1 uut(
.Y(pi_out),
.N(N),
.A(a1),
.B(a2),
.clk(clk)
);

endmodule




module GAMMA(clk,reset,gin,g,N,gout);
parameter K=14;
input clk,reset;
input [K-1:0]gin;
input [K-1:0]g;
input [K-1:0]N;
output  [K-1:0]gout;

reg init;

wire [K-1:0]a;

always@(posedge clk)
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
ACC1 A1(.clk(clk),.reset(reset),.A(a),.B(g),.N(N),.Y(gout));

endmodule

module ACC1(clk,reset,A,B,N,Y);
parameter K=14;
input [K-1:0]A;
input clk,reset;
input [K-1:0]B;
input [K-1:0]N;
output reg [K-1:0]Y;


wire [K-1:0]add_out;
wire [K-1:0]sub_out;
wire [K-1:0]mux_out;

assign add_out = A + B;
assign sub_out = add_out - N;
assign mux_out = sub_out[K-1] ? add_out:sub_out;

always@(posedge clk)
begin
 Y <= mux_out;
end
endmodule










/*
module ACC(T01,g1,N1,CLK,T1);
parameter K=13;
input CLK;
input [K-1:0]T01;
input [K-1:0]g1;
input [K-1:0]N1;
output reg [K-1:0]T1;

wire [K-1:0]T11;
wire [K-1:0]B;
reg init1;


always@(posedge CLK)
begin
if (T11 !=0 && T1 !=0)
   init1 <= 0;
else 
   init1 <= 1;
end


assign B = init1 ? T01:T11;
 
ACCUNIT1 A1(T01,init1,g1,N1,T11);
ACCUNIT1 A2(0,init1,B,N1,T1);

endmodule

module ACCUNIT1(T0,init,g,N,T);
parameter K=13;
input init;
input [K-1:0]T0;
input [K-1:0]g;
input [K-1:0]N;
output reg [K-1:0]T;

wire [K-1:0]A;
wire [K-1:0]add_out;
wire [K-1:0]sub_out;
wire [K-1:0]mux_out;

assign A = init?T0:T;
assign add_out = A + g;
assign sub_out = add_out - N;
assign mux_out = (sub_out[K-1]) ? add_out:sub_out;
always@(posedge init)
begin
T <= mux_out;  
end
endmodule
*/




/*
module PIE(Clk,reset,pi_in,g, g_out, gin,N,pi_out);
parameter K=13;
input Clk,reset;
input [K-1:0]pi_in;
input [K-1:0]g_out;
input [K-1:0]gin;
input [K-1:0]N;
input [K-1:0]g;
output [K-1:0]pi_out;

reg init;
wire [K-1:0]a1;
wire [K-1:0]a2;

GAMMA  G1(.Clk(Clk),.reset(reset),.gin(gin),.g(g),.N(N),.gout(gout));

ACC1 B1(.Clk(Clk),.reset(reset),.A(a1),.B(a2),.N(N),.Y(pi_out));

always@(posedge Clk)
begin
   if (reset) begin
      init<=0;
      end
    
   else begin
       if (pi_out !=0) begin
         init <=1;
         end
       else begin
       init <=0;
       end     
     end
end


assign a1=init?pi_out:pi_in;
assign a2=init?g_out:gin; 

endmodule
*/

