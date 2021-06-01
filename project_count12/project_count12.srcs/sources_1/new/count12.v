`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/26 12:56:46
// Design Name: 
// Module Name: count12
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


module count12(
    input clk,
    input rst_n,
    output[3:0] q
    );
    wire[3:0] w;
    wire clr_n=((~(w[2]&w[3]))&rst_n);
    jk JK0(clk,clr_n,1,1,1,w[0]);
    jk JK1(w[0],clr_n,1,1,1,w[1]);
    jk JK2(w[1]&w[0],clr_n,1,1,1,w[2]);
    jk JK3(w[2]&w[1]&w[0],clr_n,1,1,1,w[3]);
    assign q=w;
endmodule
