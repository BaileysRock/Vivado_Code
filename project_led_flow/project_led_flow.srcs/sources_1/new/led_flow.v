`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/25 22:01:24
// Design Name: 
// Module Name: led_flow
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


module ledwater(led,clk); //模块名ledwater

    output[7:0] led; //定义LED输出口
    input clk; //定义时钟输入口
    reg[7:0] led_r; //定义输出寄存器
    
    always @(posedge clk) //过程
    begin
        led_r <= led_r << 1; //是，则输出左移一位
        if(led_r == 8'b10000000) //循环完毕吗？
            led_r <= 8'b00000001; //是，则重新赋初值
    end
    
    assign led = led_r[7:0]; //寄存器输出
    
    initial 
    begin
        led_r=8'b00000001;
    end
endmodule
//module ledwater(led,clk); //模块名ledwater
//output[7:0] led; //定义LED输出口
//input clk; //定义时钟输入口
//reg[8:0] led_r; //定义输出寄存器

//always @(posedge clk) //过程
//begin
//led_r <= led_r << 1; //是，则输出左移一位
//if(led_r == 9'd0) //循环完毕吗？
//led_r <= 9'b111111111; //是，则重新赋初值
//end

//assign led = led_r[7:0]; //寄存器输出
//initial begin
//led_r <= 9'b111111111;
//end
//endmodule