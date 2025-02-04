`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.04.2024 22:49:45
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
reg [3:0] N,D;
wire [3:0] Q,R;

NonrestoreDV  uut(N,D,Q,R);

initial
begin
N=4'b0000;
D=4'b0000;
#10
N=4'bX;
D=4'bX;
#10
N=4'b0111;
D=4'b0111;
#10
N=4'b0110;
D=4'b0111;
end
endmodule



/*
module TB();
reg clk,reset;
reg [31:0]dividend;
reg [31:0]divisor;
wire [31:0]quotient;
wire [31:0]remainder;

non_restoring_divider uut(clk,reset,dividend,divisor,quotient,remainder);

initial
begin
clk=1'b0;
reset=1'b1;
dividend=32'd5;
divisor=32'd2;
#200
reset=1'b0;

end
always #20 clk=~clk;
endmodule
*/
/*
module TB();
reg [3:0]N;
reg [3:0]D;
wire [3:0]Q;
wire [3:0]R;

NonrestoreDV uut(N,D,Q,R);

initial
begin
N=4'b0100;
D=4'b0010;
#10
N=4'b0110;
D=4'b0010;
end
endmodule

*/
/*
module Rest_div_tb;

reg clk,rst,start;
reg [3:0]X,Y;
wire [3:0]quot,rem;
wire valid;

always #5 clk = ~clk;

Rest_div  inst(clk,rst,start,X,Y,valid,quot,rem);

initial
$monitor($time,"X=%d, Y=%d, valid=%d, quot=%d, rem=%d ",X,Y,valid,quot,rem);

initial
begin
X=15;Y=8;clk=1'b1;rst=1'b0;start=1'b0;
#10 rst = 1'b1;
#10 start = 1'b1;
#10 start = 1'b0;
@valid
#10 X=10;Y=2;start = 1'b1;
#10 start = 1'b0;
@valid
#10 X=5; Y=10;start = 1'b1;
#10 start = 1'b0;
@valid
#10 X=5; Y=7;start = 1'b1;
#10 start = 1'b0;
@valid
#10 X=5; Y=8;start = 1'b1;
#10 start = 1'b0;
end      
endmodule

*/