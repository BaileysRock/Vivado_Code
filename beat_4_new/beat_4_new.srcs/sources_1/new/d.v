`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/28 14:17:45
// Design Name: 
// Module Name: d
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


module d(
    input clk,
    input rst,
    input st,
    input d,
    output q
    );
    reg q;
    always @(posedge clk or !rst or !st)
        begin
            if (rst == 0) q = 0;
            else if (st == 0) q = 1;
            else
                begin
                    case ({d})
                        1'b0: q = 0;
                        1'b1: q = 1;
                        default: q = 0;
                    endcase
                end
        end
endmodule
