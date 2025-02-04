`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.02.2024 23:35:48
// Design Name: 
// Module Name: ACCUNIT2
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


module ACCUNIT2(in);
parameter K=13;
input init;
input [K-1:0]T0;
input [K-1:0]g;
input [K-1:0]N;
output [K-1:0]T;

wire [K-1:0]A;
wire [K-1:0]add_out;
wire [K-1:0]sub_out;
wire [K-1:0]mux_out;

assign A = init?T0:T;

assign add_out = A + g;

assign sub_out = N - add_out;

assign mux_out = sub_out[K] ? add_out:sub_out;

assign T=sub_out;


endmodule
