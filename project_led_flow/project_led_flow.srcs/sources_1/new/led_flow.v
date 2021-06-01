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


module ledwater(led,clk); //ģ����ledwater

    output[7:0] led; //����LED�����
    input clk; //����ʱ�������
    reg[7:0] led_r; //��������Ĵ���
    
    always @(posedge clk) //����
    begin
        led_r <= led_r << 1; //�ǣ����������һλ
        if(led_r == 8'b10000000) //ѭ�������
            led_r <= 8'b00000001; //�ǣ������¸���ֵ
    end
    
    assign led = led_r[7:0]; //�Ĵ������
    
    initial 
    begin
        led_r=8'b00000001;
    end
endmodule
//module ledwater(led,clk); //ģ����ledwater
//output[7:0] led; //����LED�����
//input clk; //����ʱ�������
//reg[8:0] led_r; //��������Ĵ���

//always @(posedge clk) //����
//begin
//led_r <= led_r << 1; //�ǣ����������һλ
//if(led_r == 9'd0) //ѭ�������
//led_r <= 9'b111111111; //�ǣ������¸���ֵ
//end

//assign led = led_r[7:0]; //�Ĵ������
//initial begin
//led_r <= 9'b111111111;
//end
//endmodule