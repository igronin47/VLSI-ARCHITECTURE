`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.04.2024 13:50:43
// Design Name: 
// Module Name: fa
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

module fa(clk,A, B);
input clk;
input [4:0]A;
output reg [4:0]B;

always@(posedge clk)
begin
B<=Y(A);
end


function  [4:0] Y;
      input [4:0] X;
     reg [4:0]count;
     reg [4:0]z;
      integer i;
      begin
          for (i=0; i<=10 ; i=i+1)
             begin
               count=5'b0;
               z=count*count;
               if (z>X)
                 Y=z;
               else 
                  count=count+1;
             end
      end
endfunction

endmodule