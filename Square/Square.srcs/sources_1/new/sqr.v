`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.04.2024 12:38:37
// Design Name: 
// Module Name: sqr
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
            r = left + right;
        else    //subtract if r is positive
            r = left - right;
        q = {q[14:0],!r[17]};       
    end
    sqrt = q;   //final assignment of output.
end
endfunction 
/*
    initial begin
        sqr = sqrt(20'd33);    #100;
      
    end
*/    
endmodule



/*
module square_root (clk,num, sqrt);

input clk;
input [31:0] num;
output reg [31:0]sqrt;

reg [31:0] a;
reg [15:0] q;
reg [17:0] left,right,r; 


reg[31:0]i;



always@(posedge clk)
begin

a <= num;
q <= 0;
i <= 0;
left <= 0;   //input to adder/sub
right <= 0;  //input to adder/sub
r <= 0;  //remainder


for (i=0; i<16; i=i+1)
 begin
     right = {q,r[17],1'b1};
     left = {r[15:0],a[31:30]};
     a = {a[29:0],2'b00};    //left shift by 2 bits.
     
        if (r[17] == 1) //add if r is negative
          begin
            r = left + right;
          end
          
        else    //subtract if r is positive
          begin  
           r = left - right;
           q = {q[14:0],!r[17]};
          end
          
 sqrt = q;         
 end
 

  
end


endmodule



*/

/*

module square_root (input [31:0] num,output reg[31:0]sqr_root,output reg sqr_root_integer);

integer temp;
reg[31:0]i;

always@(*)
begin
sqr_root = 1'b0;
sqr_root_integer=1'b0;

for (i=0; i<(num/2); i=i+1)
 begin
  temp = i*i;
    if (temp == num) 
       begin
       sqr_root_integer = 1;
       sqr_root = i;
       end
 end
end
endmodule

*/