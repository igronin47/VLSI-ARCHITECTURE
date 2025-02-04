`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.04.2024 01:48:01
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
reg clk;
wire [7:0]Y1;
wire [7:0]Y2;
wire [7:0]Y3;
wire [7:0]Y4;
wire [7:0]C1;
wire [7:0]C2;
wire [7:0]C3;
wire [7:0]C4;
/*
wire [N-1:0]Y1;
wire [N-1:0]Y2;
wire [N-1:0]Y3;
wire [N-1:0]Y4;
*/
wire [N-1:0]Emax;

//reg [N-1:0] R [0:3][0:3];

matrix uut(clk,Y1,Y2,Y3,Y4,C1,C2,C3,C4,Emax);

initial
begin
clk=1'b0;
/*
R[0][0]=8'b10101010;
R[0][1]=8'b10101010;
R[0][2]=8'b10101010;
R[0][3]=8'b10101010;
R[1][1]=8'b10101010;
R[1][2]=8'b10101010;
R[1][3]=8'b10101010;
R[1][0]=8'b10101010;
R[2][0]=8'b10101010;
R[2][1]=8'b10101010;
R[2][2]=8'b10101010;
R[2][3]=8'b10101010;
R[3][0]=8'b10101010;
R[3][1]=8'b10101010;
R[3][2]=8'b10101010;
R[3][3]=8'b10101010;
*/

end
always #5 clk=~clk;
endmodule
