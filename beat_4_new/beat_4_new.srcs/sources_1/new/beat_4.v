`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/28 14:18:45
// Design Name: 
// Module Name: beat_4
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


module beat_4(
    input clk,
    input rst,
    input st,
    output q0,
    output q1,
    output q2,
    output q3
    );
    reg d0, d1, d2, d3;
    always @(q3, q2, q1, q0)
        begin
            d0 = q1;
            d1 = q2;
            d2 = q3;
            d3 = (~q3) & (~q2) & (~q1);
        end
    d u3(clk, rst, st, d3, q3);
    d u2(clk, rst, st, d2, q2);
    d u1(clk, rst, st, d1, q1);
    d u0(clk, rst, st, d0, q0);
endmodule
