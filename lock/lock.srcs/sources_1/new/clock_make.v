`timescale 1ns / 1ps

module clock_make(
    input sys_clk,      //TODO 改名为clk
    input rst_n,        //TODO 改名为rst
    input [7:0] is_jmp, //当前选中的一位
    input left_button,
    input right_button,
    input up_button,
    input down_button,
    input middle_button,
    input lock_status,  //是否为锁住状态
    input read_status,  //是否为检验密码状态
    input load_status,  //是否为修改密码状态
    output reg [63:0] led_timer,
    output reg [63:0] pwd_cng_timer,
    output reg [63:0] jmp1,
    output reg [63:0] jmp2,
    output reg [63:0] jmp3,
    output reg [63:0] jmp4,
    output reg [63:0] jmp5,
    output reg [63:0] jmp6,
    output reg [63:0] jmp7,
    output reg [63:0] jmp8,
    output reg [63:0] timer,
    output reg [63:0] main_timer,
    output reg [63:0] right_timer,
    output reg [63:0] left_timer,
    output reg [63:0] up_timer,
    output reg [63:0] down_timer,
    output reg [63:0] middle_timer
);

always@(posedge sys_clk or negedge rst_n)
    begin
        if(~rst_n)
            begin
                pwd_cng_timer <= 64'd0;

                left_timer <= 64'd0;
                right_timer <= 64'd0;
                up_timer <= 64'd0;
                down_timer <= 64'd0;
                middle_timer <= 64'd0;

                led_timer <= 64'd0;
                timer <= 64'd0;
                main_timer <= 64'd0;

                jmp1 <= 1'b0;
                jmp2 <= 1'b0;
                jmp3 <= 1'b0;
                jmp4 <= 1'b0;
                jmp5 <= 1'b0;
                jmp6 <= 1'b0;
                jmp7 <= 1'b0;
                jmp8 <= 1'b0;
            end
        else
            begin
                if(middle_button) pwd_cng_timer <= pwd_cng_timer + 1'b1;
                else pwd_cng_timer <= 0;

                if(middle_button) middle_timer <= middle_timer + 1'b1;
                else middle_timer <= 0;
                if(left_button) left_timer <= left_timer + 1'b1;
                else left_timer <= 0;
                if(right_button) right_timer <= right_timer + 1'b1;
                else right_timer <= 0;
                if(up_button) up_timer <= up_timer + 1'b1;
                else up_timer <= 0;
                if(down_button) down_timer <= down_timer + 1'b1;
                else down_timer <= 0;

                if(read_status == 1'b0) led_timer <= 64'd0;
                else if(led_timer == 64'd1_799_999_999) led_timer <= 64'd0;
                else led_timer <= led_timer + 1'b1;

                if(timer == 64'd1_249_999) timer <= 64'd0;
                else timer <= timer + 1'b1;

                main_timer <= main_timer + 1'b1;

                if(is_jmp[0] == 1'b1) jmp8 = jmp8 + 1'b1;
                if(is_jmp[1] == 1'b1) jmp7 = jmp7 + 1'b1;
                if(is_jmp[2] == 1'b1) jmp6 = jmp6 + 1'b1;
                if(is_jmp[3] == 1'b1) jmp5 = jmp5 + 1'b1;
                if(is_jmp[4] == 1'b1) jmp4 = jmp4 + 1'b1;
                if(is_jmp[5] == 1'b1) jmp3 = jmp3 + 1'b1;
                if(is_jmp[6] == 1'b1) jmp2 = jmp2 + 1'b1;
                if(is_jmp[7] == 1'b1) jmp1 = jmp1 + 1'b1;
                if(jmp1 >= 100000000) jmp1 = jmp1 % 100000000;
                if(jmp2 >= 100000000) jmp2 = jmp2 % 100000000;
                if(jmp3 >= 100000000) jmp3 = jmp3 % 100000000;
                if(jmp4 >= 100000000) jmp4 = jmp4 % 100000000;
                if(jmp5 >= 100000000) jmp5 = jmp5 % 100000000;
                if(jmp6 >= 100000000) jmp6 = jmp6 % 100000000;
                if(jmp7 >= 100000000) jmp7 = jmp7 % 100000000;
                if(jmp8 >= 100000000) jmp8 = jmp8 % 100000000;
            end
    end
endmodule
