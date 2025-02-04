`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.02.2024 14:15:00
// Design Name: 
// Module Name: tb1
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

`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:35:03 06/30/2013
// Design Name:   qadd
// Module Name:   I:/Projects/xilinx/FPInterface/Tester/Tran3005/Tes_add.v
// Project Name:  Trancendental
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: qadd
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Tes_add;
    parameter Q = 15;
	parameter N = 32;
	// Inputs
	reg [31:0] a;
	reg [31:0] b;
    //reg clk;
	// Outputs
	wire [N-1:0] out;

	// Instantiate the Unit Under Test (UUT)
	add  uut (
		.a(a), 
		.b(b), 
		.out(out));

     initial
     begin
     
      a=32'b0000000000000000100000000000000;
      b=32'b0000000000000000110000000000000;
     end

endmodule