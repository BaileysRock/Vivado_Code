`timescale 1ns / 1ps

module digital_output(
    input [3:0] Number_1to4,        // 用于控制数码管前四位。每次只控制1个灯，通过快速交替控制4个灯
    input [3:0] Number_5to8,        // 用于控制数码管后四位。每次只控制1个灯，通过快速交替控制4个灯
    input [7:0] Number_Bit,         // 赋值给Led_Bit，8位控制8个数码管
    output reg [7:0] Led_Bit,    // 8位控制8个数码管
    output reg [6:0] Led_character_1to4,   // 用于控制数码管前四位。每次只控制1个灯，通过快速交替控制4个灯
    output reg [6:0] Led_character_4to8   // 用于控制数码管后四位。每次只控制1个灯，通过快速交替控制4个灯
);


function [6:0] digital;         // digital为七段数码管显示字符
input reg [3:0] num;
begin
    if(num == 4'd0)
        begin
            digital = 7'b1110111;   // 0
        end
    if(num == 4'd1)
        begin
            digital = 7'b0010010;   // 1
        end
    if(num == 4'd2)
        begin
            digital = 7'b1011101;   // 2
        end
    if(num == 4'd3)
        begin
            digital = 7'b1011011;   // 3
        end
    if(num == 4'd4)
        begin
            digital = 7'b0111010;   // 4
        end
    if(num == 4'd5)
        begin
            digital = 7'b1101011;   // 5
        end
    if(num == 4'd6)
        begin
            digital = 7'b1101111;   // 6
        end
    if(num == 4'd7)
        begin
            digital = 7'b1010010;   // 7
        end
    if(num == 4'd8)
        begin
            digital = 7'b1111111;   // 8
        end
    if(num == 4'd9)
        begin
            digital = 7'b1111011;   // 9
        end
    if(num == 4'd10)
        begin
            digital = 7'b0110111;   // U
        end
    if(num == 4'd11)
        begin
            digital = 7'b1110110;   // N
        end
    if(num == 4'd12)
        begin
            digital = 7'b1101100;   // F
        end
    if(num == 4'd13)
        begin
            digital = 7'b0001000;   // -
        end
    if(num == 4'd14)
        begin
            digital = 7'b0100101;   // L
        end
    if(num == 4'd15)
        begin
            digital = 7'b1111110;   // A
        end
end
endfunction

always@*
    begin
        Led_Bit <= Number_Bit;
        Led_character_1to4 <= digital(.num(Number_1to4));
        Led_character_4to8 <= digital(.num(Number_5to8));
    end
endmodule
