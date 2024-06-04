`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/21/2024 01:34:25 PM
// Design Name: 
// Module Name: GAME
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


module GAME(
    input CLK,
    input [7:0] SWITCHES,
    input BT_0,
    input RST, 
    output [3:0] AN,
    output [7:0] SEG,
    output [7:0] LED
    );
    
    logic t1, t3, t5, t6;
    
    logic [7:0] t2, t4, t7;
    
    clk_div2 CLK_DIV (.clk(CLK), .sclk(t1));
    seq_dvr DVR1 (.CLK(t1), .SWITCHES(SWITCHES), .LEDS(t2), .X(t3));
    SEQ_STORAGE SQS (.BTN(BT_0), .LEDS(t2), .CLK(t1), .SEQ(t4));
    seq_dvr DVR2 (.CLK(t1), .SWITCHES(t4), .X(t5));
    FSM SEQ_DTR (.CLK(t1), .X(t3), .Y(t5), .Z(t6));
    Accumulator ACC (.clk(CLK), .LD({7'b0,t6}), .CLR(RST), .Q(t7));
    U_SSEG SSEG (.clk(CLK), .cnt1({{6{1'b0}}, t7}), .ssegs(SEG), .disp_en(AN));
    assign LED = ~t2;
    
endmodule
