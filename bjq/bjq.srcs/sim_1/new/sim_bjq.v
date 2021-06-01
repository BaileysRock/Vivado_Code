`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/05 17:22:11
// Design Name: 
// Module Name: sim_bjq
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


module sim_bjq( );
    reg A, B, C;
    wire Out;
    bjq u1(A, B, C, Out);
    initial
        begin
            A = 0; B = 0; C = 0;
        end
    always #10 {A, B, C} = {A, B, C} + 1; 
endmodule
