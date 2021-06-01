`timescale 1ns / 1ps

module digital_put(
    input sys_clk,              // TODO 改名为clk
    input rst_n,                // TODO 改名为rst
    input [3:0] number1,        // 用于控制数码管前四位。每次只控制1个灯，通过快速交替控制4个灯
    input [3:0] number2,        // 用于控制数码管后四位。每次只控制1个灯，通过快速交替控制4个灯
    input [7:0] numbit,         // 赋值给ledbit，8位控制8个数码管
    output reg [7:0] ledbit,    // 8位控制8个数码管
    output reg [6:0] ledshow,   // 用于控制数码管前四位。每次只控制1个灯，通过快速交替控制4个灯
    output reg [6:0] ledshow2   // 用于控制数码管后四位。每次只控制1个灯，通过快速交替控制4个灯
);

// TODO digital function拆分为module
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
            digital = 7'b1111110;   // A
        end
    if(num == 4'd11)
        begin
            digital = 7'b0100101;   // L
        end
    if(num == 4'd12)
        begin
            digital = 7'b0111101;   // K
        end
    if(num == 4'd13)
        begin
            digital = 7'b1100101;   // C
        end
    if(num == 4'd14)
        begin
            digital = 7'b0001000;   // -
        end
    if(num == 4'd15)
        begin
            digital = 7'b1101100;   // F
        end
end
endfunction

always@*
    begin
        ledbit <= numbit;
        ledshow <= digital(.num(number1));
        ledshow2 <= digital(.num(number2));
    end
endmodule
