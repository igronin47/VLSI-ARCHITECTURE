`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.02.2024 14:37:33
// Design Name: 
// Module Name: add
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



module add(a,b,out);
	parameter Q = 15;
	parameter N = 32;
    input [N-1:0] a;
    input [N-1:0] b;
    output [N-1:0] out;

reg [N-1:0] out_reg;

always @(a,b) 
   begin
	if(a[N-1] == b[N-1]) begin						
		out_reg[N-2:0] = a[N-2:0] + b[N-2:0];		
		out_reg[N-1] = a[N-1];													 
		end												
	else if(a[N-1] == 0 && b[N-1] == 1) begin		
		if( a[N-2:0] > b[N-2:0] ) begin					
			out_reg[N-2:0] = a[N-2:0] - b[N-2:0];			
			out_reg[N-1] = 0;										
			end
		else begin												
			out_reg[N-2:0] = b[N-2:0] - a[N-2:0];			
			if (out_reg[N-2:0] == 0)
				out_reg[N-1] = 0;										
			else
				out_reg[N-1] = 1;										
			end
		end
	else begin												
		if( a[N-2:0] > b[N-2:0] ) begin					
			out_reg[N-2:0] = a[N-2:0] - b[N-2:0];			
			if (out_reg[N-2:0] == 0)
				out_reg[N-1] = 0;										
			else
				out_reg[N-1] = 1;										
			end
		else begin												
			out_reg[N-2:0] = b[N-2:0] - a[N-2:0];			
			out_reg[N-1] = 0;										
			end
		end
	end
	assign out = out_reg;
endmodule