`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/26 23:38:35
// Design Name: 
// Module Name: sim_Light
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


module sim_Light();
    reg clk;
    wire [7:0] led;
    lsd u1(clk, led);
    initial clk = 0;
    always #10 clk = ~clk;
endmodule
