`timescale 1ns / 1ps

module lock(
    input CLK,
    input RST,
    input Up_Button,
    input Down_Button,
    input Left_Button,
    input Right_Button,
    input Middle_Button,
    input Change_Button,            // 修改按钮
    output wire Change_Led,         // 修改按钮对应的提示灯
    output wire [7:0] Led_Bit,       // 数码管显示位信息
    output wire [6:0] Led_character_1to4,      // 前四位数码管每段信息
    output wire [6:0] Led_character_4to8,     // 后四位数码管每段信息
    output reg [7:0] Waterfall_Light        // 8个小LED灯：流水计时
);

wire [63:0] Time;                  // 数码管计时器
wire [63:0] Led_Time;              // 流水灯计时器
wire [63:0] Left_Time;
wire [63:0] Right_Time;
wire [63:0] Up_Time;
wire [63:0] Down_Time;
wire [63:0] Middle_Time;
reg Lock_State;     // 判断当前是否为锁住状态
wire Change_State;  // 判断当前是否为修改密码状态
wire Read_State;    // 判断当前是否为检验密码状态
reg Success_State;    // 判断当前是否成功解锁



reg [7:0] Current_Position;   // 当前修改数据的位置

clock U1(
    .CLK(CLK),
    .RST(RST),
    .Time(Time),
    .Led_Time(Led_Time),
    .Read_State(Read_State),
    .Lock_State(Lock_State),
    .Middle_Button(Middle_Button),
    .Left_Button(Left_Button),
    .Right_Button(Right_Button),
    .Up_Button(Up_Button),
    .Down_Button(Down_Button),
    .Left_Time(Left_Time),
    .Right_Time(Right_Time),
    .Up_Time(Up_Time),
    .Down_Time(Down_Time),
    .Middle_Time(Middle_Time)
);

reg [7:0] Number_Bit;    // 数字显示位信息
reg [3:0] Number_1to4;   // 前四位数码管数字信息
reg [3:0] Number_5to8;   // 后四位数码管数字信息

// 4位密码，每个密码为4位二进制数，保证能存0~9
reg [3:0] Verification_1;
reg [3:0] Verification_2;
reg [3:0] Verification_3;
reg [3:0] Verification_4;

reg [3:0] Verification;      // 当前输入的密码正确性

reg [3:0] Number_1;
reg [3:0] Number_2;
reg [3:0] Number_3;
reg [3:0] Number_4;
reg [3:0] Number_5;
reg [3:0] Number_6;
reg [3:0] Number_7;
reg [3:0] Number_8;



digital_output U2(
    .Number_Bit(Number_Bit),
    .Number_1to4(Number_1to4),
    .Number_5to8(Number_5to8),
    .Led_Bit(Led_Bit),
    .Led_character_1to4(Led_character_1to4),
    .Led_character_4to8(Led_character_4to8)
);

assign Change_Led = Change_Button;        //T5开关打开，对应的led灯亮
assign Read_State = ~Change_Button;       //T5开关打开，退出检验密码状态
assign Change_State = Change_Button;      //T5开关打开，进入修改密码状态



initial
    begin
        Number_Bit <= 8'b11111111;
        Number_1to4 <= 4'd0;
        Number_5to8 <= 4'd0;
        Number_1 <= 4'd0;
        Number_2 <= 4'd0;
        Number_3 <= 4'd0;
        Number_4 <= 4'd0;
        Number_5 <= 4'd0;
        Number_6 <= 4'd0;
        Number_7 <= 4'd0;
        Number_8 <= 4'd0;
        Verification_1 <= 4'd0;
        Verification_2 <= 4'd2;
        Verification_3 <= 4'd4;
        Verification_4 <= 4'd6;
        Verification <= 4'd0;
        Lock_State <= 1'b0;
        Success_State <= 1'b0;
        Current_Position <= 4'b0;
    end

always@(posedge CLK or negedge RST)
begin
    if(~RST)  //初始化
        begin
            Waterfall_Light <= 8'b11111111;
            Lock_State = 1'b0;
        end
    else if(Read_State == 1'b1)    //流水灯计时
        begin
            if(Led_Time == 64'd099_999_999) //49_999_999
                begin
                    Waterfall_Light <= 8'b01111111;
                end
            else if(Led_Time == 64'd199_999_999)//99_999_999
                begin
                    Waterfall_Light <= 8'b00111111;
                end
            else if(Led_Time == 64'd299_999_999)//149_999_999
                begin
                    Waterfall_Light <= 8'b00011111;
                end
            else if(Led_Time == 64'd399_999_999)//199_999_999
                begin
                    Waterfall_Light <= 8'b00001111;
                end
            else if(Led_Time == 64'd499_999_999)//249_999_999
                begin
                    Waterfall_Light <= 8'b00000111;
                end
            else if(Led_Time == 64'd599_999_999)//299_999_999
                begin
                    Waterfall_Light <= 8'b00000011;
                end
            else if(Led_Time == 64'd699_999_999)//349_999_999
                begin
                    Waterfall_Light <= 8'b00000001;
                end
            else if(Led_Time == 64'd799_999_999)//399_999_999
                begin
                    Waterfall_Light <= 8'b00000000;
                end
            else if(Led_Time == 64'd899_999_999)//449_999_999
                begin
                    Waterfall_Light <= 8'b11111111;
                    Lock_State = 1'b1;    //超时锁住
                end
        end
    else    //Read_State=0 ,设置密码
        begin
            Waterfall_Light <= 8'b10101010;
        end
end

always@(posedge CLK)
    begin
        if(Success_State == 1'b1)          // 成功解锁 输出字形-ON-
            begin
                Number_5 <= 4'd13;
                Number_6 <= 4'd0;
                Number_7 <= 4'd11;
                Number_8 <= 4'd13;
            end
        else
            begin
                if(Lock_State == 1'b1)     // 未在规定时间内解锁 输出字形 Fail
                    begin
                        Number_5 <= 4'd12;
                        Number_6 <= 4'd15;
                        Number_7 <= 4'd1;
                        Number_8 <= 4'd14;
                    end
                else
                    begin                   // 解锁中 输出字形 -UN-
                        Number_5 <= 4'd13;
                        Number_6 <= 4'd10;
                        Number_7 <= 4'd11;
                        Number_8 <= 4'd13;
                    end
            end
    end



// Right_Button 与 Left_Button 选择位置
always@(posedge CLK)
    begin
        if(Current_Position == 8'd0)               // 当前的位置为0时
            begin
                if(Right_Time == 64'd9_999_999)    // Right_Button按下0.1秒
                    begin
                        Current_Position = 8'd1;   // 选择第1个数
                    end
            end
        else if(Current_Position == 8'd1)          // 当前的位置为1时
            begin
                if(Left_Time == 64'd9_999_999)     // Left_Button按下0.1秒
                    begin
                        Current_Position = 8'd0;
                    end
                else if(Right_Time == 64'd9_999_999)    // Right_Button按下0.1秒
                    begin
                        Current_Position = 8'd2;
                    end
            end
        else if(Current_Position == 8'd2)          // 当前的位置为2时
            begin
                if(Left_Time == 64'd9_999_999)     // Left_Button按下0.1秒
                    begin
                        Current_Position = 8'd1;
                    end
                else if(Right_Time == 64'd9_999_999)    // Right_Button按下0.1秒
                    begin
                        Current_Position = 8'd3;
                    end
            end
        else if(Current_Position == 8'd3)          // 当前的位置为3时
            begin
                if(Left_Time == 64'd9_999_999)     // Left_Button按下0.1秒
                    begin
                        Current_Position = 8'd2;
                    end
            end
    end

// Up_Button 与 Down_Button 调整数值
always@(posedge CLK or negedge RST)
    begin
        if(~RST)
            begin
                Number_1 = 4'd0;
                Number_2 = 4'd0;
                Number_3 = 4'd0;
                Number_4 = 4'd0;
            end
        else
            begin
                if(Current_Position == 4'd0)                           // 当前位置为0号位
                    begin
                        if(Up_Time == 64'd9_999_999)                   // Up_Button按下0.1秒
                            begin
                                if(Number_1 < 4'd9)                     // 第0个数的数值小于9
                                    begin
                                        Number_1 = Number_1 + 1'b1;     // 第0个数的数值加1
                                    end
                                else if(Number_1 == 4'd9)               //第0个数为9时，令其为0
                                    begin
                                        Number_1 = 4'd0 ;
                                    end
                            end
                        if(Down_Time == 64'd9_999_999)
                            begin
                                if(Number_1 > 4'd0)
                                    begin
                                        Number_1 = Number_1 - 1'b1;
                                    end
                                else if(Number_1 == 4'd0)
                                    begin
                                        Number_1 = 4'd9 ;
                                    end
                                
                            end
                    end
                else if(Current_Position == 4'd1)
                    begin
                        if(Up_Time == 64'd9_999_999)
                            begin
                                if(Number_2 < 4'd9)
                                    begin
                                        Number_2 = Number_2 + 1'b1;
                                    end
                                else if(Number_2 == 4'd9)
                                    begin
                                        Number_2 = 4'd0;
                                    end;
                            end
                        if(Down_Time == 64'd9_999_999)
                            begin
                                if(Number_2 > 4'd0)
                                    begin
                                        Number_2 = Number_2 - 1'b1;
                                    end
                                else if(Number_2 == 4'd0)
                                    begin
                                        Number_2 = 4'd9;
                                    end;
                            end
                    end
                else if(Current_Position == 4'd2)
                    begin
                        if(Up_Time == 64'd9_999_999)
                            begin
                                if(Number_3 < 4'd9)
                                    begin
                                        Number_3 = Number_3 + 1'b1;
                                    end
                                else if(Number_3 == 4'd9)
                                    begin
                                        Number_3 = 4'd0;
                                    end;
                            end
                        if(Down_Time == 64'd9_999_999)
                            begin
                                if(Number_3 > 4'd0)
                                    begin
                                        Number_3 = Number_3 - 1'b1;
                                    end
                                else if(Number_3 == 4'd0)
                                    begin
                                        Number_3 = 4'd9;
                                    end;
                            end
                    end
                else if(Current_Position == 4'd3)
                    begin
                        if(Up_Time == 64'd9_999_999)
                            begin
                                if(Number_4 < 4'd9)
                                    begin
                                        Number_4 = Number_4 + 1'b1;
                                    end
                                else if(Number_4 == 4'd9)
                                    begin
                                        Number_4 = 4'd0;
                                    end;
                            end
                        if(Down_Time == 64'd9_999_999)
                            begin
                                if(Number_4 > 4'd0)
                                    begin
                                        Number_4 = Number_4 - 1'b1;
                                    end
                                else if(Number_4 == 4'd0)
                                    begin
                                        Number_4 = 4'd9;
                                    end;
                            end
                    end
            end
    end

// 判断密码正确性和设置密码操作
always@(posedge CLK or negedge RST)
    begin
        if(~RST)                          // 初始密码设置和初始默输入密码
            begin
                // Verification_1 <= 4'd0;
                // Verification_2 <= 4'd2;
                // Verification_3 <= 4'd4;
                // Verification_4 <= 4'd6;
                Verification <= 4'b0000;
                Success_State <= 1'b0;
                //Lock_State <= 1'b0;
            end
        else
            begin
                if(Verification_1 == Number_1)        // 若第一位密码正确，则Verification[3]为1，否则为0
                    begin
                        Verification[3]=1'b1;
                    end
                else
                    begin
                        Verification[3]=1'b0;
                    end
                if(Verification_2 == Number_2)        // 若第二位密码正确，则Verification[2]为1，否则为0
                    begin
                        Verification[2]=1'b1;
                    end
                else
                    begin
                        Verification[2]=1'b0;
                    end
                if(Verification_3 == Number_3)
                    begin
                        Verification[1]=1'b1;
                    end
                else
                    begin
                        Verification[1]=1'b0;
                    end
                if(Verification_4 == Number_4)
                    begin
                        Verification[0]=1'b1;
                    end
                else
                    begin
                        Verification[0]=1'b0;
                    end
                if(Lock_State == 1'b0)                                     // 未解锁状态
                    begin
                        if(Read_State == 1'b1)                             // 读取密码状态
                            begin
                                if(Middle_Time == 64'd9_999_999)           // 按下"确定"键
                                    begin
                                        if(Verification == 4'b1111)         // 若四位密码全正确，则Success_State为1
                                            begin
                                                Success_State <= 1'b1;
                                            end
                                        else
                                            begin
                                                Success_State <= 1'b0;
                                            end
                                    end
                            end
                        else                                                // 在未读取密码状态下
                            begin
                                if(Change_State == 1'b1)                    // 设置密码状态
                                    begin
                                        if(Middle_Time == 64'd9_999_999)    // 按下"确定"键
                                            begin
                                                Verification_1 <= Number_1;           // 重设密码
                                                Verification_2 <= Number_2;
                                                Verification_3 <= Number_3;
                                                Verification_4 <= Number_4;
                                                Success_State <= 1'b0;
                                                //Lock_State <= 1'b0;
                                            end
                                    end
                            end
                    end
            end
    end


// 闪烁与选中设置
always@(posedge CLK or negedge RST)
    begin
        if(~RST)
            begin
                Number_Bit <= 8'b11111111;
                Number_1to4 <= 4'd0;
                Number_5to8 <= 4'd0;
            end
        else if(Time <= 64'd249999)
            begin
                Number_Bit = 8'b10001000;
                Number_1to4 = Number_1;
                Number_5to8 = Number_5;
            end
        else if(Time <= 64'd499999)
            begin
                Number_Bit = 8'b01000100;
                Number_1to4 = Number_2;
                Number_5to8 = Number_6;
            end
        else if(Time <= 64'd749999)
            begin
                Number_Bit = 8'b00100010;
                Number_1to4 = Number_3;
                Number_5to8 = Number_7;
            end
        else if(Time <= 64'd999999)
            begin
                Number_Bit = 8'b00010001;
                Number_1to4 = Number_4;
                Number_5to8 = Number_8;
            end
    end
endmodule
