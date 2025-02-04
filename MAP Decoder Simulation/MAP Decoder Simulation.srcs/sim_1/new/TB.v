`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.05.2024 10:34:25
// Design Name: 
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
reg Ck;
reg Clk; 
reg rst;
//wire [3:0]OUT;
// wire out;
// wire [0:2]out0;
// wire [0:2]out1;
// wire [0:2]out2;
// wire [0:2]out3;
// wire [0:2]out4;
// wire [0:2]out5;
// wire [0:2]out6;
// wire [0:2]out7;
 

Decoder uut(Ck,Clk,rst);

initial 
begin
// Stage 1
Ck=0;
Clk=1;
rst=1;
#2
rst=0;
#30
Ck=1;

// Stage 2
#20
Ck=0;
#18
Ck=1;

// Stage 3
#20
Ck=0;
#20
Ck=1;

// Stage 4
#20
Ck=0;
#20
Ck=1;

// Stage 5
#20
Ck=0;
#20
Ck=1;

// Stage 6
#20
Ck=0;
#20
Ck=1;

// Stage 7
#20
Ck=0;
#20
Ck=1;

// Stage 8
#20
Ck=0;
#20
Ck=1;

//#30 $finish;

end


always #10 Clk=~Clk;
endmodule



