`timescale 1ns / 1ps

module sim_clock();
    reg CLK, RST;
    reg Left; 
    reg Right; 
    reg Middle; 
    wire Left_Button, Right_Button, Up_Button, Down_Button, Middle_Button;
    wire Lock_State, Read_State;
    initial
        begin
            CLK = 0;
            RST = 0;
            Left = 0;
            Right = 0;
            Middle = 0;
        end
    always #20 CLK = ~CLK;
    always #20 Left = ~Left;    
    always #40 Right = ~Right;
    always #30 Middle = ~Middle;
    assign Left_Button = Left;
    assign Right_Button = Right;
    assign Middle_Button = Middle;
    assign Up_Button = 1'b0;
    assign Down_Button = 1'b0;
    assign Read_State = 1'b1;
    assign Lock_State = 1'b0;
    clock C1(
        .CLK(CLK),
        .RST(RST),
        .Time(Time),
        .Read_State(Read_State),
        .Lock_State(Lock_State),
        .Middle_Button(Middle_Button),
        .Left_Button(Left_Button),
        .Right_Button(Right_Button),
        .Up_Button(Up_Button),
        .Down_Button(Down_Button)
    );
endmodule
