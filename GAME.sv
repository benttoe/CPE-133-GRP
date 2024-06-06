`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Asha Smith 
// 
// Create Date: 05/21/2024 01:34:25 PM
// Design Name: 
// Module Name: GAME (High Level Module)
// Project Name: Precision Button Press
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
    
    clk_div2 CLK_DIV (.clk(CLK), .sclk(t1));   //slows down clock for LEDS to traverse the board
    seq_dvr DVR1 (.CLK(t1), .SWITCHES(SWITCHES), .LEDS(t2), .X(t3)); //takes state of SWITCHES and outputs LEDS sequence and value of switches one at a time
    SEQ_STORAGE SQS (.BTN(BT_0), .LEDS(t2), .CLK(t1), .SEQ(t4));  //if button is pressed, store the current state of LEDS
    seq_dvr DVR2 (.CLK(t1), .SWITCHES(t4), .X(t5));  //takes state of LEDS when button is pressed, outputs value of each bit one at a time
    FSM SEQ_DTR (.CLK(t1), .X(t3), .Y(t5), .Z(t6)); //compares LEDS and SWITCHES sequences, outputs 1 if they match
    Accumulator ACC (.clk(CLK), .LD({7'b0,t6}), .CLR(RST), .Q(t7)); //takes output of FSM to load accumulator, (adds 1 to each time for score)
    U_SSEG SSEG (.clk(CLK), .cnt1({{6{1'b0}}, t7}), .ssegs(SEG), .disp_en(AN));  //displays score on the screen
    assign LED = ~t2;
    
endmodule
