`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/26 12:45:04
// Design Name: 
// Module Name: sim_jk
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


module sim_jk();
    reg clk;
    reg rst,set,j,k;
    wire q;
    parameter DELY=20;
    jk JK1(clk,rst,set,j,k,q);
    initial begin
        #(DELY/4) clk=1;
        #DELY rst=0;set=1;j=0;k=0;
        #DELY rst=1;set=0;j=0;k=0;
        #DELY rst=1;set=1;j=0;k=1;
        #DELY rst=1;set=1;j=1;k=0;
        #DELY rst=1;set=1;j=0;k=0;
    end
    always #(DELY/2) clk=~clk;
endmodule
