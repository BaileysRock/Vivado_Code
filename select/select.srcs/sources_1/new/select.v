`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/06 02:03:36
// Design Name: 
// Module Name: select
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



module select(A,B,C,Out);
    input A,B,C;
    output Out;
    reg Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7;
    initial
        begin
            Y0=0;Y1=0;Y2=0;Y3=1;Y4=0;Y5=1;Y6=1;Y7=1;
        end
    mux_8 u1(A,B,C,Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7,Out);
endmodule
