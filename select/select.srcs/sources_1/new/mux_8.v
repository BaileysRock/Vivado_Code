`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/05 23:34:33
// Design Name: 
// Module Name: mux_8
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


module mux_8(A,B,C,Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7,Out);
    input A,B,C;
    input Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7;
    output Out;
    reg Out;
    always@(A or B or C or Y0 or Y1 or Y2 or Y3 or Y4 or Y5 or Y6 or Y7)
    begin
        case({A,B,C})
        3'b000:Out=Y0;
        3'b001:Out=Y1;
        3'b010:Out=Y2;
        3'b011:Out=Y3;
        3'b100:Out=Y4;
        3'b101:Out=Y5;
        3'b110:Out=Y6;
        3'b111:Out=Y7;
        endcase
    end 
endmodule
