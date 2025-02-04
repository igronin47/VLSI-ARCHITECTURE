`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.04.2024 10:41:27
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

module matrix(clk,Y1,Y2,Y3,Y4,Emax);
input clk;
output reg [4:0]Y1;
output reg [4:0]Y2;
output reg [4:0]Y3;
output reg [4:0]Y4;
reg [8:4]C1=1;
reg [8:4]C2=1;
reg [8:4]C3=1;
reg [8:4]C4=1;
output [4:0]Emax;

reg [4:0] A1 [0:3];
reg [4:0] A2 [0:3];
reg [4:0] A3 [0:3];
reg [4:0] A4 [0:3];



reg [4:0]Z1;
reg [4:0]X1;
reg [4:0]Z2;
reg [4:0]X2;
reg [4:0]W;
reg [4:0]W1;


reg [3:0]N1=4'd0;
reg [3:0]D1=4'd0;
wire [3:0]Q1;
wire [3:0]R11;

reg [3:0]N2=4'd0;
reg [3:0]D2=4'd0;
wire [3:0]Q2;
wire [3:0]R22;

reg [3:0]N3=4'd0;
reg [3:0]D3=4'd0;
wire [3:0]Q3;
wire [3:0]R33;

reg [3:0]N4=4'd0;
reg [3:0]D4=4'd0;
wire [3:0]Q4;
wire [3:0]R44;


initial
begin
$readmemb("x0.mem", A1);
$readmemb("x1.mem", A2);
$readmemb("x2.mem", A3);
$readmemb("x3.mem", A4);
//C2=5'b00001;
//C1=5'b00001;
//C3=5'b00001;
//C4=5'b00001;
end
always@(posedge clk)
begin
Y1<=A1[0]*C1 + A2[0]*C2 + A3[0]*C3 + A4[0]*C4;
Y2<=A1[1]*C1 + A2[1]*C2 + A3[1]*C3 + A4[1]*C4;
Y3<=A1[2]*C1 + A2[2]*C2 + A3[2]*C3 + A4[2]*C4;
Y4<=A1[3]*C1 + A2[3]*C2 + A3[3]*C3 + A4[3]*C4;
end

always@(Y1,Y2,Y3,Y4)
begin
   begin
   if (Y1 > Y2)
     begin 
      X1 <= Y1;
     end
   
   else if (Y2 > Y1)
      begin  
       X1<=Y2;
      end
      
   else if (Y1 == Y2)
       begin
        X1<=Y1; 
       end
    end 
    begin
   if (Y3 > Y4)
     begin 
      X2 <= Y3;
     end
   
   else if (Y4 > Y3)
      begin  
       X2<=Y4;
      end
      
   else if (Y3 == Y4)
       begin
        X2<=Y3; 
       end
end  
end


 
 always@(X1 & X2)
 begin
 W<=X1-X2;
   if (W[4]==1)
     begin
      W1<=X2;
     end   
   else
     begin
      W1<=X1;
     end
 end
 
 
 //C1

always@(W1)
begin
   if(Y1==W1)
      begin
        C1<=5'd1;
      end
   
    else if(Y1[4:3]==0)
       begin
         N1<=Y1[2:0];
         D1<=W1;
       end
       
     else
       begin
         C1<= Y1/W1;
       end
end

always@(N1 & D1)
begin
   C1<={Q1,R11[3]};
end
RestoreDV DD(N1,D1,Q1,R11);



//C2
always@(W1)
begin
   if(Y2==W1)
      begin
        C2<=5'd1;
      end
   
    else if(Y2[4:3]==0)
       begin
         N2<=Y2[3:0];
         D2<=W1;
       end
       
     else
       begin
         C2<= Y2/W1;
       end
end

always@(N2 & D2)
begin
   C2<={Q2,R22[3]};
end
RestoreDV DE(N2,D2,Q2,R22);


//C3
always@(W1)
begin
   if(Y3==W1)
      begin
        C3<=5'd1;
      end
   
    else if(Y3[4:3]==0)
       begin
         N3<=Y3[3:0];
         D3<=W1;
       end
       
     else
       begin
         C3<= Y3/W1;
       end
end

always@(N3 & D3)
begin
   C3<={Q3,R33[3]};
end
RestoreDV DF(N3,D3,Q3,R33);


//C4
always@(W1)
begin
   if(Y4==W1)
      begin
        C4<=5'd1;
      end
   
    else if(Y4[4:3]==0)
       begin
         N4<=Y4[3:0];
         D4<=W1;
       end
       
     else
       begin
         C4<= Y4/W1;
       end
end

always@(N4 & D4)
begin
   C4<={Q4,R44[3]};
end
RestoreDV DG(N4,D4,Q4,R44);


assign Emax=W1;
endmodule

