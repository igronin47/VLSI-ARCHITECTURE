`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.02.2024 22:35:22
// Design Name: 
// Module Name: adhg
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


module ALU_design(r_out, a, b, sel, clk );
parameter N=4;
input [N-1:0]  a,b;
input[1:0] sel;
input clk;
output reg [2*N-1:0] r_out;

reg [N-1:0] r_a;
reg [N-1:0]r_b;
//reg [(2*N)-1:0] r_out;
reg [N-1:0] r_add;
reg [N-1:0] r_sub;
reg [2*N-1:0] r_mul;

parameter add = 00, sub = 01, mul = 10;

    always @ (posedge clk)
    begin
    r_a <=a;
    r_b<=b;
    end
    
    always @(posedge clk)
    begin
    r_add <= r_a + r_b;
    r_sub <= r_a - r_b;
    r_mul <= r_a * r_b;
    end
    
    always @(posedge clk)
    begin
    case(sel)
    add : r_out <= r_add;
    sub : r_out <= r_sub;
    mul : r_out <= r_mul;
    default: r_out <= 8'd0;
    endcase
    end
    
   // assign out = r_out;
    
    
    
endmodule
