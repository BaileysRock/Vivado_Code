`timescale 1ns / 1ps

module lock(
    input sys_clk,                  // TODO 改名为clk
    input rst_n,                    // TODO 改名为clk
    input up_button,
    input down_button,
    input left_button,
    input right_button,
    input middle_button,
    input mode,                     // SW7开关控制模式
    output wire ledlow,             // SW7对应的LED灯
    output wire [7:0] ledbit,       // 数码管显示位信息
    output wire [6:0] ledshow,      // 前四位数码管每段信息
    output wire [6:0] ledshow2,     // 后四位数码管每段信息
    output reg [7:0] leddown        // 8个小LED灯：流水计时
);

wire [63:0] timer;                  // 数码管计时器
wire [63:0] led_timer;              // 流水灯计时器
wire [63:0] left_timer;
wire [63:0] right_timer;
wire [63:0] up_timer;
wire [63:0] down_timer;
wire [63:0] middle_timer;

reg lock_status;    // 是否为锁住状态
wire load_status;   // 是否为修改密码状态
wire read_status;   // 是否为检验密码状态
reg succ_status;    // 是否成功解锁

reg [7:0] choose;   // 当前选中位置

clock_make U1(
    .sys_clk(sys_clk),
    .rst_n(rst_n),
    .timer(timer),
    .led_timer(led_timer),
    .load_status(load_status),
    .read_status(read_status),
    .lock_status(lock_status),
    .middle_button(middle_button),
    .left_button(left_button),
    .right_button(right_button),
    .up_button(up_button),
    .down_button(down_button),
    .left_timer(left_timer),
    .right_timer(right_timer),
    .up_timer(up_timer),
    .down_timer(down_timer),
    .middle_timer(middle_timer)
);

reg [7:0] numbit;    // 数字显示位信息
reg [3:0] number1;   // 前四位数码管数字信息
reg [3:0] number2;   // 后四位数码管数字信息

// 4位密码，每个密码为4位二进制数，保证能存0~9
reg [3:0] pwd1;
reg [3:0] pwd2;
reg [3:0] pwd3;
reg [3:0] pwd4;

reg [3:0] pwds;      // 当前输入的密码正确性

reg [3:0] number_1;
reg [3:0] number_2;
reg [3:0] number_3;
reg [3:0] number_4;
reg [3:0] number_5;
reg [3:0] number_6;
reg [3:0] number_7;
reg [3:0] number_8;

digital_put U2(
    .sys_clk(sys_clk),
    .rst_n(rst_n),
    .numbit(numbit),
    .number1(number1),
    .number2(number2),
    .ledbit(ledbit),
    .ledshow(ledshow),
    .ledshow2(ledshow2)
);

assign ledlow = mode;           // SW7开关打开，对应的led灯亮
assign read_status = ~mode;     // SW7开关打开，退出检验密码状态
assign load_status = mode;      // SW7开关打开，进入修改密码状态

initial
    begin
        numbit <= 8'b11111111;
        number1 <= 4'd0;
        number2 <= 4'd0;
        number_1 <= 4'd0;
        number_2 <= 4'd0;
        number_3 <= 4'd0;
        number_4 <= 4'd0;
        number_5 <= 4'd0;
        number_6 <= 4'd0;
        number_7 <= 4'd0;
        number_8 <= 4'd0;
        pwd1 <= 4'd1;
        pwd2 <= 4'd0;
        pwd3 <= 4'd0;
        pwd4 <= 4'd0;
        pwds <= 4'd0;
        lock_status <= 1'b0;
        succ_status <= 1'b0;
        choose <= 4'b0;
    end

always@(posedge sys_clk or negedge rst_n)
begin
    if(~rst_n)  //初始化
        begin
            leddown <= 8'b11111111;
            lock_status = 1'b0;
        end
    else if(read_status == 1'b1)    //流水灯计时
        begin
            if(led_timer == 64'd199_999_999) //49_999_999
                begin
                    leddown <= 8'b11111110;
                end
            else if(led_timer == 64'd399_999_999)//99_999_999
                begin
                    leddown <= 8'b11111100;
                end
            else if(led_timer == 64'd599_999_999)//149_999_999
                begin
                    leddown <= 8'b11111000;
                end
            else if(led_timer == 64'd799_999_999)//199_999_999
                begin
                    leddown <= 8'b11110000;
                end
            else if(led_timer == 64'd999_999_999)//249_999_999
                begin
                    leddown <= 8'b11100000;
                end
            else if(led_timer == 64'd1_199_999_999)//299_999_999
                begin
                    leddown <= 8'b11000000;
                end
            else if(led_timer == 64'd1_399_999_999)//349_999_999
                begin
                    leddown <= 8'b10000000;
                end
            else if(led_timer == 64'd1_599_999_999)//399_999_999
                begin
                    leddown <= 8'b00000000;
                end
            else if(led_timer == 64'd1_799_999_999)//449_999_999
                begin
                    leddown <= 8'b11111111;
                    lock_status = 1'b1;    //超时锁住
                end
        end
    else    //read_status=0 ,设置密码
        begin
            leddown <= 8'b10101010;
        end
end

always@(posedge sys_clk)
    begin
        if(succ_status == 1'b1)             // 成功解锁 -OK-
            begin
                number_5 <= 4'd14;
                number_6 <= 4'd0;
                number_7 <= 4'd12;
                number_8 <= 4'd14;
            end
        else
            begin
                if(lock_status == 1'b1)     // 未在规定时间内解锁 Fail
                    begin
                        number_5 <= 4'd15;
                        number_6 <= 4'd10;
                        number_7 <= 4'd1;
                        number_8 <= 4'd11;
                    end
                else
                    begin                   // 解锁中 Lock
                        number_5 <= 4'd11;
                        number_6 <= 4'd0;
                        number_7 <= 4'd13;
                        number_8 <= 4'd12;
                    end
            end
    end

// 左右键设置指针指向
always@(posedge sys_clk)
    begin
        if(choose == 8'd0)                          // 当前选择的是第0个数
            begin
                if(right_timer == 64'd9_999_999)    // 右移按钮按下0.1秒
                    begin
                        choose = 8'd1;              // 选择第1个数
                    end
            end
        else if(choose == 8'd1)
            begin
                if(left_timer == 64'd9_999_999)
                    begin
                        choose = 8'd0;
                    end
                else if(right_timer == 64'd9_999_999)
                    begin
                        choose = 8'd2;
                    end
            end
        else if(choose == 8'd2)
            begin
                if(left_timer == 64'd9_999_999)
                    begin
                        choose = 8'd1;
                    end
                else if(right_timer == 64'd9_999_999)
                    begin
                        choose = 8'd3;
                    end
            end
        else if(choose == 8'd3)
            begin
                if(left_timer == 64'd9_999_999)
                    begin
                        choose = 8'd2;
                    end
            end
    end

// 上下键设置数值
always@(posedge sys_clk or negedge rst_n)
    begin
        if(~rst_n)
            begin
                number_1 = 4'd0;
                number_2 = 4'd0;
                number_3 = 4'd0;
                number_4 = 4'd0;
            end
        else
            begin
                if(choose == 4'd0)                                      // 当前选择的是第0个树
                    begin
                        if(up_timer == 64'd9_999_999)                   // “上”按钮按下0.1秒
                            begin
                                if(number_1 < 4'd9)                     // 第0个数的数值小于9
                                    begin
                                        number_1 = number_1 + 1'b1;     // 第0个数的数值加1
                                    end
                            end
                        if(down_timer == 64'd9_999_999)
                            begin
                                if(number_1 > 4'd0)
                                    begin
                                        number_1 = number_1 - 1'b1;
                                    end
                            end
                    end
                else if(choose == 4'd1)
                    begin
                        if(up_timer == 64'd9_999_999)
                            begin
                                if(number_2 < 4'd9)
                                    begin
                                        number_2 = number_2 + 1'b1;
                                    end
                            end
                        if(down_timer == 64'd9_999_999)
                            begin
                                if(number_2 > 4'd0)
                                    begin
                                        number_2 = number_2 - 1'b1;
                                    end
                            end
                    end
                else if(choose == 4'd2)
                    begin
                        if(up_timer == 64'd9_999_999)
                            begin
                                if(number_3 < 4'd9)
                                    begin
                                        number_3 = number_3 + 1'b1;
                                    end
                            end
                        if(down_timer == 64'd9_999_999)
                            begin
                                if(number_3 > 4'd0)
                                    begin
                                        number_3 = number_3 - 1'b1;
                                    end
                            end
                    end
                else if(choose == 4'd3)
                    begin
                        if(up_timer == 64'd9_999_999)
                            begin
                                if(number_4 < 4'd9)
                                    begin
                                        number_4 = number_4 + 1'b1;
                                    end
                            end
                        if(down_timer == 64'd9_999_999)
                            begin
                                if(number_4 > 4'd0)
                                    begin
                                        number_4 = number_4 - 1'b1;
                                    end
                            end
                    end
            end
    end

// 判断密码正确性和设置密码操作
always@(posedge sys_clk or negedge rst_n)
    begin
        if(~rst_n)                          // 初始密码设置和初始默输入密码
            begin
                pwd1 <= 4'd2;
                pwd2 <= 4'd0;
                pwd3 <= 4'd2;
                pwd4 <= 4'd0;
                pwds <= 4'b0000;
                succ_status <= 1'b0;
            end
        else
            begin
                if(pwd1 == number_1)        // 若第一位密码正确，则pwds[3]为1，否则为0
                    begin
                        pwds[3]=1'b1;
                    end
                else
                    begin
                        pwds[3]=1'b0;
                    end
                if(pwd2 == number_2)        // 若第二位密码正确，则pwds[2]为1，否则为0
                    begin
                        pwds[2]=1'b1;
                    end
                else
                    begin
                        pwds[2]=1'b0;
                    end
                if(pwd3 == number_3)
                    begin
                        pwds[1]=1'b1;
                    end
                else
                    begin
                        pwds[1]=1'b0;
                    end
                if(pwd4 == number_4)
                    begin
                        pwds[0]=1'b1;
                    end
                else
                    begin
                        pwds[0]=1'b0;
                    end
                if(lock_status == 1'b0)                                     // 未解锁状态
                    begin
                        if(read_status == 1'b1)                             // 读取密码状态
                            begin
                                if(middle_timer == 64'd9_999_999)           // 按下“确定”键
                                    begin
                                        if(pwds == 4'b1111)                 // 若四位密码全正确，则succ_status为1
                                            begin
                                                succ_status <= 1'b1;
                                            end
                                        else
                                            begin
                                                succ_status <= 1'b0;
                                            end
                                    end
                            end
                        else                                                // 未读取密码状态
                            begin
                                if(load_status == 1'b1)                     // 设置密码状态
                                    begin
                                        if(middle_timer == 64'd9_999_999)   // 按下“确定”键
                                            begin
                                                pwd1 <= number_1;           // 重设密码
                                                pwd2 <= number_2;
                                                pwd3 <= number_3;
                                                pwd4 <= number_4;
                                                
                                                succ_status <= 1'b0;
                                            end
                                    end
                            end
                    end
            end
    end

// 闪烁与选中设置
always@(posedge sys_clk or negedge rst_n)
    begin
        if(~rst_n)
            begin
                numbit <= 8'b11111111;
                number1 <= 4'd0;
                number2 <= 4'd0;
            end
        else if(timer <= 64'd249999)
            begin
                numbit = 8'b10001000;
                number1 = number_1;
                number2 = number_5;
            end
        else if(timer <= 64'd499999)
            begin
                numbit = 8'b01000100;
                number1 = number_2;
                number2 = number_6;
            end
        else if(timer <= 64'd749999)
            begin
                numbit = 8'b00100010;
                number1 = number_3;
                number2 = number_7;
            end
        else if(timer <= 64'd999999)
            begin
                numbit = 8'b00010001;
                number1 = number_4;
                number2 = number_8;
            end
    end
endmodule
