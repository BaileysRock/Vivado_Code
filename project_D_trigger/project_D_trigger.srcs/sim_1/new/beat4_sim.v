`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/28 14:19:52
// Design Name: 
// Module Name: beat_4_sim
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


module beat4_sim();
    reg clk, rst, st;
    wire q3, q2, q1, q0;
    initial
        begin
            clk = 0; rst = 0; st = 1;
        end
    always #10 clk = ~clk;
    initial
        begin
            #20 begin
                    rst = 1; st = 0;
                end
            #20 begin
                    rst = 1; st = 1;
                end
        end
    beat_4 u1(clk, rst, st, q0, q1, q2, q3);
endmodule
