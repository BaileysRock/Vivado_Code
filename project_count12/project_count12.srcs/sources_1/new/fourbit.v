`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/26 14:18:02
// Design Name: 
// Module Name: fourbit
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


module fourbit(
    input clk,
    output[3:0] q
    );
    reg[3:0] qout;
    initial begin
        qout=4'b0001;
    end
    always @(posedge clk)
        begin
            qout=qout<<1;
            if(qout==4'b0000) qout=4'b0001;
        end
    assign q=qout;
endmodule
