`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/26 11:48:55
// Design Name: 
// Module Name: jk
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


module jk(
    input clk_n,
    input rst_n,
    input set_n,
    input j,
    input k,
    output qout
    );
    reg q;
    assign qout=q;
    always @(negedge clk_n or negedge rst_n or negedge set_n)
        if (!rst_n) q<=0;
        else if (!set_n) q<=1;
        else begin
            case ({j,k})
                2'b00:q<=q;
                2'b01:q<=0;
                2'b10:q<=1;
                2'b11:q<=~q;
            endcase
        end 
endmodule
