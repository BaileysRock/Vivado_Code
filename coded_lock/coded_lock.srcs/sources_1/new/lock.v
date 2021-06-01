`timescale 1ns / 1ps

module lock(
    input CLK,
    input RST,
    input Up_Button,
    input Down_Button,
    input Left_Button,
    input Right_Button,
    input Middle_Button,
    input Change_Button,            // �޸İ�ť
    output wire Change_Led,         // �޸İ�ť��Ӧ����ʾ��
    output wire [7:0] Led_Bit,       // �������ʾλ��Ϣ
    output wire [6:0] Led_character_1to4,      // ǰ��λ�����ÿ����Ϣ
    output wire [6:0] Led_character_4to8,     // ����λ�����ÿ����Ϣ
    output reg [7:0] Waterfall_Light        // 8��СLED�ƣ���ˮ��ʱ
);

wire [63:0] Time;                  // ����ܼ�ʱ��
wire [63:0] Led_Time;              // ��ˮ�Ƽ�ʱ��
wire [63:0] Left_Time;
wire [63:0] Right_Time;
wire [63:0] Up_Time;
wire [63:0] Down_Time;
wire [63:0] Middle_Time;
reg Lock_State;     // �жϵ�ǰ�Ƿ�Ϊ��ס״̬
wire Change_State;  // �жϵ�ǰ�Ƿ�Ϊ�޸�����״̬
wire Read_State;    // �жϵ�ǰ�Ƿ�Ϊ��������״̬
reg Success_State;    // �жϵ�ǰ�Ƿ�ɹ�����



reg [7:0] Current_Position;   // ��ǰ�޸����ݵ�λ��

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

reg [7:0] Number_Bit;    // ������ʾλ��Ϣ
reg [3:0] Number_1to4;   // ǰ��λ�����������Ϣ
reg [3:0] Number_5to8;   // ����λ�����������Ϣ

// 4λ���룬ÿ������Ϊ4λ������������֤�ܴ�0~9
reg [3:0] Verification_1;
reg [3:0] Verification_2;
reg [3:0] Verification_3;
reg [3:0] Verification_4;

reg [3:0] Verification;      // ��ǰ�����������ȷ��

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

assign Change_Led = Change_Button;        //T5���ش򿪣���Ӧ��led����
assign Read_State = ~Change_Button;       //T5���ش򿪣��˳���������״̬
assign Change_State = Change_Button;      //T5���ش򿪣������޸�����״̬



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
    if(~RST)  //��ʼ��
        begin
            Waterfall_Light <= 8'b11111111;
            Lock_State = 1'b0;
        end
    else if(Read_State == 1'b1)    //��ˮ�Ƽ�ʱ
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
                    Lock_State = 1'b1;    //��ʱ��ס
                end
        end
    else    //Read_State=0 ,��������
        begin
            Waterfall_Light <= 8'b10101010;
        end
end

always@(posedge CLK)
    begin
        if(Success_State == 1'b1)          // �ɹ����� �������-ON-
            begin
                Number_5 <= 4'd13;
                Number_6 <= 4'd0;
                Number_7 <= 4'd11;
                Number_8 <= 4'd13;
            end
        else
            begin
                if(Lock_State == 1'b1)     // δ�ڹ涨ʱ���ڽ��� ������� Fail
                    begin
                        Number_5 <= 4'd12;
                        Number_6 <= 4'd15;
                        Number_7 <= 4'd1;
                        Number_8 <= 4'd14;
                    end
                else
                    begin                   // ������ ������� -UN-
                        Number_5 <= 4'd13;
                        Number_6 <= 4'd10;
                        Number_7 <= 4'd11;
                        Number_8 <= 4'd13;
                    end
            end
    end



// Right_Button �� Left_Button ѡ��λ��
always@(posedge CLK)
    begin
        if(Current_Position == 8'd0)               // ��ǰ��λ��Ϊ0ʱ
            begin
                if(Right_Time == 64'd9_999_999)    // Right_Button����0.1��
                    begin
                        Current_Position = 8'd1;   // ѡ���1����
                    end
            end
        else if(Current_Position == 8'd1)          // ��ǰ��λ��Ϊ1ʱ
            begin
                if(Left_Time == 64'd9_999_999)     // Left_Button����0.1��
                    begin
                        Current_Position = 8'd0;
                    end
                else if(Right_Time == 64'd9_999_999)    // Right_Button����0.1��
                    begin
                        Current_Position = 8'd2;
                    end
            end
        else if(Current_Position == 8'd2)          // ��ǰ��λ��Ϊ2ʱ
            begin
                if(Left_Time == 64'd9_999_999)     // Left_Button����0.1��
                    begin
                        Current_Position = 8'd1;
                    end
                else if(Right_Time == 64'd9_999_999)    // Right_Button����0.1��
                    begin
                        Current_Position = 8'd3;
                    end
            end
        else if(Current_Position == 8'd3)          // ��ǰ��λ��Ϊ3ʱ
            begin
                if(Left_Time == 64'd9_999_999)     // Left_Button����0.1��
                    begin
                        Current_Position = 8'd2;
                    end
            end
    end

// Up_Button �� Down_Button ������ֵ
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
                if(Current_Position == 4'd0)                           // ��ǰλ��Ϊ0��λ
                    begin
                        if(Up_Time == 64'd9_999_999)                   // Up_Button����0.1��
                            begin
                                if(Number_1 < 4'd9)                     // ��0��������ֵС��9
                                    begin
                                        Number_1 = Number_1 + 1'b1;     // ��0��������ֵ��1
                                    end
                                else if(Number_1 == 4'd9)               //��0����Ϊ9ʱ������Ϊ0
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

// �ж�������ȷ�Ժ������������
always@(posedge CLK or negedge RST)
    begin
        if(~RST)                          // ��ʼ�������úͳ�ʼĬ��������
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
                if(Verification_1 == Number_1)        // ����һλ������ȷ����Verification[3]Ϊ1������Ϊ0
                    begin
                        Verification[3]=1'b1;
                    end
                else
                    begin
                        Verification[3]=1'b0;
                    end
                if(Verification_2 == Number_2)        // ���ڶ�λ������ȷ����Verification[2]Ϊ1������Ϊ0
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
                if(Lock_State == 1'b0)                                     // δ����״̬
                    begin
                        if(Read_State == 1'b1)                             // ��ȡ����״̬
                            begin
                                if(Middle_Time == 64'd9_999_999)           // ����"ȷ��"��
                                    begin
                                        if(Verification == 4'b1111)         // ����λ����ȫ��ȷ����Success_StateΪ1
                                            begin
                                                Success_State <= 1'b1;
                                            end
                                        else
                                            begin
                                                Success_State <= 1'b0;
                                            end
                                    end
                            end
                        else                                                // ��δ��ȡ����״̬��
                            begin
                                if(Change_State == 1'b1)                    // ��������״̬
                                    begin
                                        if(Middle_Time == 64'd9_999_999)    // ����"ȷ��"��
                                            begin
                                                Verification_1 <= Number_1;           // ��������
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


// ��˸��ѡ������
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
