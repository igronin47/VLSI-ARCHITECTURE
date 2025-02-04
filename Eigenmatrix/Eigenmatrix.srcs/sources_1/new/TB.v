`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: IIT MANDI
// Engineer: AMIT SINGH
// 
// Create Date: 05.04.2024 04:32:55
// Design Name: Eigen Matrix Testbench
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
wire [3:0]Emax;
//wire [31:0]Emax1;
matrix uut(clk,Emax);

initial
begin
clk=1'b1;
#800
$stop;
end

always #5 clk=~clk;
endmodule
