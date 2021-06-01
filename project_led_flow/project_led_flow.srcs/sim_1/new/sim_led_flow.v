`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/25 22:02:54
// Design Name: 
// Module Name: sim_led_flow
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module sim_led_flow();

    reg clk;
    reg rst_n;
    wire clk_div;
    wire[7:0] water_out;
    parameter DELY=20;
    divider U_divider(.clk(clk),
                      .rst_n(rst_n),
                      .clk_div(clk_div));
    ledwater U_ledwater(.led(water_out),.clk(clk_div));
    always #(DELY/2) clk=~clk;//产生时钟波形
    initial begin
        clk=0;rst_n=0;
        #DELY rst_n=1;
        #((DELY*20)) $finish;
    end
endmodule
