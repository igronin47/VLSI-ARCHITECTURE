`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.02.2024 14:40:38
// Design Name: 
// Module Name: Subt
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

module sub(a,b,out);
	parameter Q = 15;
	parameter N = 32;
    input [N-1:0] a;
    input [N-1:0] b;
    output [N-1:0] out;

reg [N-1:0] out_reg;

always @(a,b) 
   begin
	if(a[N-1] ==0 && b[N-1]==0) begin						
		out_reg[N-2:0] = a[N-2:0] - b[N-2:0];
		 if (a[N-2:0] > b[N-2:0]) begin		
		out_reg[N-1] = 0;													 
		end
		else 
		begin
		out_reg[N-1] = 1;
		end	
		end											
	else if(a[N-1] == 0 && b[N-1] == 1) begin		
			out_reg[N-2:0] = a[N-2:0] + b[N-2:0];			
			out_reg[N-1] = 0;										
		end
		
	else if(a[N-1] == 1 && b[N-1] == 1) begin	
	      if (b[N-2:0] > a[N-2:0])begin	
			out_reg[N-2:0] = b[N-2:0] - a[N-2:0];			
			out_reg[N-1] = 0;										
		    end	
		  else begin
		    out_reg[N-2:0] = b[N-2:0] - a[N-2:0];
		    out_reg[N-1] = 1;
		    end
		end
	else if (a[N-1] == 1 && b[N-1] == 0) begin
	   out_reg[N-2:0] = a[N-2:0] + b[N-2:0];
	   out_reg[N-1] = 1;
	end
	end
	assign out = out_reg;
endmodule
