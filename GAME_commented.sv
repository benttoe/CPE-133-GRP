`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly CPE 133
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


module GAME( //in/out for the overall
    input CLK,
    input [7:0] SWITCHES,
    input BT_0,
    input DSW,
    input RST, 
    output [3:0] AN,
    output [7:0] SEG,
    output [7:0] LED
    );

    //define logic connections 
    
    logic t0, t1, t3, t5, t6, t9; 
    
    logic [7:0] t2, t4, t7, t8;

    clk_div1 CLK_EASY (.clk(CLK), .sclk(t0)); //clock that runs at the slower speed and moves the LEDs at this speed
    clk_div2 CLK_HARD (.clk(CLK), .sclk(t1)); //clock that runs at the faster speed and moves the LEDs at this speed
    DIFFICULTY_CHANGER DIFF (.CLK(CLK), .CLK1(t0), .CLK2(t1), .SW(DSW), .MODE(t9)); // Outputs the clock from one of the clock dividers depending on the position of the switch DSW
    seq_dvr DVR1 (.CLK(t1), .SWITCHES(SWITCHES), .LEDS(t2), .X(t3)); //outputs LEDS sequence one bit at a time to the board
    SEQ_DTR SQD (.BTN(BT_0), .LEDS(t2), .SW(SWITCHES), .CLK(CLK), .SEQ(t4), .Z(t6)); // Sequence detector--On the falling edge of the button press, 
                                                                                     // stores the current positions of the LEDs and switches as 8 bit sequences,
                                                                                     // then compares the two using an FSM, outputting 1 if the sequences are identical
    Accumulator ACC (.clk(CLK), .LD({7'b0,t6}), .CLR(RST), .Q(t7)); //takes output of FSM to add 1 to accumulator for score, reset clears score
    U_SSEG SSEG (.clk(CLK), .cnt1({{6{1'b0}}, t7}), .ssegs(SEG), .disp_en(AN));  //displays score on the screen
    assign LED = ~t2; //0 values = LED turned on
    
endmodule
