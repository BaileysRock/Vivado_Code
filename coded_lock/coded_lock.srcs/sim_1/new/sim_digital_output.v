`timescale 1ns / 1ps

module sim_digital_output();
    wire [7:0] Led_Bit;
    wire [6:0] Led_character_1to4;   
    wire [6:0] Led_character_4to8;
    reg [7:0] Led_Bit_1;
    reg [6:0] Led_character_1to4_1;   
    reg [6:0] Led_character_4to8_1;
    initial 
        begin
            Led_Bit_1 = 8'd0;
            Led_character_1to4_1 = 7'd0;
            Led_character_4to8_1 = 7'd0;
        end
    assign Led_Bit = Led_Bit_1;
    assign Led_character_1to4 = Led_character_1to4_1;
    assign Led_character_4to8 = Led_character_4to8_1;
    always #40 Led_character_1to4_1 = Led_character_1to4_1 + 1;    
    always #20 Led_character_4to8_1 = Led_character_4to8_1 + 1; 
    always #10 Led_Bit_1 = Led_Bit_1 + 1;
    digital_output C2(
    .Number_Bit(Number_Bit),
    .Number_1to4(Number_1to4),
    .Number_5to8(Number_5to8),
    .Led_Bit(Led_Bit),
    .Led_character_1to4(Led_character_1to4),
    .Led_character_4to8(Led_character_4to8)
);

endmodule