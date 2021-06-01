`timescale 1ns / 1ps

module clock(
    input CLK,          
    input RST,           
    input Left_Button,
    input Right_Button,
    input Up_Button,
    input Down_Button,
    input Middle_Button,
    input Lock_State,      // 判断当前是否锁的状态
    input Read_State,      // 判断当前是否为在检测密码是否正确的状态
    output reg [63:0] Led_Time,
    output reg [63:0] Time,
    output reg [63:0] Right_Time,
    output reg [63:0] Left_Time,
    output reg [63:0] Up_Time,
    output reg [63:0] Down_Time,
    output reg [63:0] Middle_Time
);

always@(posedge CLK or negedge RST)
    begin
        if(~RST)
            begin
                Left_Time <= 64'd0;
                Right_Time <= 64'd0;
                Up_Time <= 64'd0;
                Down_Time <= 64'd0;
                Middle_Time <= 64'd0;
                Led_Time <= 64'd0;
                Time <= 64'd0;
            end
        else
            begin
                if(Middle_Button) Middle_Time <= Middle_Time + 1'b1;
                else Middle_Time <= 0;
                if(Left_Button) Left_Time <= Left_Time + 1'b1;
                else Left_Time <= 0;
                if(Right_Button) Right_Time <= Right_Time + 1'b1;
                else Right_Time <= 0;
                if(Up_Button) Up_Time <= Up_Time + 1'b1;
                else Up_Time <= 0;
                if(Down_Button) Down_Time <= Down_Time + 1'b1;
                else Down_Time <= 0;
                if(Read_State == 1'b0) Led_Time <= 64'd0;
                else if(Led_Time == 64'd1_800_000_000) Led_Time <= 64'd0;
                else Led_Time <= Led_Time + 1'b1;
                if(Time == 64'd999999) Time <= 64'd0;
                else Time <= Time + 1'b1;
            end
    end
endmodule
