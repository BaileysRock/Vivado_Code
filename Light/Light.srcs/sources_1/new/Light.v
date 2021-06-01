`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/26 23:41:59
// Design Name: 
// Module Name: Light
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


module Light(clk, led);
        input clk;
    output [7:0] led;
    reg [7:0] ledtemp = 8'b00000001;
    reg [31:0] div_cnt = 0;
    reg divclk = 0;
    assign led = ledtemp;
    
    always @(posedge clk)
    begin
        if(div_cnt == 12500000)
            begin
                divclk = ~divclk;
                div_cnt = 0;
            end
        else
            begin
                div_cnt = div_cnt + 1'b1;
            end
        end
    
    always @(posedge divclk)
        begin
            if(ledtemp[7] == 1)
                ledtemp = 8'b00000001;
            else
                ledtemp = ledtemp << 1;
        end
endmodule
