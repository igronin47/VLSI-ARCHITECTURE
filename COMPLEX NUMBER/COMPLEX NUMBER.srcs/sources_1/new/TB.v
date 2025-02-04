`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: IIT MANDI
// Engineer: AMIT SINGH
// 
// Create Date: 26.04.2024 00:01:13
// Design Name: MIXED STYLE
// Module Name: TB
// Project Name: Eigenvalue of complex number
// Target Devices: Zybo Z7
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
/*
wire [20:0]Y1;
wire [20:0]Y2;
wire [20:0]Y3;
wire [20:0]Y4;
wire [12:0]C1;
wire [12:0]C2;
wire [12:0]C3;
wire [12:0]C4;
*/
wire [20:0]Emax;
//wire [15:0]Emax1;
matrix uut(clk,Emax);

initial
begin
clk=1'b1;
#2000
$stop;
end

always #5 clk=~clk;
endmodule
