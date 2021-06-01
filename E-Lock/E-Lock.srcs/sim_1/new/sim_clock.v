`timescale 1ns / 1ps

module sim_clock();
    reg sys_clk, rst_n;
    wire left_button, right_button, up_button, down_button, middle_button;
    wire read_status, lock_status, load_status;




    initial
        begin
            sys_clk = 0;
            rst_n = 0;
            left = 0;
            right = 0;
            middle = 0;
        end

    always #10 sys_clk = ~sys_clk;

    reg left; always #20 left = ~left;
    reg right; always #40 right = ~right;
    reg middle; always #100 middle = ~middle;

    assign left_button = left;
    assign right_button = right;
    assign up_button = 1'b0;
    assign down_button = 1'b0;
    assign middle_button = middle;

    assign read_status = 1'b1;
    assign lock_status = 1'b0;
    assign load_status = 1'b0;

    clock_make C1(
        .sys_clk(sys_clk),
        .rst_n(rst_n),
        .timer(timer),
        .led_timer(led_timer),
        .lock_status(lock_status),
        .read_status(read_status),
        .load_status(load_status),
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
endmodule
