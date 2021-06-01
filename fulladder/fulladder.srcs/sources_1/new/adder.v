`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/06 10:40:02
// Design Name: 
// Module Name: adder
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


module adder(
    input A,
    input B,
    input Cin,
    output S,
    output C
    );  
    wire S_A,C_A,C_B;
    half_adder HALF_ADDER_A(
            .A(A),
            .B(B),
            .S(S_A),
            .C(C_A)
            );
    half_adder HALF_ADDER_B(
            .A(Cin),
            .B(S_A),
            .S(S),
            .C(C_B)
            );
    assign C=C_A|C_B;  
endmodule
