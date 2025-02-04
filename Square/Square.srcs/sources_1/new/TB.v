`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.04.2024 22:10:23
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

reg clk;
reg [31:0] num;
wire [31:0]sqrt;

square_root  uut(clk,num,sqrt);

initial
begin
clk=1'b0;
num=32'd10;

end
always #5 clk=~clk;
endmodule
