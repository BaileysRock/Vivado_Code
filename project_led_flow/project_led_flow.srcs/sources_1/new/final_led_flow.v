`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/25 22:59:39
// Design Name: 
// Module Name: final_led_flow
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


module final_led_flow(
    led,clk
    );
    output[7:0] led; //定义LED输出口
    input clk; //定义时钟输入口
    wire clk_div;
    reg rst_n;
    divider U_divider(.clk(clk),
                      .rst_n(rst_n),
                      .clk_div(clk_div));
    ledwater U_ledwater(.led(led),.clk(clk_div));
    initial begin
        rst_n=1;
    end
endmodule
