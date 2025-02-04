`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.04.2024 22:46:10
// Design Name: 
// Module Name: matrix
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


module matrix(clk,Y1,Y2,Y3,Y4,C1,C2,C3,C4,Emax);
parameter N=8;
input clk;
/*
output reg [N-1:0] Y1;
output reg [N-1:0] Y2;
output reg [N-1:0] Y3;
output reg [N-1:0] Y4;
*/
output [7:0]Y1;
output [7:0]Y2;
output [7:0]Y3;
output [7:0]Y4;
output [7:0]C1;
output [7:0]C2;
output [7:0]C3;
output [7:0]C4;
output [7:0]Emax;

wire [7:0]C1=1;
wire [7:0]C2=1;    
wire [7:0]C3=1;
wire [7:0]C4=1;

wire [7:0]Z1;
wire [7:0]Z2;
wire [7:0]W;

/*
reg [7:0]C1=1;
reg [7:0]C2=1;    
reg [7:0]C3=1;
reg [7:0]C4=1;
*/
/*
always@(posedge clk)
begin
Y1=R[0][0]*C1 + R[0][1]*C2 + R[0][2]*C3 + R[0][3]*C4;
Y2=R[1][0]*C1 + R[1][1]*C2 + R[1][2]*C3 + R[1][3]*C4;
Y3=R[2][0]*C1 + R[2][1]*C2 + R[2][2]*C3 + R[2][3]*C4;
Y4=R[3][0]*C1 + R[3][1]*C2 + R[3][2]*C3 + R[3][3]*C4;
end
*/

genvar N1;
generate
begin
for (N1=1; N1<=40; N1=N1+1)
  begin
          
           Ymatrix E1(Y1[N1],Y2[N1],Y3[N1],Y4[N1]);
           Comp A1(Y1[N1],Y2[N1],Z1[N1]);
           Comp A2(Y3[N1],Y4[N1],Z2[N1]);
           Comp A3(Z1[N1],Z2[N1],W[N1]);

           Divider B1(Y1[N1],W[N1],C1[N1]);
           Divider B2(Y2[N1],W[N1],C2[N1]);
           Divider B3(Y3[N1],W[N1],C3[N1]);
           Divider B4(Y4[N1],W[N1],C4[N1]);
  end
end
endgenerate

assign Emax = W;

endmodule




module Comp(A,B,Y);
parameter N=8;
input [7:0]A;
input [7:0]B;
output [7:0]Y;
wire [7:0]X;
wire Z;
assign X=A-B;
assign Z=X[N-1];
assign Y=Z?B:A; 
endmodule


module Ymatrix(Y1,Y2,Y3,Y4);
parameter N=8;
/*
input [N-1:0]C1;
input [N-1:0]C2;
input [N-1:0]C3;
input [N-1:0]C4;
*/
output reg [7:0]Y1;
output reg [7:0]Y2;
output reg [7:0]Y3;
output reg [7:0]Y4;

reg [7:0]C1=1;
reg [7:0]C2=1;    
reg [7:0]C3=1;
reg [7:0]C4=1;

reg [7:0] R1 [0:3];
reg [7:0] R2 [0:3];
reg [7:0] R3 [0:3];
reg [7:0] R4 [0:3];

initial
begin
$readmemb("x0.mem", R1);
$readmemb("x1.mem", R2);
$readmemb("x2.mem", R3);
$readmemb("x3.mem", R4);
end

always@(*)
begin
Y1=R1[0]*C1 + R2[0]*C2 + R3[0]*C3 + R4[0]*C4;
Y2=R1[1]*C1 + R2[1]*C2 + R3[1]*C3 + R4[1]*C4;
Y3=R1[2]*C1 + R2[2]*C2 + R3[2]*C3 + R4[2]*C4;
Y4=R1[3]*C1 + R2[3]*C2 + R3[3]*C3 + R4[3]*C4;
end
endmodule

module Divider 
#(parameter N = 8)
(
    input [7:0] dividend,
    input [7:0] divisor,
    
    output[7:0] div_out  
);

reg [7:0] remainder;

wire[7:0] rem;
 reg [7:0] new;
reg [7:0] quotient ;
reg [3:0] out;
reg [3:0] n_out;

always @* begin
    quotient = 16'b0;
    remainder = 8'b0;

    if (divisor != 8'b0) begin
        quotient = dividend / divisor;
        remainder = dividend % divisor;
        
    end
end

assign rem = remainder;

always@(*) begin
if(rem != 0)begin
    new= rem * 10;
     out  = new / divisor;
end
else out = 0;
end

always@(*) begin 
    if(out == 4'b0001) begin
       n_out <= 4'b0010;  // 0.125 = 1
    end
    else if(out == 4'b0010) begin
       n_out <= 4'b0011;  // 0.1875 = 2
    end
    else if(out == 4'b0011) begin
       n_out <= 4'b0101; // 0.3125 
    end
    else if(out == 4'b0100) begin
       n_out <= 4'b0110; // 0.3750 
    end
    else if(out == 4'b0101) begin
       n_out <= 4'b1000; // 0.5 
    end
    else if(out == 4'b0110) begin
       n_out <= 4'b1010; // 0.625
    end
    else if(out == 4'b0111) begin
       n_out <= 4'b1100; //0.75
    end
    else if(out == 4'b1000) begin
       n_out <= 4'b1110; //0.875
    end
     else if(out == 4'b1001) begin
       n_out <= 4'b1111; //0.937
    end
     else if(out == 4'b0000) begin
       n_out <= 4'b0000; // 0 = 0
    end
     else if(out == 4'b1010) 
         begin
          n_out <= 4'b0101;
         end
     else if(out == 4'b1011) 
         begin
          n_out <= 4'b0111;
         end   
     else if(out == 4'b1100) 
         begin
          n_out <= 4'b0110;
         end
     else if(out == 4'b1101) 
         begin
          n_out <= 4'b0001;
         end
     else if(out == 4'b1110) 
         begin
          n_out <= 4'b0100;
         end
     else if(out == 4'b1111) 
         begin
          n_out <= 4'b0011;
         end
end
assign div_out = {quotient,n_out};

endmodule