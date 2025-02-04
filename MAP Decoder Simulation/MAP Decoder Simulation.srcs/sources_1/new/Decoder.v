`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.05.2024 10:32:23
// Design Name: 
// Module Name: Decoder
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


module Decoder(Ck,Clk,rst);
input Ck;
input Clk;
input rst;
//output [3:0]OUT;


wire out;
wire [0:2] out0;
wire [0:2] out1;
wire [0:2] out2;
wire [0:2] out3;
wire [0:2] out4;
wire [0:2] out5;
wire [0:2] out6;
wire [0:2] out7;



reg D=0;

reg [8:0]b0=9'd2;
reg [8:0]b1=9'd5;
reg [8:0]b2=9'd3;
reg [8:0]b3=9'd1;
reg [8:0]b4=9'd4;
reg [8:0]b5=9'd3;
reg [8:0]b6=9'd1;
reg [8:0]b7=9'd2;


reg Q01,Q02,Q03;
reg Q11,Q12,Q13;
reg Q21,Q22,Q23;
reg Q31,Q32,Q33;
reg Q41,Q42,Q43;
reg Q51,Q52,Q53;
reg Q61,Q62,Q63;
reg Q71,Q72,Q73;


wire z01,z02,z03;
wire z11,z12,z13;
wire z21,z22,z23;
wire z31,z32,z33;
wire z41,z42,z43;
wire z51,z52,z53;
wire z61,z62,z63;
wire z71,z72,z73;


// eta for stage 1 and Ck=0, eta=alpha+gamma+beta [a+b+b]
reg [8:0] n001,n011,n021,n031,n041,n051,n061,n071;

// eta for stage 1 and Ck=1, eta=alpha+gamma+beta [a+b+b]
reg [8:0] n101,n111,n121,n131,n141,n151,n161,n171;

// eta for stage 2 and Ck=0, eta=alpha+gamma+beta [a+b+b]
reg [8:0] n002,n012,n022,n032,n042,n052,n062,n072;

// eta for stage 2 and Ck=1, eta=alpha+gamma+beta [a+b+b]
reg [8:0] n102,n112,n122,n132,n142,n152,n162,n172;

// eta for stage 3 and Ck=0, eta=alpha+gamma+beta [a+b+b]
reg [8:0] n003,n013,n023,n033,n043,n053,n063,n073;

// eta for stage 3 and Ck=1, eta=alpha+gamma+beta [a+b+b]
reg [8:0] n103,n113,n123,n133,n143,n153,n163,n173;

// eta for stage 4 and Ck=0, eta=alpha+gamma+beta [a+b+b]
reg [8:0] n004,n014,n024,n034,n044,n054,n064,n074;

// eta for stage 4 and Ck=1, eta=alpha+gamma+beta [a+b+b]
reg [8:0] n104,n114,n124,n134,n144,n154,n164,n174;

// eta for stage 5 and Ck=0, eta=alpha+gamma+beta [a+b+b]
reg [8:0] n005,n015,n025,n035,n045,n055,n065,n075;

// eta for stage 5 and Ck=1, eta=alpha+gamma+beta [a+b+b]
reg [8:0] n105,n115,n125,n135,n145,n155,n165,n175;

// eta for stage 6 and Ck=0, eta=alpha+gamma+beta [a+b+b]
reg [8:0] n006,n016,n026,n036,n046,n056,n066,n076;

// eta for stage 6 and Ck=1, eta=alpha+gamma+beta [a+b+b]
reg [8:0] n106,n116,n126,n136,n146,n156,n166,n176;

// eta for stage 7 and Ck=0, eta=alpha+gamma+beta [a+b+b]
reg [8:0] n007,n017,n027,n037,n047,n057,n067,n077;

// eta for stage 7 and Ck=1, eta=alpha+gamma+beta [a+b+b]
reg [8:0] n107,n117,n127,n137,n147,n157,n167,n177;


// eta for stage 8 and Ck=0, eta=alpha+gamma+beta [a+b+b]
reg [8:0] n008,n018,n028,n038,n048,n058,n068,n078;

// eta for stage 8 and Ck=1, eta=alpha+gamma+beta [a+b+b]
reg [8:0] n108,n118,n128,n138,n148,n158,n168,n178;


//Lambda L for max of eta n of every stage 
//Lambda L max of Ck=0 & Ck=1 at stage 1
reg [8:0] L01,L11;

//Lambda L max of Ck=0 & Ck=1 at stage 2
reg [8:0] L02,L12;

//Lambda L max of Ck=0 & Ck=1 at stage 3
reg [8:0] L03,L13;

//Lambda L max of Ck=0 & Ck=1 at stage 4
reg [8:0] L04,L14;

//Lambda L max of Ck=0 & Ck=1 at stage 5
reg [8:0] L05,L15;

//Lambda L max of Ck=0 & Ck=1 at stage 6
reg [8:0] L06,L16;

//Lambda L max of Ck=0 & Ck=1 at stage 7
reg [8:0] L07,L17;

//Lambda L max of Ck=0 & Ck=1 at stage 8
reg [8:0] L08,L18;


// Gamma g [g=L1-L0] stage 1 to 8
reg [8:0] g1,g2,g3,g4,g5,g6,g7,g8;




// Input of Stage 1 alpha
reg [8:0]a00=9'd0;
reg [8:0]a01=9'd1;
reg [8:0]a02=9'd2;
reg [8:0]a03=9'd3;
reg [8:0]a04=9'd4;
reg [8:0]a05=9'd5;
reg [8:0]a06=9'd6;
reg [8:0]a07=9'd7;

// Output of stage 1 alpha dash & Input of stage 2
reg [8:0] a10,a11,a12,a13,a14,a15,a16,a17;

// Output of stage 2 alpha-alpha dash & Input of stage 3
reg [8:0] a20,a21,a22,a23,a24,a25,a26,a27;

// Output of stage 3 alpha-alpha-alpha dash & Input of stage 4
reg [8:0] a30,a31,a32,a33,a34,a35,a36,a37;

// Output of stage 4 alpha-alpha-alpha-alpha dash & Input of stage 5
reg [8:0] a40,a41,a42,a43,a44,a45,a46,a47;

// Output of stage 5 alpha-alpha-alpha-alpha-alpha dash & Input of stage 6
reg [8:0] a50,a51,a52,a53,a54,a55,a56,a57;

// Output of stage 6 alpha-alpha-alpha-alpha-alpha-alpha dash & Input of stage 7
reg [8:0] a60,a61,a62,a63,a64,a65,a66,a67;

// Output of stage 7 alpha-alpha-alpha-alpha-alpha-alpha-alpha dash & Input of stage 8
reg [8:0] a70,a71,a72,a73,a74,a75,a76,a77;

// Output of stage 8 alpha-alpha-alpha-alpha-alpha-alpha-alpha-alpha dash == beta & Input for stage 1 Backward
reg [8:0] b00,b01,b02,b03,b04,b05,b06,b07;

// Output of stage 7  beta & Input for stage 8 Backward
reg [8:0] b10,b11,b12,b13,b14,b15,b16,b17;

// Output of stage 6  beta & Input for stage 7 Backward
reg [8:0] b20,b21,b22,b23,b24,b25,b26,b27;

// Output of stage 5  beta & Input for stage 6 Backward
reg [8:0] b30,b31,b32,b33,b34,b35,b36;
reg [8:0] b37;

// Output of stage 4  beta & Input for stage 5 Backward
reg [8:0] b40,b41,b42,b43,b44,b45,b46,b47;

// Output of stage 3  beta & Input for stage 4 Backward
reg [8:0] b50,b51,b52,b53,b54,b55,b56,b57;

// Output of stage 2  beta & Input for stage 3 Backward
reg [8:0] b60,b61,b62,b63,b64,b65,b66,b67;

// Output of stage 1  beta & Input for stage 2 Backward
reg [8:0] b70,b71,b72,b73,b74,b75,b76,b77;


// Stage [000] Ck=0 & Ck=1
// D1,D2,D3 Flip Flop 0
always@(posedge Clk, posedge rst)
begin
   if (rst == 1)
      begin
       Q01 <= 1'b0;	
       Q02 <= 1'b0;	
       Q03 <= 1'b0;	
      end
   else 
      begin
       Q01 <= (Ck^z03^z02);
       Q02 <= z01;
       Q03 <= z02;
      end
end
assign out0={Q01,Q02,Q03};

assign z01 = Q01;
assign z02 = Q02;
assign z03 = Q03;



// Stage [001] Ck=0 & Ck=1
// D1,D2,D3 Flip Flop 1
always@(posedge Clk, posedge rst)
begin
   if (rst == 1)
      begin
       Q11 <= 1'b0;	
       Q12 <= 1'b0;	
       Q13 <= 1'b1;	
      end
   else 
      begin
       Q11 <= (Ck^z13^z12);
       Q12 <= z11;
       Q13 <= z12;
      end
end
assign out1={Q11,Q12,Q13};

assign z11 = Q11;
assign z12 = Q12;
assign z13 = Q13;


// Stage [010] Ck=0 & Ck=1
// D1,D2,D3 Flip Flop 2
always@(posedge Clk, posedge rst)
begin
   if (rst == 1)
      begin
       Q21 <= 1'b0;	
       Q22 <= 1'b1;	
       Q23 <= 1'b0;	
      end
   else 
      begin
       Q21 <= (Ck^z23^z22);
       Q22 <= z21;
       Q23 <= z22;
      end
end
assign out2={Q21,Q22,Q23};

assign z21 = Q21;
assign z22 = Q22;
assign z23 = Q23;



// Stage [011] Ck=0 & Ck=1
// D1,D2,D3 Flip Flop 3
always@(posedge Clk, posedge rst)
begin
   if (rst == 1)
      begin
       Q31 <= 1'b0;	
       Q32 <= 1'b1;	
       Q33 <= 1'b1;	
      end
   else 
      begin
       Q31 <= (Ck^z33^z32);
       Q32 <= z31;
       Q33 <= z32;
      end
end
assign out3={Q31,Q32,Q33};

assign z31 = Q31;
assign z32 = Q32;
assign z33 = Q33;



// Stage [100] Ck=0 & Ck=1
// D1,D2,D3 Flip Flop 4
always@(posedge Clk, posedge rst)
begin
   if (rst == 1)
      begin
       Q41 <= 1'b1;	
       Q42 <= 1'b0;	
       Q43 <= 1'b0;	
      end
   else 
      begin
       Q41 <= (Ck^z43^z42);
       Q42 <= z41;
       Q43 <= z42;
      end
end
assign out4={Q41,Q42,Q43};

assign z41 = Q41;
assign z42 = Q42;
assign z43 = Q43;



// Stage [101] Ck=0 & Ck=1
// D1,D2,D3 Flip Flop 5
always@(posedge Clk, posedge rst)
begin
   if (rst == 1)
      begin
       Q51 <= 1'b1;	
       Q52 <= 1'b0;	
       Q53 <= 1'b1;	
      end
   else 
      begin
       Q51 <= (Ck^z53^z52);
       Q52 <= z51;
       Q53 <= z52;
      end
end
assign out5={Q51,Q52,Q53};

assign z51 = Q51;
assign z52 = Q52;
assign z53 = Q53;



// Stage [110] Ck=0 & Ck=1
// D1,D2,D3 Flip Flop 6 
always@(posedge Clk, posedge rst)
begin
   if (rst == 1)
      begin
       Q61 <= 1'b1;	
       Q62 <= 1'b1;	
       Q63 <= 1'b0;	
      end
   else 
      begin
       Q61 <= (Ck^z63^z62);
       Q62 <= z61;
       Q63 <= z62;
      end
end
assign out6={Q61,Q62,Q63};

assign z61 = Q61;
assign z62 = Q62;
assign z63 = Q63;



// Stage [111] Ck=0 & Ck=1
// D1,D2,D3 Flip Flop 7
always@(posedge Clk, posedge rst)
begin
   if (rst == 1)
      begin
       Q71 <= 1'b1;	
       Q72 <= 1'b1;	
       Q73 <= 1'b1;	
      end
   else 
      begin
       Q71 <= (Ck^z73^z72);
       Q72 <= z71;
       Q73 <= z72;
      end
end
assign out7={Q71,Q72,Q73};

assign z71 = Q71;
assign z72 = Q72;
assign z73 = Q73;



/////////////// Forward Tracing /////////////////

// Stage 1 alpha 
// [000]
always@(posedge Clk)
begin
   
    if (a00 > a01)
       begin
         a10<=a00+b0;
       end
    else if (a01 > a00)
       begin
        a10<=a01+b0;
       end   
    else if (a01 == a00)
       begin
        a10<=a01+b0; 
       end
end

// [001] 
always@(posedge Clk)
begin 
   
    if (a02 > a03)
       begin
        a11 <= a02+b1;
       end
    else if (a03 > a02)
       begin
        a11 <= a03+b1;
       end
    else if (a03 == a02)
      begin
       a11 <= a02+b1;
      end
end

// [010]
always@(posedge Clk)
begin
    
    if (a04 > a05)
      begin
       a12 <= a04+b2;
      end
      
    else if (a05 > a04)
      begin
       a12 <= a05+b2;
      end
    else if(a05 == a04)
      begin
       a12<= a04+b2;
      end
end

// [011]
always@(posedge Clk)
begin
    
    if (a06 > a07)
      begin
       a13 <= a06+b3;
      end
      
    else if (a07 > a06)
      begin
       a13 <= a07+b3;
      end
    else if(a07 == a06)
      begin
       a13<= a06+b3;
      end
end

// [100]
always@(posedge Clk)
begin
    
    if (a00 > a01)
      begin
       a14 <= a00+b4;
      end
      
    else if (a01 > a00)
      begin
       a14 <= a01+b4;
      end
    else if(a00 == a01)
      begin
       a14 <= a00+b4;
      end
end

// [101]
always@(posedge Clk)
begin
    
    if (a02 > a03)
      begin
       a15 <= a02+b5;
      end
      
    else if (a03 > a02)
      begin
       a15 <= a03+b5;
      end
    else if(a02 == a03)
      begin
       a15 <= a02+b5;
      end
end

// [110]
always@(posedge Clk)
begin
    
    if (a04 > a05)
      begin
       a16 <= a04+b6;
      end
      
    else if (a05 > a04)
      begin
       a16 <= a05+b6;
      end
    else if(a05 == a04)
      begin
       a16 <= a04+b6;
      end
end

// [111]
always@(posedge Clk)
begin
    
    if (a06 > a07)
      begin
       a17 <= a06+b7;
      end
      
    else if (a07 > a06)
      begin
       a17 <= a07+b7;
      end
    else if(a07 == a06)
      begin
       a17 <= a06+b7;
      end
end




// Stage 2 alpha 
// [000]
always@(posedge Clk)
begin
   
    if (a10 > a11)
       begin
         a20<=a10+b0;
       end
    else if (a11 > a10)
       begin
        a20<=a11+b0;
       end   
    else if (a11 == a10)
       begin
        a20<=a11+b0; 
       end
end

// [001] 
always@(posedge Clk)
begin 
   
    if (a12 > a13)
       begin
        a21 <= a12+b1;
       end
    else if (a13 > a12)
       begin
        a21 <= a13+b1;
       end
    else if (a13 == a12)
      begin
       a21 <= a12+b1;
      end
end

// [010]
always@(posedge Clk)
begin
    
    if (a14 > a15)
      begin
       a22 <= a14+b2;
      end
      
    else if (a15 > a14)
      begin
       a22 <= a15+b2;
      end
    else if(a15 == a14)
      begin
       a22<= a14+b2;
      end
end

// [011]
always@(posedge Clk)
begin
    
    if (a16 > a17)
      begin
       a23 <= a16+b3;
      end
      
    else if (a17 > a16)
      begin
       a23 <= a17+b3;
      end
    else if(a17 == a16)
      begin
       a23<= a16+b3;
      end
end

// [100]
always@(posedge Clk)
begin
    
    if (a10 > a11)
      begin
       a24 <= a10+b4;
      end
      
    else if (a11 > a10)
      begin
       a24 <= a11+b4;
      end
    else if(a10 == a11)
      begin
       a24 <= a10+b4;
      end
end

// [101]
always@(posedge Clk)
begin
    
    if (a12 > a13)
      begin
       a25 <= a12+b5;
      end
      
    else if (a13 > a12)
      begin
       a25 <= a13+b5;
      end
    else if(a12 == a13)
      begin
       a25 <= a12+b5;
      end
end

// [110]
always@(posedge Clk)
begin
    
    if (a14 > a15)
      begin
       a26 <= a14+b6;
      end
      
    else if (a15 > a14)
      begin
       a26 <= a15+b6;
      end
    else if(a15 == a14)
      begin
       a26 <= a14+b6;
      end
end

// [111]
always@(posedge Clk)
begin
    
    if (a16 > a17)
      begin
       a27 <= a16+b7;
      end
      
    else if (a17 > a16)
      begin
       a27 <= a17+b7;
      end
    else if(a17 == a16)
      begin
       a27 <= a16+b7;
      end
end




// Stage 3 alpha 
// [000]
always@(posedge Clk)
begin
   
    if (a20 > a21)
       begin
         a30<=a20+b0;
       end
    else if (a21 > a20)
       begin
        a30<=a21+b0;
       end   
    else if (a21 == a20)
       begin
        a30<=a21+b0; 
       end
end

// [001] 
always@(posedge Clk)
begin 
   
    if (a22 > a23)
       begin
        a31 <= a22+b1;
       end
    else if (a23 > a22)
       begin
        a31 <= a23+b1;
       end
    else if (a23 == a22)
      begin
       a31 <= a22+b1;
      end
end

// [010]
always@(posedge Clk)
begin
    
    if (a24 > a25)
      begin
       a32 <= a24+b2;
      end
      
    else if (a25 > a24)
      begin
       a32 <= a25+b2;
      end
    else if(a25 == a24)
      begin
       a32<= a24+b2;
      end
end

// [011]
always@(posedge Clk)
begin
    
    if (a26 > a27)
      begin
       a33 <= a26+b3;
      end
      
    else if (a27 > a26)
      begin
       a33 <= a27+b3;
      end
    else if(a27 == a26)
      begin
       a33<= a26+b3;
      end
end

// [100]
always@(posedge Clk)
begin
    
    if (a20 > a21)
      begin
       a34 <= a20+b4;
      end
      
    else if (a21 > a20)
      begin
       a34 <= a21+b4;
      end
    else if(a20 == a21)
      begin
       a34 <= a20+b4;
      end
end

// [101]
always@(posedge Clk)
begin
    
    if (a22 > a23)
      begin
       a35 <= a22+b5;
      end
      
    else if (a23 > a22)
      begin
       a35 <= a23+b5;
      end
    else if(a22 == a23)
      begin
       a35 <= a22+b5;
      end
end

// [110]
always@(posedge Clk)
begin
    
    if (a24 > a25)
      begin
       a36 <= a24+b6;
      end
      
    else if (a25 > a24)
      begin
       a36 <= a25+b6;
      end
    else if(a25 == a24)
      begin
       a36 <= a24+b6;
      end
end

// [111]
always@(posedge Clk)
begin
    
    if (a26 > a27)
      begin
       a37 <= a26+b7;
      end
      
    else if (a27 > a26)
      begin
       a37 <= a27+b7;
      end
    else if(a27 == a26)
      begin
       a37 <= a26+b7;
      end
end



// Stage 4 alpha 
// [000]
always@(posedge Clk)
begin
   
    if (a30 > a31)
       begin
         a40<=a30+b0;
       end
    else if (a31 > a30)
       begin
        a40<=a31+b0;
       end   
    else if (a31 == a30)
       begin
        a40<=a31+b0; 
       end
end

// [001] 
always@(posedge Clk)
begin 
   
    if (a32 > a33)
       begin
        a41 <= a32+b1;
       end
    else if (a33 > a32)
       begin
        a41 <= a33+b1;
       end
    else if (a33 == a32)
      begin
       a41 <= a32+b1;
      end
end

// [010]
always@(posedge Clk)
begin
    
    if (a34 > a35)
      begin
       a42 <= a34+b2;
      end
      
    else if (a35 > a34)
      begin
       a42 <= a35+b2;
      end
    else if(a35 == a34)
      begin
       a42<= a34+b2;
      end
end

// [011]
always@(posedge Clk)
begin
    
    if (a36 > a37)
      begin
       a43 <= a36+b3;
      end
      
    else if (a37 > a36)
      begin
       a43 <= a37+b3;
      end
    else if(a37 == a36)
      begin
       a43<= a36+b3;
      end
end

// [100]
always@(posedge Clk)
begin
    
    if (a30 > a31)
      begin
       a44 <= a30+b4;
      end
      
    else if (a31 > a30)
      begin
       a44 <= a31+b4;
      end
    else if(a30 == a31)
      begin
       a44 <= a30+b4;
      end
end

// [101]
always@(posedge Clk)
begin
    
    if (a32 > a33)
      begin
       a45 <= a32+b5;
      end
      
    else if (a33 > a32)
      begin
       a45 <= a33+b5;
      end
    else if(a32 == a33)
      begin
       a45 <= a32+b5;
      end
end

// [110]
always@(posedge Clk)
begin
    
    if (a34 > a35)
      begin
       a46 <= a34+b6;
      end
      
    else if (a35 > a34)
      begin
       a46 <= a35+b6;
      end
    else if(a35 == a34)
      begin
       a46 <= a34+b6;
      end
end

// [111]
always@(posedge Clk)
begin
    
    if (a36 > a37)
      begin
       a47 <= a36+b7;
      end
      
    else if (a37 > a36)
      begin
       a47 <= a37+b7;
      end
    else if(a37 == a36)
      begin
       a47 <= a36+b7;
      end
end




// Stage 5 alpha 
// [000]
always@(posedge Clk)
begin
   
    if (a40 > a41)
       begin
         a50<=a40+b0;
       end
    else if (a41 > a40)
       begin
        a50<=a41+b0;
       end   
    else if (a41 == a40)
       begin
        a50<=a41+b0; 
       end
end

// [001] 
always@(posedge Clk)
begin 
   
    if (a42 > a43)
       begin
        a51 <= a42+b1;
       end
    else if (a43 > a42)
       begin
        a51 <= a43+b1;
       end
    else if (a43 == a42)
      begin
       a51 <= a42+b1;
      end
end

// [010]
always@(posedge Clk)
begin
    
    if (a44 > a45)
      begin
       a52 <= a44+b2;
      end
      
    else if (a45 > a44)
      begin
       a52 <= a45+b2;
      end
    else if(a45 == a44)
      begin
       a52<= a44+b2;
      end
end

// [011]
always@(posedge Clk)
begin
    
    if (a46 > a47)
      begin
       a53 <= a46+b3;
      end
      
    else if (a47 > a46)
      begin
       a53 <= a47+b3;
      end
    else if(a47 == a46)
      begin
       a53<= a46+b3;
      end
end

// [100]
always@(posedge Clk)
begin
    
    if (a40 > a41)
      begin
       a54 <= a40+b4;
      end
      
    else if (a41 > a40)
      begin
       a54 <= a41+b4;
      end
    else if(a40 == a41)
      begin
       a54 <= a40+b4;
      end
end

// [101]
always@(posedge Clk)
begin
    
    if (a42 > a43)
      begin
       a55 <= a42+b5;
      end
      
    else if (a43 > a42)
      begin
       a55 <= a43+b5;
      end
    else if(a42 == a43)
      begin
       a55 <= a42+b5;
      end
end

// [110]
always@(posedge Clk)
begin
    
    if (a44 > a45)
      begin
       a56 <= a44+b6;
      end
      
    else if (a45 > a44)
      begin
       a56 <= a45+b6;
      end
    else if(a45 == a44)
      begin
       a56 <= a44+b6;
      end
end

// [111]
always@(posedge Clk)
begin
    
    if (a46 > a47)
      begin
       a57 <= a46+b7;
      end
      
    else if (a47 > a46)
      begin
       a57 <= a47+b7;
      end
    else if(a47 == a46)
      begin
       a57 <= a46+b7;
      end
end




// Stage 6 alpha 
// [000]
always@(posedge Clk)
begin
   
    if (a50 > a51)
       begin
         a60<=a50+b0;
       end
    else if (a51 > a50)
       begin
        a60<=a51+b0;
       end   
    else if (a51 == a50)
       begin
        a60<=a51+b0; 
       end
end

// [001] 
always@(posedge Clk)
begin 
   
    if (a52 > a53)
       begin
        a61 <= a52+b1;
       end
    else if (a53 > a52)
       begin
        a61 <= a53+b1;
       end
    else if (a53 == a52)
      begin
       a61 <= a52+b1;
      end
end

// [010]
always@(posedge Clk)
begin
    
    if (a54 > a55)
      begin
       a62 <= a54+b2;
      end
      
    else if (a55 > a54)
      begin
       a62 <= a55+b2;
      end
    else if(a55 == a54)
      begin
       a62<= a54+b2;
      end
end

// [011]
always@(posedge Clk)
begin
    
    if (a56 > a57)
      begin
       a63 <= a56+b3;
      end
      
    else if (a57 > a56)
      begin
       a63 <= a57+b3;
      end
    else if(a57 == a56)
      begin
       a63<= a56+b3;
      end
end

// [100]
always@(posedge Clk)
begin
    
    if (a50 > a51)
      begin
       a64 <= a50+b4;
      end
      
    else if (a51 > a50)
      begin
       a64 <= a51+b4;
      end
    else if(a50 == a51)
      begin
       a64 <= a50+b4;
      end
end

// [101]
always@(posedge Clk)
begin
    
    if (a52 > a53)
      begin
       a65 <= a52+b5;
      end
      
    else if (a53 > a52)
      begin
       a65 <= a53+b5;
      end
    else if(a52 == a53)
      begin
       a65 <= a52+b5;
      end
end

// [110]
always@(posedge Clk)
begin
    
    if (a54 > a55)
      begin
       a66 <= a54+b6;
      end
      
    else if (a55 > a54)
      begin
       a66 <= a55+b6;
      end
    else if(a55 == a54)
      begin
       a66 <= a54+b6;
      end
end

// [111]
always@(posedge Clk)
begin
    
    if (a56 > a57)
      begin
       a67 <= a56+b7;
      end
      
    else if (a57 > a56)
      begin
       a67 <= a57+b7;
      end
    else if(a57 == a56)
      begin
       a67 <= a56+b7;
      end
end



// Stage 7 alpha 
// [000]
always@(posedge Clk)
begin
   
    if (a60 > a61)
       begin
         a70<=a60+b0;
       end
    else if (a61 > a60)
       begin
        a70<=a61+b0;
       end   
    else if (a61 == a60)
       begin
        a70<=a61+b0; 
       end
end

// [001] 
always@(posedge Clk)
begin 
   
    if (a62 > a63)
       begin
        a71 <= a62+b1;
       end
    else if (a63 > a62)
       begin
        a71 <= a63+b1;
       end
    else if (a63 == a62)
      begin
       a71 <= a62+b1;
      end
end

// [010]
always@(posedge Clk)
begin
    
    if (a64 > a65)
      begin
       a72 <= a64+b2;
      end
      
    else if (a65 > a64)
      begin
       a72 <= a65+b2;
      end
    else if(a65 == a64)
      begin
       a72<= a64+b2;
      end
end

// [011]
always@(posedge Clk)
begin
    
    if (a66 > a67)
      begin
       a73 <= a66+b3;
      end
      
    else if (a67 > a66)
      begin
       a73 <= a67+b3;
      end
    else if(a67 == a66)
      begin
       a73<= a66+b3;
      end
end

// [100]
always@(posedge Clk)
begin
    
    if (a60 > a61)
      begin
       a74 <= a60+b4;
      end
      
    else if (a61 > a60)
      begin
       a74 <= a61+b4;
      end
    else if(a60 == a61)
      begin
       a74 <= a60+b4;
      end
end

// [101]
always@(posedge Clk)
begin
    
    if (a62 > a63)
      begin
       a75 <= a62+b5;
      end
      
    else if (a63 > a62)
      begin
       a75 <= a63+b5;
      end
    else if(a62 == a63)
      begin
       a75 <= a62+b5;
      end
end

// [110]
always@(posedge Clk)
begin
    
    if (a64 > a65)
      begin
       a76 <= a64+b6;
      end
      
    else if (a65 > a64)
      begin
       a76 <= a65+b6;
      end
    else if(a65 == a64)
      begin
       a76 <= a64+b6;
      end
end

// [111]
always@(posedge Clk)
begin
    
    if (a66 > a67)
      begin
       a77 <= a66+b7;
      end
      
    else if (a67 > a66)
      begin
       a77 <= a67+b7;
      end
    else if(a67 == a66)
      begin
       a77 <= a66+b7;
      end
end


// Stage 8 alpha 
// [000]
always@(posedge Clk)
begin
   
    if (a70 > a71)
       begin
         b00<=a70+b0;
       end
    else if (a71 > a70)
       begin
        b00<=a71+b0;
       end   
    else if (a71 == a70)
       begin
        b00<=a71+b0; 
       end
end

// [001] 
always@(posedge Clk)
begin 
   
    if (a72 > a73)
       begin
        b01 <= a72+b1;
       end
    else if (a73 > a72)
       begin
        b01 <= a73+b1;
       end
    else if (a73 == a72)
      begin
       b01 <= a72+b1;
      end
end

// [010]
always@(posedge Clk)
begin
    
    if (a74 > a75)
      begin
       b02 <= a74+b2;
      end
      
    else if (a75 > a74)
      begin
       b02 <= a75+b2;
      end
    else if(a75 == a74)
      begin
       b02<= a74+b2;
      end
end

// [011]
always@(posedge Clk)
begin
    
    if (a76 > a77)
      begin
       b03 <= a76+b3;
      end
      
    else if (a77 > a76)
      begin
       b03 <= a77+b3;
      end
    else if(a77 == a76)
      begin
       b03<= a76+b3;
      end
end

// [100]
always@(posedge Clk)
begin
    
    if (a70 > a71)
      begin
       b04 <= a70+b4;
      end
      
    else if (a71 > a70)
      begin
       b04 <= a71+b4;
      end
    else if(a70 == a71)
      begin
       b04 <= a70+b4;
      end
end

// [101]
always@(posedge Clk)
begin
    
    if (a72 > a73)
      begin
       b05 <= a72+b5;
      end
      
    else if (a73 > a72)
      begin
       b05 <= a73+b5;
      end
    else if(a72 == a73)
      begin
       b05 <= a72+b5;
      end
end

// [110]
always@(posedge Clk)
begin
    
    if (a74 > a75)
      begin
       b06 <= a74+b6;
      end
      
    else if (a75 > a74)
      begin
       b06 <= a75+b6;
      end
    else if(a75 == a74)
      begin
       b06 <= a74+b6;
      end
end

// [111]
always@(posedge Clk)
begin
    
    if (a76 > a77)
      begin
       b07 <= a76+b7;
      end
      
    else if (a77 > a76)
      begin
       b07 <= a77+b7;
      end
    else if(a77 == a76)
      begin
       b07 <= a76+b7;
      end
end



////////////////////////// Backward Tracing //////////////////////////////////////



// Stage 8 Beta
// [000]
always@(posedge Clk)
begin
   
    if (b00 > b04)
       begin
         b10<=b00+b0;
       end
    else if (b04 > b00)
       begin
        b10<=b04+b0;
       end   
    else if (b00 == b04)
       begin
        b10<=b00+b0; 
       end
end

// [001] 
always@(posedge Clk)
begin 
   
    if (b00 > b04)
       begin
        b11 <= b00+b1;
       end
    else if (b04 > b00)
       begin
        b11 <= b04+b1;
       end
    else if (b04 == b00)
      begin
       b11 <= b04+b1;
      end
end

// [010]
always@(posedge Clk)
begin
    
    if (b01 > b05)
      begin
       b12 <= b01+b2;
      end
      
    else if (b05 > b01)
      begin
       b12 <= b05+b2;
      end
    else if(b05 == b01)
      begin
       b12<= b05+b2;
      end
end

// [011]
always@(posedge Clk)
begin
    
    if (b01 > b05)
      begin
       b13 <= b01+b3;
      end
      
    else if (b05 > b01)
      begin
       b13 <= b05+b3;
      end
    else if(b05 == b01)
      begin
       b13 <= b05+b3;
      end
end

// [100]
always@(posedge Clk)
begin
    
    if (b02 > b06)
      begin
       b14 <= b02+b4;
      end
      
    else if (b06 > b02)
      begin
       b14 <= a06+b4;
      end
    else if(b06 == b02)
      begin
       b14 <= b06+b4;
      end
end

// [101]
always@(posedge Clk)
begin
    
    if (b02 > b06)
      begin
       b15 <= b02+b5;
      end
      
    else if (b06 > b02)
      begin
       b15 <= a06+b5;
      end
    else if(b06 == b02)
      begin
       b15 <= b06+b5;
      end
end

// [110]
always@(posedge Clk)
begin
    
    if (b03 > b07)
      begin
       b16 <= b03+b6;
      end
      
    else if (b07 > b03)
      begin
       b16 <= b07+b6;
      end
    else if(b07 == b03)
      begin
       b16 <= b07+b6;
      end
end

// [111]
always@(posedge Clk)
begin
    
    if (b03 > b07)
      begin
       b17 <= b03+b7;
      end
      
    else if (b07 > b03)
      begin
       b17 <= b07+b7;
      end
    else if(b07 == b03)
      begin
       b17 <= b07+b7;
      end
end


// Stage 7 Beta 
// [000]
always@(posedge Clk)
begin   
    if (b10 > b14)
       begin
         b20<=b10+b0;
       end
    else if (b14 > b10)
       begin
        b20<=b14+b0;
       end   
    else if (b10 == b14)
       begin
        b20<=b10+b0; 
       end
end

// [001] 
always@(posedge Clk)
begin    
    if (b10 > b14)
       begin
        b21 <= b10+b1;
       end
    else if (b14 > b10)
       begin
        b21 <= b14+b1;
       end
    else if (b14 == b10)
      begin
       b21 <= b14+b1;
      end
end

// [010]
always@(posedge Clk)
begin
    if (b11 > b15)
      begin
       b22 <= b11+b2;
      end     
    else if (b15 > b11)
      begin
       b22 <= b15+b2;
      end
    else if(b15 == b11)
      begin
       b22<= b15+b2;
      end
end

// [011]
always@(posedge Clk)
begin  
    if (b11 > b15)
      begin
       b23 <= b11+b3;
      end      
    else if (b15 > b11)
      begin
       b23 <= b15+b3;
      end
    else if(b15 == b11)
      begin
       b23 <= b15+b3;
      end
end

// [100]
always@(posedge Clk)
begin
    
    if (b12 > b16)
      begin
       b24 <= b12+b4;
      end
      
    else if (b16 > b12)
      begin
       b24 <= a16+b4;
      end
    else if(b16 == b12)
      begin
       b24 <= b16+b4;
      end
end

// [101]
always@(posedge Clk)
begin
    
    if (b12 > b16)
      begin
       b25 <= b12+b5;
      end
      
    else if (b16 > b12)
      begin
       b25 <= b16+b5;
      end
    else if(b16 == b12)
      begin
       b25 <= b16+b5;
      end
end

// [110]
always@(posedge Clk)
begin   
    if (b13 > b17)
      begin
       b26 <= b13+b6;
      end      
    else if (b17 > b13)
      begin
       b26 <= b17+b6;
      end
    else if(b17 == b13)
      begin
       b26 <= b17+b6;
      end
end

// [111]
always@(posedge Clk)
begin  
    if (b13 > b17)
      begin
       b27 <= b13+b7;
      end      
    else if (b17 > b13)
      begin
       b27 <= b17+b7;
      end
    else if(b17 == b13)
      begin
       b27 <= b17+b7;
      end
end



// Stage 6 Beta 
// [000]
always@(posedge Clk)
begin   
    if (b20 > b24)
       begin
         b30<=b20+b0;
       end
    else if (b24 > b20)
       begin
        b30<=b24+b0;
       end   
    else if (b20 == b24)
       begin
        b30<=b20+b0; 
       end
end

// [001] 
always@(posedge Clk)
begin    
    if (b20 > b24)
       begin
        b31 <= b20+b1;
       end
    else if (b24 > b20)
       begin
        b31 <= b24+b1;
       end
    else if (b24 == b20)
      begin
       b31 <= b24+b1;
      end
end

// [010]
always@(posedge Clk)
begin
    if (b21 > b25)
      begin
       b32 <= b21+b2;
      end
      
    else if (b25 > b21)
      begin
       b32 <= b25+b2;
      end
    else if(b25 == b21)
      begin
       b32<= b25+b2;
      end
end

// [011]
always@(posedge Clk)
begin  
    if (b21 > b25)
      begin
       b33 <= b21+b3;
      end
      
    else if (b25 > b21)
      begin
       b33 <= b25+b3;
      end
    else if(b25 == b21)
      begin
       b33 <= b25+b3;
      end
end

// [100]
always@(posedge Clk)
begin
    
    if (b22 > b26)
      begin
       b34 <= b22+b4;
      end
      
    else if (b26 > b22)
      begin
       b34 <= a26+b4;
      end
    else if(b26 == b22)
      begin
       b34 <= b26+b4;
      end
end

// [101]
always@(posedge Clk)
begin
    
    if (b22 > b26)
      begin
       b35 <= b22+b5;
      end
      
    else if (b26 > b22)
      begin
       b35 <= a26+b5;
      end
    else if(b26 == b22)
      begin
       b35 <= b26+b5;
      end
end

// [110]
always@(posedge Clk)
begin   
    if (b23 > b27)
      begin
       b36 <= b23+b6;
      end      
    else if (b27 > b23)
      begin
       b36 <= b27+b6;
      end
    else if(b27 == b23)
      begin
       b36 <= b27+b6;
      end
end

// [111]
always@(posedge Clk)
begin  
    if (b23 > b27)
      begin
       b37 <= b23+b7;
      end      
    else if (b27 > b23)
      begin
       b37 <= b27+b7;
      end
    else if(b27 == b23)
      begin
       b37 <= b27+b7;
      end
end



// Stage 5 Beta 
// [000]
always@(posedge Clk)
begin   
    if (b30 > b34)
       begin
         b40<=b30+b0;
       end
    else if (b34 > b30)
       begin
        b40<=b34+b0;
       end   
    else if (b30 == b34)
       begin
        b40<=b30+b0; 
       end
end

// [001] 
always@(posedge Clk)
begin    
    if (b30 > b34)
       begin
        b41 <= b30+b1;
       end
    else if (b34 > b30)
       begin
        b41 <= b34+b1;
       end
    else if (b34 == b30)
      begin
       b41 <= b34+b1;
      end
end

// [010]
always@(posedge Clk)
begin
    if (b31 > b35)
      begin
       b42 <= b31+b2;
      end
      
    else if (b35 > b31)
      begin
       b42 <= b35+b2;
      end
    else if(b35 == b31)
      begin
       b42<= b35+b2;
      end
end

// [011]
always@(posedge Clk)
begin  
    if (b31 > b35)
      begin
       b43 <= b31+b3;
      end
      
    else if (b35 > b31)
      begin
       b43 <= b35+b3;
      end
    else if(b35 == b31)
      begin
       b43 <= b35+b3;
      end
end

// [100]
always@(posedge Clk)
begin
    
    if (b32 > b36)
      begin
       b44 <= b32+b4;
      end
      
    else if (b36 > b32)
      begin
       b44 <= a36+b4;
      end
    else if(b36 == b32)
      begin
       b44 <= b36+b4;
      end
end

// [101]
always@(posedge Clk)
begin
    
    if (b32 > b36)
      begin
       b45 <= b32+b5;
      end
      
    else if (b36 > b32)
      begin
       b45 <= a36+b5;
      end
    else if(b36 == b32)
      begin
       b45 <= b36+b5;
      end
end

// [110]
always@(posedge Clk)
begin   
    if (b33 > b37)
      begin
       b46 <= b33+b6;
      end      
    else if (b37 > b33)
      begin
       b46 <= b37+b6;
      end
    else if(b37 == b33)
      begin
       b46 <= b37+b6;
      end
end

// [111]
always@(posedge Clk)
begin  
    if (b33 > b37)
      begin
       b47 <= b33+b7;
      end      
    else if (b37 > b33)
      begin
       b47 <= b37+b7;
      end
    else if(b37 == b33)
      begin
       b47 <= b37+b7;
      end
end




// Stage 4 Beta 
// [000]
always@(posedge Clk)
begin   
    if (b40 > b44)
       begin
         b50<=b40+b0;
       end
    else if (b44 > b40)
       begin
        b50<=b44+b0;
       end   
    else if (b40 == b44)
       begin
        b50<=b40+b0; 
       end
end

// [001] 
always@(posedge Clk)
begin    
    if (b40 > b44)
       begin
        b51 <= b40+b1;
       end
    else if (b44 > b40)
       begin
        b51 <= b44+b1;
       end
    else if (b44 == b40)
      begin
       b51 <= b44+b1;
      end
end

// [010]
always@(posedge Clk)
begin
    if (b41 > b45)
      begin
       b52 <= b41+b2;
      end
      
    else if (b45 > b41)
      begin
       b52 <= b45+b2;
      end
    else if(b45 == b41)
      begin
       b52<= b45+b2;
      end
end

// [011]
always@(posedge Clk)
begin  
    if (b41 > b45)
      begin
       b53 <= b41+b3;
      end
      
    else if (b45 > b41)
      begin
       b53 <= b45+b3;
      end
    else if(b45 == b41)
      begin
       b53 <= b45+b3;
      end
end

// [100]
always@(posedge Clk)
begin
    
    if (b42 > b46)
      begin
       b54 <= b42+b4;
      end
      
    else if (b46 > b42)
      begin
       b54 <= a46+b4;
      end
    else if(b46 == b42)
      begin
       b54 <= b46+b4;
      end
end

// [101]
always@(posedge Clk)
begin
    
    if (b42 > b46)
      begin
       b55 <= b42+b5;
      end
      
    else if (b46 > b42)
      begin
       b55 <= a46+b5;
      end
    else if(b46 == b42)
      begin
       b55 <= b46+b5;
      end
end

// [110]
always@(posedge Clk)
begin   
    if (b43 > b47)
      begin
       b56 <= b43+b6;
      end      
    else if (b47 > b43)
      begin
       b56 <= b47+b6;
      end
    else if(b47 == b43)
      begin
       b56 <= b47+b6;
      end
end

// [111]
always@(posedge Clk)
begin  
    if (b43 > b47)
      begin
       b57 <= b43+b7;
      end      
    else if (b47 > b43)
      begin
       b57 <= b47+b7;
      end
    else if(b47 == b43)
      begin
       b57 <= b47+b7;
      end
end



// Stage 3 Beta 
// [000]
always@(posedge Clk)
begin   
    if (b50 > b54)
       begin
         b60<=b50+b0;
       end
    else if (b54 > b50)
       begin
        b60<=b54+b0;
       end   
    else if (b50 == b54)
       begin
        b60<=b50+b0; 
       end
end

// [001] 
always@(posedge Clk)
begin    
    if (b50 > b54)
       begin
        b61 <= b50+b1;
       end
    else if (b54 > b50)
       begin
        b61 <= b54+b1;
       end
    else if (b54 == b50)
      begin
       b61 <= b54+b1;
      end
end

// [010]
always@(posedge Clk)
begin
    if (b51 > b55)
      begin
       b62 <= b51+b2;
      end
      
    else if (b55 > b51)
      begin
       b62 <= b55+b2;
      end
    else if(b55 == b51)
      begin
       b62<= b55+b2;
      end
end

// [011]
always@(posedge Clk)
begin  
    if (b51 > b55)
      begin
       b63 <= b51+b3;
      end
      
    else if (b55 > b51)
      begin
       b63 <= b55+b3;
      end
    else if(b55 == b51)
      begin
       b63 <= b55+b3;
      end
end

// [100]
always@(posedge Clk)
begin
    
    if (b52 > b56)
      begin
       b64 <= b52+b4;
      end
      
    else if (b56 > b52)
      begin
       b64 <= a56+b4;
      end
    else if(b56 == b52)
      begin
       b64 <= b56+b4;
      end
end

// [101]
always@(posedge Clk)
begin
    
    if (b52 > b56)
      begin
       b65 <= b52+b5;
      end
      
    else if (b56 > b52)
      begin
       b65 <= a56+b5;
      end
    else if(b56 == b52)
      begin
       b65 <= b56+b5;
      end
end

// [110]
always@(posedge Clk)
begin   
    if (b53 > b57)
      begin
       b66 <= b53+b6;
      end      
    else if (b57 > b53)
      begin
       b66 <= b57+b6;
      end
    else if(b57 == b53)
      begin
       b66 <= b57+b6;
      end
end

// [111]
always@(posedge Clk)
begin  
    if (b53 > b57)
      begin
       b67 <= b53+b7;
      end      
    else if (b57 > b53)
      begin
       b67 <= b57+b7;
      end
    else if(b57 == b53)
      begin
       b67 <= b57+b7;
      end
end



// Stage 2 Beta 
// [000]
always@(posedge Clk)
begin   
    if (b60 > b64)
       begin
         b70<=b60+b0;
       end
    else if (b64 > b60)
       begin
        b70<=b64+b0;
       end   
    else if (b60 == b64)
       begin
        b70<=b60+b0; 
       end
end

// [001] 
always@(posedge Clk)
begin    
    if (b60 > b64)
       begin
        b71 <= b60+b1;
       end
    else if (b64 > b60)
       begin
        b71 <= b64+b1;
       end
    else if (b64 == b60)
      begin
       b71 <= b64+b1;
      end
end

// [010]
always@(posedge Clk)
begin
    if (b61 > b65)
      begin
       b72 <= b61+b2;
      end      
    else if (b65 > b61)
      begin
       b72 <= b65+b2;
      end
    else if(b65 == b61)
      begin
       b72<= b65+b2;
      end
end

// [011]
always@(posedge Clk)
begin  
    if (b61 > b65)
      begin
       b73 <= b61+b3;
      end
      
    else if (b65 > b61)
      begin
       b73 <= b65+b3;
      end
    else if(b65 == b61)
      begin
       b73 <= b65+b3;
      end
end

// [100]
always@(posedge Clk)
begin
    
    if (b62 > b66)
      begin
       b74 <= b62+b4;
      end
      
    else if (b66 > b62)
      begin
       b74 <= a66+b4;
      end
    else if(b66 == b62)
      begin
       b74 <= b66+b4;
      end
end

// [101]
always@(posedge Clk)
begin
    
    if (b62 > b66)
      begin
       b75 <= b62+b5;
      end
      
    else if (b66 > b62)
      begin
       b75 <= a66+b5;
      end
    else if(b66 == b62)
      begin
       b75 <= b66+b5;
      end
end

// [110]
always@(posedge Clk)
begin   
    if (b63 > b67)
      begin
       b76 <= b63+b6;
      end      
    else if (b67 > b63)
      begin
       b76 <= b67+b6;
      end
    else if(b67 == b63)
      begin
       b76 <= b67+b6;
      end
end

// [111]
always@(posedge Clk)
begin  
    if (b63 > b67)
      begin
       b77 <= b63+b7;
      end      
    else if (b67 > b63)
      begin
       b77 <= b67+b7;
      end
    else if(b67 == b63)
      begin
       b77 <= b67+b7;
      end
end


// For eta n=a+b+b stage=1
always@(posedge Clk)
begin
 //Ck=0
 n001<=a00+b70+b0;
 n011<=a03+b71+b1;
 n021<=a04+b72+b2;
 n031<=a07+b73+b3;
 n041<=a01+b74+b4;
 n051<=a02+b75+b5;
 n061<=a05+b76+b6;
 n071<=a06+b77+b7;

 //Ck=1
 n101<=a01+b70+b0;
 n111<=a02+b71+b1;
 n121<=a05+b72+b2;
 n131<=a06+b73+b3;
 n141<=a00+b74+b4;
 n151<=a03+b75+b5;
 n161<=a04+b76+b6;
 n171<=a07+b77+b7;
end

// Max Lambda of stage 1 for Ck=0 & Ck=1
always@(posedge Clk)
begin
 L01 <=MAX(n001,n011,n021,n031,n041,n051,n061,n071);
 L11 <=MAX(n101,n111,n121,n131,n141,n151,n161,n171);
end


// For eta n=a+b+b stage 2
always@(posedge Clk)
begin
 //Ck=0
 n002<=a10+b60+b0;
 n012<=a13+b61+b1;
 n022<=a14+b62+b2;
 n032<=a17+b63+b3;
 n042<=a11+b64+b4;
 n052<=a12+b65+b5;
 n062<=a15+b66+b6;
 n072<=a16+b67+b7;
            
 //Ck=1     
 n102<=a11+b60+b0;
 n112<=a12+b61+b1;
 n122<=a15+b62+b2;
 n132<=a16+b63+b3;
 n142<=a10+b64+b4;
 n152<=a13+b65+b5;
 n162<=a14+b66+b6;
 n172<=a17+b67+b7;
end

// Max Lambda of stage 2 for Ck=0 & Ck=1
always@(posedge Clk)
begin
 L02 <=MAX(n002,n012,n022,n032,n042,n052,n062,n072);
 L12 <=MAX(n102,n112,n122,n132,n142,n152,n162,n172);
end


// For eta n=a+b+b stage 3
always@(posedge Clk)
begin
 //Ck=0
 n003<=a20+b50+b0;
 n013<=a23+b51+b1;
 n023<=a24+b52+b2;
 n033<=a27+b53+b3;
 n043<=a21+b54+b4;
 n053<=a22+b55+b5;
 n063<=a25+b56+b6;
 n073<=a26+b57+b7;
            
 //Ck=1     
 n103<=a21+b50+b0;
 n113<=a22+b51+b1;
 n123<=a25+b52+b2;
 n133<=a26+b53+b3;
 n143<=a20+b54+b4;
 n153<=a23+b55+b5;
 n163<=a24+b56+b6;
 n173<=a27+b57+b7;
end

// Max Lambda of stage 3 for Ck=0 & Ck=1
always@(posedge Clk)
begin
 L03 <=MAX(n003,n013,n023,n033,n043,n053,n063,n073);
 L13 <=MAX(n103,n113,n123,n133,n143,n153,n163,n173);
end


// For eta n=a+b+b stage 4
always@(posedge Clk)
begin
 //Ck=0
 n004<=a30+b40+b0;
 n014<=a33+b41+b1;
 n024<=a34+b42+b2;
 n034<=a37+b43+b3;
 n044<=a31+b44+b4;
 n054<=a32+b45+b5;
 n064<=a35+b46+b6;
 n074<=a36+b47+b7;
            
 //Ck=1     
 n104<=a31+b40+b0;
 n114<=a32+b41+b1;
 n124<=a35+b42+b2;
 n134<=a36+b43+b3;
 n144<=a30+b44+b4;
 n154<=a33+b45+b5;
 n164<=a34+b46+b6;
 n174<=a37+b47+b7;
end

// Max Lambda of stage 4 for Ck=0 & Ck=1
always@(posedge Clk)
begin
 L04 <=MAX(n004,n014,n024,n034,n044,n054,n064,n074);
 L14 <=MAX(n104,n114,n124,n134,n144,n154,n164,n174);
end


// For eta n=a+b+b stage 5
always@(posedge Clk)
begin
 //Ck=0
 n005<=a40+b30+b0;
 n015<=a43+b31+b1;
 n025<=a44+b32+b2;
 n035<=a47+b33+b3;
 n045<=a41+b34+b4;
 n055<=a42+b35+b5;
 n065<=a45+b36+b6;
 n075<=a46+b37+b7;
            
 //Ck=1     
 n105<=a41+b30+b0;
 n115<=a42+b31+b1;
 n125<=a45+b32+b2;
 n135<=a46+b33+b3;
 n145<=a40+b34+b4;
 n155<=a43+b35+b5;
 n165<=a44+b36+b6;
 n175<=a47+b37+b7;
end

// Max Lambda of stage 5 for Ck=0 & Ck=1
always@(posedge Clk)
begin
 L05 <=MAX(n005,n015,n025,n035,n045,n055,n065,n075);
 L15 <=MAX(n105,n115,n125,n135,n145,n155,n165,n175);
end



// For eta n=a+b+b stage 6
always@(posedge Clk)
begin
 //Ck=0
 n006<=a50+b20+b0;
 n016<=a53+b21+b1;
 n026<=a54+b22+b2;
 n036<=a57+b23+b3;
 n046<=a51+b24+b4;
 n056<=a52+b25+b5;
 n066<=a55+b26+b6;
 n076<=a56+b27+b7;
            
 //Ck=1     
 n106<=a51+b20+b0;
 n116<=a52+b21+b1;
 n126<=a55+b22+b2;
 n136<=a56+b23+b3;
 n146<=a50+b24+b4;
 n156<=a53+b25+b5;
 n166<=a54+b26+b6;
 n176<=a57+b27+b7;
end


// Max Lambda of stage 6 for Ck=0 & Ck=1
always@(posedge Clk)
begin
 L06 <=MAX(n006,n016,n026,n036,n046,n056,n066,n076);
 L16 <=MAX(n106,n116,n126,n136,n146,n156,n166,n176);
end


// For eta n=a+b+b stage 7
always@(posedge Clk)
begin
 //Ck=0
 n007<=a60+b10+b0;
 n017<=a63+b11+b1;
 n027<=a64+b12+b2;
 n037<=a67+b13+b3;
 n047<=a61+b14+b4;
 n057<=a62+b15+b5;
 n067<=a65+b16+b6;
 n077<=a66+b17+b7;
            
 //Ck=1     
 n107<=a61+b10+b0;
 n117<=a62+b11+b1;
 n127<=a65+b12+b2;
 n137<=a66+b13+b3;
 n147<=a60+b14+b4;
 n157<=a63+b15+b5;
 n167<=a64+b16+b6;
 n177<=a67+b17+b7;
end


// Max Lambda of stage 7 for Ck=0 & Ck=1
always@(posedge Clk)
begin
 L07 <=MAX(n007,n017,n027,n037,n047,n057,n067,n077);
 L17 <=MAX(n107,n117,n127,n137,n147,n157,n167,n177);
end


// For eta n=a+b+b stage 8
always@(posedge Clk)
begin
 //Ck=0
 n008<=a70+b00+b0;
 n018<=a73+b01+b1;
 n028<=a74+b02+b2;
 n038<=a77+b03+b3;
 n048<=a71+b04+b4;
 n058<=a72+b05+b5;
 n068<=a75+b06+b6;
 n078<=a76+b07+b7;
            
 //Ck=1     
 n108<=a71+b00+b0;
 n118<=a72+b01+b1;
 n128<=a75+b02+b2;
 n138<=a76+b03+b3;
 n148<=a70+b04+b4;
 n158<=a73+b05+b5;
 n168<=a74+b06+b6;
 n178<=a77+b07+b7;
end


// Max Lambda of stage 8 for Ck=0 & Ck=1
always@(posedge Clk)
begin
 L08 <=MAX(n008,n018,n028,n038,n048,n058,n068,n078);
 L18 <=MAX(n108,n118,n128,n138,n148,n158,n168,n178);
end


// Maximum function of 8 input
function [6:0] MAX;
         input [6:0] x0,x1,x2,x3,x4,x5,x6,x7;
         reg [6:0] y0,y1,y2,y3;
         reg [6:0] z0,z1;
        begin
             y0 = (x0>x1)?x0:x1;
             y1 = (x2>x3)?x2:x3;
             y2 = (x4>x5)?x4:x5;
             y3 = (x6>x7)?x6:x7;
             
             z0 = (y0>y1)?y0:y1;
             z1 = (y2>y3)?y2:y3;
             
            MAX = (z0>z1)?z0:z1;    
        end
endfunction


//Gamma g1 for stage 1 to 8
always@(posedge Clk)
begin
  g1<=L11-L01;
  g2<=L12-L02;
  g3<=L13-L03;
  g4<=L14-L04;
  g5<=L15-L05;
  g6<=L16-L06;
  g7<=L17-L07;
  g8<=L18-L08;
end


//Final output of Encoder
always@(posedge Clk)
begin
   D <= z03^z01^Ck^z02^z03;   
end
assign out = D;



endmodule

