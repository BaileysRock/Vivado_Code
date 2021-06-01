`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/26 15:50:41
// Design Name: 
// Module Name: sim_D_trigger
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


module sim_D_trigger();
    reg clk;
    reg d;
    reg rst_n,set_n;
    always #10 clk=~clk;
    D_trigger D1(clk,rst_n,set_n,d,q);
    initial begin
        #15 clk=1;rst_n=1;set_n=1;d=1;
        #20 rst_n=0;set_n=1;d=1;
        #20 rst_n=1;set_n=0;d=1;
        #20 rst_n=1;set_n=1;d=0;
        #20 rst_n=1;set_n=1;d=1;
    end
    
endmodule
