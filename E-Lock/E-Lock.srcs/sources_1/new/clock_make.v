`timescale 1ns / 1ps

module clock_make(
    input sys_clk,         
    input rst_n,           
    input left_button,
    input right_button,
    input up_button,
    input down_button,
    input middle_button,
    input lock_status,      // ÊÇ·ñÎªËø×¡×´Ì¬
    input read_status,      // ÊÇ·ñÎª¼ìÑéÃÜÂë×´Ì¬
    input load_status,      // ÊÇ·ñÎªĞŞ¸ÄÃÜÂë×´Ì¬
    output reg [63:0] led_timer,
    output reg [63:0] timer,
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
                left_timer <= 64'd0;
                right_timer <= 64'd0;
                up_timer <= 64'd0;
                down_timer <= 64'd0;
                middle_timer <= 64'd0;

                led_timer <= 64'd0;
                timer <= 64'd0;
            end
        else
            begin
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
                else if(led_timer == 64'd1_800_000_000) led_timer <= 64'd0;
                else led_timer <= led_timer + 1'b1;

                if(timer == 64'd999999) timer <= 64'd0;
                else timer <= timer + 1'b1;
            end
    end
endmodule
