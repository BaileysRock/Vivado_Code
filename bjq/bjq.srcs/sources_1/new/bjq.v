`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/05 17:17:20
// Design Name: 
// Module Name: bjq
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


module bjq(
    input A,
    input B,
    input C,
    output Out
    );
    reg Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7;
    initial
        begin
            Y0 = 0; Y1 = 0; Y2 = 0; Y3 = 1; Y4 = 0; Y5 = 1; Y6 = 1; Y7 = 1;
        end
    mux_8 m1(A, B, C, Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7, Out);
endmodule
