`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.04.2024 13:05:27
// Design Name: 
// Module Name: main
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

module NonrestoreDV(N,D,Q,R);

input [3:0] N,D;
output [3:0] Q,R;
wire [3:0] Q1,Q2,N2,N4;
wire [4:0] N1,N3,N5;
wire c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11;
wire s1,s2,s3;

lsh1 shift1(N,N1);
assign s0 = ~(N1[4] ^ D[3]);
sb1 m1(D[0],N1[0],s0,s0,N2[0],c0);
sb1 m2(D[1],N1[1],c0,s0,N2[1],c1);
sb1 m3(D[2],N1[2],c1,s0,N2[2],c2);
sb1 m4(D[3],N1[3],c2,s0,N2[3],c3);

lsh1 shift2(N2,N3);
assign s1 = ~(N3[4] ^ D[3]);
sb1 m5(D[0],N3[0],s1,s1,N4[0],c4);
sb1 m6(D[1],N3[1],c4,s1,N4[1],c5);
sb1 m7(D[2],N3[2],c5,s1,N4[2],c6);
sb1 m8(D[3],N3[3],c6,s1,N4[3],c7);

lsh1 shift3(N4,N5);
assign s2 = ~(N5[4] ^ D[3]);
sb1 m9(D[0],N5[0],s2,s2,R[0],c8);
sb1 m10(D[1],N5[1],c8,s2,R[1],c9);
sb1 m11(D[2],N5[2],c9,s2,R[2],c10);
sb1 m12(D[3],N5[3],c10,s2,R[3],c11);

assign Q1 = {1'b0,s0,s1,s2};
assign Q2 = {1'b0,~ Q1[2:0]};
assign Q = Q1 - Q2;

endmodule

module sb1(b,a,cin,s,d,cout);

input a,b,cin,s;
output d,cout;
///full adder/subtractor........
assign d = a^b1^cin;

assign cout = (b1 & cin)|(b1 & a)|(a & cin);
////compliment of b
assign b1 = s^b;
endmodule

module lsh1(a,b);
    input [3:0] a;
    output [4:0] b;
assign {b[4:1],b[0]}= {a[3:0],1'b0};
endmodule



/*
module RestoreDV(N,D,Q,R);

input [3:0] N,D;
output [3:0] Q,R;
wire [3:0] Q1,Q2,N2,N4;
wire [4:0] N1,N3,N5;
wire c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11;
wire s1,s2,s3;
wire sel1,sel2,sel3;

lsh1 shift1(N,N1);
assign s0 = ~N1[4];
sb m1(D[0],N1[0],s0,s0,sel1,N2[0],c0);
sb m2(D[1],N1[1],c0,s0,sel1,N2[1],c1);
sb m3(D[2],N1[2],c1,s0,sel1,N2[2],c2);
sb m4(D[3],N1[3],c2,s0,sel1,N2[3],c3);
assign sel1 = ( ~c3);


lsh1 shift2(N2,N3);
assign s1 = ~N3[4];
sb m5(D[0],N3[0],s1,s1,sel2,N4[0],c4);
sb m6(D[1],N3[1],c4,s1,sel2,N4[1],c5);
sb m7(D[2],N3[2],c5,s1,sel2,N4[2],c6);
sb m8(D[3],N3[3],c6,s1,sel2,N4[3],c7);
assign sel2 = ( ~c7);


lsh1 shift3(N4,N5);
assign s2 = ~N5[4];
sb m9(D[0],N5[0],s2,s2,sel3,R[0],c8);
sb m10(D[1],N5[1],c8,s2,sel3,R[1],c9);
sb m11(D[2],N5[2],c9,s2,sel3,R[2],c10);
sb m12(D[3],N5[3],c10,s2,sel3,R[3],c11);
assign sel3 = ( ~c11);


assign Q = {1'b0,c3,c7,c11};


endmodule

module lsh1(a,b);
    input [3:0] a;
    output [4:0] b;
assign {b[4:1],b[0]}= {a[3:0],1'b0};
endmodule

module sb(b,a,cin,s,s1,op,cout);

input a,b,cin,s,s1;
output op,cout;
wire d;
///full adder/subtractor........
assign d = a^b1^cin;

assign cout = (b1 & cin)|(b1 & a)|(a & cin);
////compliment of b
assign b1 = s^b;
assign op = (s1 & a) | (~s1 & d);
endmodule
*/
/*
module non_restoring_divider (
  input clk,reset,
  input [31:0] dividend,
  input [31:0] divisor,
  output [31:0] quotient,
  output [31:0] remainder
);

  reg [31:0] q, r;

  always @(posedge clk) begin
    if (reset) begin
      q <= 0;
      r <= dividend;
    end else begin
      q <= q << 1;
      r <= r << 1;
      if (r[31]) begin
        r <= r - divisor;
      end else begin
        r <= r + divisor;
      end
      if (q[31]) begin
        q[0] <= 0;
      end else begin
        q[0] <= 1;
      end
    end
  end

  assign quotient = q;
  assign remainder = r;

endmodule
*/
/*
module NonrestoreDV(N,D,Q,R);

input [3:0] N,D;
output [3:0] Q,R;
wire [3:0] Q1,Q2,N2,N4;
wire [4:0] N1,N3,N5;
wire c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11;
wire s1,s2,s3;

lsh1 shift1(N,N1);
assign s0 = ~(N1[4] ^ D[3]);
sb1 m1(D[0],N1[0],s0,s0,N2[0],c0);
sb1 m2(D[1],N1[1],c0,s0,N2[1],c1);
sb1 m3(D[2],N1[2],c1,s0,N2[2],c2);
sb1 m4(D[3],N1[3],c2,s0,N2[3],c3);

lsh1 shift2(N2,N3);
assign s1 = ~(N3[4] ^ D[3]);
sb1 m5(D[0],N3[0],s1,s1,N4[0],c4);
sb1 m6(D[1],N3[1],c4,s1,N4[1],c5);
sb1 m7(D[2],N3[2],c5,s1,N4[2],c6);
sb1 m8(D[3],N3[3],c6,s1,N4[3],c7);

lsh1 shift3(N4,N5);
assign s2 = ~(N5[4] ^ D[3]);
sb1 m9(D[0],N5[0],s2,s2,R[0],c8);
sb1 m10(D[1],N5[1],c8,s2,R[1],c9);
sb1 m11(D[2],N5[2],c9,s2,R[2],c10);
sb1 m12(D[3],N5[3],c10,s2,R[3],c11);

assign Q1 = {1'b0,s0,s1,s2};
assign Q2 = {1'b0,~ Q1[2:0]};
assign Q = Q1 - Q2;

endmodule

module lsh1(a,b);
    input [3:0] a;
    output [4:0] b;
assign {b[4:1],b[0]}= {a[3:0],1'b0};
endmodule

module sb1(b,a,cin,s,d,cout);

input a,b,cin,s;
output d,cout;
///full adder/subtractor........
assign d = a^b1^cin;

assign cout = (b1 & cin)|(b1 & a)|(a & cin);
////compliment of b
assign b1 = s^b;
endmodule
*/
/*
module Rest_div(clk,rst,start,X,Y,valid,quot,rem);

input clk;
input rst;
input start;
input [3:0]X,Y;
output [3:0]quot,rem;
output valid;

reg [7:0] Z,next_Z,Z_temp,Z_temp1;
reg next_state, pres_state;
reg [1:0] count,next_count;
reg valid, next_valid;

parameter IDLE = 1'b0;
parameter START = 1'b1;

assign rem = Z[7:4];
assign quot = Z[3:0];

always @ (posedge clk or negedge rst)
begin
if(!rst)
begin
  Z          <= 8'd0;
  valid      <= 1'b0;
  pres_state <= 1'b0;
  count      <= 2'd0;
end
else
begin
  Z          <= next_Z;
  valid      <= next_valid;
  pres_state <= next_state;
  count      <= next_count;
end
end

always @ (*)
begin 
case(pres_state)
IDLE:
begin
next_count = 2'b0;
next_valid = 1'b0;
if(start)
begin
    next_state = START;
    next_Z     = {4'd0,X};
end
else
begin
    next_state = pres_state;
    next_Z     = 8'd0;
end
end

START:
begin
next_count = count + 1'b1;
Z_temp     = Z << 1;
Z_temp1    = {Z_temp[7:4]-Y,Z_temp[3:0]};
next_Z     = Z_temp1[7] ? {Z_temp[7:4],Z_temp[3:1],1'b0} : 
                          {Z_temp1[7:4],Z_temp[3:1],1'b1};
next_valid = (&count) ? 1'b1 : 1'b0; 
next_state = (&count) ? IDLE : pres_state;	
end
endcase
end
endmodule
*/
