`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:26:36 01/15/2019 
// Design Name: 
// Module Name:    RestoreDV 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
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
