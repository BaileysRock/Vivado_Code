`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/26 13:08:43
// Design Name: 
// Module Name: sim_count12
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


module sim_count12();
    reg clk;
    parameter DELY=20;
    always #(DELY/2) clk=~clk;
    
    reg rst_n;
    wire[3:0] q;
    count12 COUNT12(clk,rst_n,q);
    initial begin
        clk=0;
        rst_n=0;
        #DELY rst_n=1;
    end
endmodule
