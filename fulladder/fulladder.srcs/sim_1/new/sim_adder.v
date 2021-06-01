`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/06 10:56:11
// Design Name: 
// Module Name: sim_adder
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


module sim_adder( );
    reg A,B,Cin;
    wire S,C;
    adder u1(A,B,Cin,S,C);
    initial
        begin
            A=0;B=0;Cin=0;
        end
    always #10 {A,B,Cin}={A,B,Cin}+1;
endmodule
