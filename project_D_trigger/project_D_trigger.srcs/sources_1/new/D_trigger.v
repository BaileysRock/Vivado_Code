`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/26 15:45:53
// Design Name: 
// Module Name: D_trigger
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


module D_trigger(
    input clk,
    input rst_n,
    input set_n,
    input d,
    output q
    );
    reg qout;
    assign q=qout;
    
    always @ (posedge clk, negedge rst_n, negedge set_n) begin
        if (!rst_n) qout=0;
        else if (!set_n) qout=1;
        else qout=d;
    end
endmodule
