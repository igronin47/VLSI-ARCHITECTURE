`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: IIT MANDI
// Engineer: AMIT SINGH
// 
// Create Date: 25.04.2024 11:01:08
// Design Name: Mixed Style
// Module Name: matrix
// Project Name: Eigenvalue of Complex Matrix
// Target Devices: Zybo Z7
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


module matrix(clk,Emax);
input clk;
reg [31:0]Y1;
reg [31:0]Y2;
reg [31:0]Y3;
reg [31:0]Y4;

reg [15:0]Y11;
reg [15:0]Y22;
reg [15:0]Y33;
reg [15:0]Y44;

reg [7:0]C1=8'b01000000;
reg [7:0]C2=8'b01000000;
reg [7:0]C3=8'b01000000;
reg [7:0]C4=8'b01000000;
output [20:0]Emax;
//output [32:0]Emax1;
/*
ila_0 uut(
clk,


Emax
);
*/

reg [15:0] sqr;

reg [15:0]X1;

reg [15:0]X2;
reg [15:0]W;
reg [15:0]W1;


reg [15:0] A10=16'b0000001000000001;
reg [15:0] A11=16'b0000001000000001;
reg [15:0] A12=16'b0000010100000110;
reg [15:0] A13=16'b0000011000000110;
                
reg [15:0] A20=16'b0000001000000011;
reg [15:0] A21=16'b0000001100000010;
reg [15:0] A22=16'b0000011000000111;
reg [15:0] A23=16'b0000100000000111;
                
reg [15:0] A30=16'b0000001100000100;
reg [15:0] A31=16'b0000010000000011;
reg [15:0] A32=16'b0000011100001000;
reg [15:0] A33=16'b0000011100000110;
                
reg [15:0] A40=16'b0000010000000101;
reg [15:0] A41=16'b0000010100000100;
reg [15:0] A42=16'b0000100000001001;
reg [15:0] A43=16'b0000011000000101;


//A10=16'b0000001000000001;
//A20=16'b0000011100000110;
//A30=16'b0000010100000110;
//A40=16'b0000001100000110;

//A13=16'b0000011000000110;
//A23=16'b0000001100000101;
//A33=16'b0000011100000110;
//A43=16'b0000011100000101;

always@(posedge clk)
begin
Y1<=((A10[15:8]*C1 + A20[15:8]*C2 + A30[15:8]*C3 + A40[15:8]*C4)*(A10[15:8]*C1 + A20[15:8]*C2 + A30[15:8]*C3 + A40[15:8]*C4)) + ((A10[7:0]*C1 + A20[7:0]*C2 + A30[7:0]*C3 + A40[7:0]*C4)*(A10[7:0]*C1 + A20[7:0]*C2 + A30[7:0]*C3 + A40[7:0]*C4));
Y2<=((A11[15:8]*C1 + A21[15:8]*C2 + A31[15:8]*C3 + A41[15:8]*C4)*(A11[15:8]*C1 + A21[15:8]*C2 + A31[15:8]*C3 + A41[15:8]*C4)) + ((A11[7:0]*C1 + A21[7:0]*C2 + A31[7:0]*C3 + A41[7:0]*C4)*(A11[7:0]*C1 + A21[7:0]*C2 + A31[7:0]*C3 + A41[7:0]*C4));
Y3<=((A12[15:8]*C1 + A22[15:8]*C2 + A32[15:8]*C3 + A42[15:8]*C4)*(A12[15:8]*C1 + A22[15:8]*C2 + A32[15:8]*C3 + A42[15:8]*C4)) + ((A12[7:0]*C1 + A22[7:0]*C2 + A32[7:0]*C3 + A42[7:0]*C4)*(A12[7:0]*C1 + A22[7:0]*C2 + A32[7:0]*C3 + A42[7:0]*C4));
Y4<=((A13[15:8]*C1 + A23[15:8]*C2 + A33[15:8]*C3 + A43[15:8]*C4)*(A13[15:8]*C1 + A23[15:8]*C2 + A33[15:8]*C3 + A43[15:8]*C4)) + ((A13[7:0]*C1 + A23[7:0]*C2 + A33[7:0]*C3 + A43[7:0]*C4)*(A13[7:0]*C1 + A23[7:0]*C2 + A33[7:0]*C3 + A43[7:0]*C4));
end


function [15:0] sqrt;
    input [27:0] num;  
    reg [31:0] a;
    reg [15:0] q;
    reg [17:0] left,right,r;    
    integer i;
begin
   
    a = {num,4'b0000};
    q = 0;
    i = 0;
    left = 0;   
    right = 0;  
    r = 0;  
    
    for(i=0;i<16;i=i+1) begin 
        right = {q,r[17],1'b1};
        left = {r[15:0],a[31:30]};
        a = {a[29:0],2'b00};    //left shift by 2 bits.
        if (r[17] == 1) //add if r is negative
            r = left + right;
        else    //subtract if r is positive
            r = left - right;
        q = {q[14:0],!r[17]};       
    end
    sqrt = q;   
end
endfunction 

always@(Y1)
begin
Y11 = sqrt(Y1);
end


always@(Y2)
begin
Y22 = sqrt(Y2);
end


always@(Y3)
begin
Y33 = sqrt(Y3);
end


always@(Y4)
begin
Y44 = sqrt(Y4);
end



always@(Y11,Y22,Y33,Y44)
begin
   begin
   if (Y11 > Y22)
     begin 
      X1 <= Y11;
     end
   
   else if (Y22 > Y11)
      begin  
       X1<=Y22;
      end
     
   else if (Y11 == Y22)
       begin
        X1<=Y22; 
       end
    end 
    begin
   if (Y33 > Y44)
     begin 
      X2 <= Y33;
     end
  
   else if (Y44 > Y33)
      begin  
       X2<=Y44;
      end
      
   else if (Y33 == Y44)
       begin
        X2<=Y33; 
       end
end  
end


 
 always@(X1 & X2)
 begin
 W<=X1-X2;
   if (W[15]==1)
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

C1<={Y11,6'b000000}/(W1);

end



//C2

always@(W1)
begin

C2<={Y22,6'b000000}/(W1);

end




//C3

always@(W1)
begin

C3<={Y33,6'b000000}/(W1);

end




//C4

always@(W1)
begin

C4<={Y44,6'b000000}/(W1);

end




assign Emax=W1;
//assign Emax1=Y11;
endmodule


/*
module squareroot;

reg [15:0] sqr;

function [15:0] sqrt;
    input [19:0] num;  
    reg [31:0] a;
    reg [15:0] q;
    reg [17:0] left,right,r;    
    integer i;
begin
   
    a = {num,12'b000000000000};
    q = 0;
    i = 0;
    left = 0;   //input to adder/sub
    right = 0;  //input to adder/sub
    r = 0;  //remainder
    
    for(i=0;i<16;i=i+1) begin 
        right = {q,r[17],1'b1};
        left = {r[15:0],a[31:30]};
        a = {a[29:0],2'b00};    //left shift by 2 bits.
        if (r[17] == 1) //add if r is negative
            r = left + right;ht
        else    //subtract if r is positive
            r = left - right;
        q = {q[14:0],!r[17]};       
    end
    sqrt = q;   //final assignment of output.
end
endfunction 

    initial begin
        sqr = sqrt(27'd23);    #100;
      
    end
      
endmodule
*/




/*
module matrix(clk,Emax);
input clk;
reg [20:0]Y1;
reg [20:0]Y2;
reg [20:0]Y3;
reg [20:0]Y4;
reg [12:0]C1=13'b010000000000;
reg [12:0]C2=13'b010000000000;
reg [12:0]C3=13'b010000000000;
reg [12:0]C4=13'b010000000000;
output [20:0]Emax;

reg [20:0]X1;

reg [20:0]X2;
reg [20:0]W;
reg [20:0]W1;


reg [7:0] A10=8'd57;
reg [7:0] A11=8'd21;
reg [7:0] A12=8'd18;
reg [7:0] A13=8'd11;

reg [7:0] A20=8'd29;
reg [7:0] A21=8'd23;
reg [7:0] A22=8'd19;
reg [7:0] A23=8'd9;

reg [7:0] A30=8'd11;
reg [7:0] A31=8'd21;
reg [7:0] A32=8'd29;
reg [7:0] A33=8'd27;

reg [7:0] A40=8'd9;
reg [7:0] A41=8'd23;
reg [7:0] A42=8'd21;
reg [7:0] A43=8'd25;


always@(posedge clk)
begin
Y1<=A10*C1 + A20*C2 + A30*C3 + A40*C4;
Y2<=A11*C1 + A21*C2 + A31*C3 + A41*C4;
Y3<=A12*C1 + A22*C2 + A32*C3 + A42*C4;
Y4<=A13*C1 + A23*C2 + A33*C3 + A43*C4;
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

C1<={Y1,11'b00000000000}/(W1);

end



//C2

always@(W1)
begin

C2<={Y2,11'b00000000000}/(W1);

end




//C3

always@(W1)
begin

C3<={Y3,11'b00000000000}/(W1);

end



//C4

always@(W1)
begin

C4<={Y4,11'b00000000000}/(W1);

end



assign Emax=W1;
endmodule

*/

