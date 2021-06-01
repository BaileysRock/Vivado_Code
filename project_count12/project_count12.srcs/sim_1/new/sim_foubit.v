`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/26 14:28:02
// Design Name: 
// Module Name: sim_foubit
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


module sim_foubit();
    reg clk;
    parameter DELY=20;
    always #(DELY/2) clk=~clk;
    initial begin
        clk=1;
    end
    wire[3:0] q;
    fourbit FOURBIT(clk,q);
    
endmodule
