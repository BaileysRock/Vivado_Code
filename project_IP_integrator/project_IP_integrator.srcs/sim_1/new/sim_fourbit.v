`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/26 16:50:08
// Design Name: 
// Module Name: sim_fourbit
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


module sim_fourbit();
    reg clk;
    reg set_n,rst_n;
    wire[3:0] q;
    fourbit FOURBIT(clk,q[0],q[1],q[2],q[3],rst_n,set_n);
    always #10 clk=~clk;
    initial begin
        clk=1;set_n=0;rst_n=1;
        #20 set_n=1;
    end
endmodule
