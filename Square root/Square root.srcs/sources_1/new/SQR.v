`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.04.2024 11:18:18
// Design Name: 
// Module Name: SQR
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
////////////////////////////////////////////////////////////////////////////////

module square_root (input [31:0] num,output reg[31:0]sqr_root,output reg sqr_root_integer);

integer temp;
reg[31:0]i;

always@(*)
begin
sqr_root = 1'b0;
sqr_root_integer=1'b0;

for (i=0; i<(num/2); i=i+1)
 begin
  temp = i*i;
    if (temp == num) 
       begin
       sqr_root_integer = 1;
       sqr_root = i;
       end
 end
end
endmodule