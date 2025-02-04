`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:52:17 08/05/2017 
// Design Name: 
// Module Name:    lsh10 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module lsh1(a,b);
    input [3:0] a;
    output [4:0] b;
assign {b[4:1],b[0]}= {a[3:0],1'b0};
endmodule