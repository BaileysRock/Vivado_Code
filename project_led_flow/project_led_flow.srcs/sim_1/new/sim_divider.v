`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/25 21:52:37
// Design Name: 
// Module Name: sim_divider
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


//tb
 module sim_divider();
    reg clk;
    reg rst_n;
    wire clk_div;
    parameter DELY=100;
    divider U_divider(.clk(clk),
                      .rst_n(rst_n),
                      .clk_div(clk_div));
    always #(DELY/2) clk=~clk;//产生时钟波形
    initial begin
        clk=0;rst_n=0;
        #DELY rst_n=1;
        #((DELY*20)) $finish;
    end
endmodule
