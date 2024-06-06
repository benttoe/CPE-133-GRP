`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly CPE 133
// Engineer: Brycen Jermagian
// 
// Create Date: 6/3/1024 12:37:110 AM
// Design Name: 
// Module Name: TBFSM
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


module TBFSM(); //in/out
    logic BTN;
    logic [7:0] LEDS;
    logic [7:0] SW;
    logic [7:0] SEQ = 0;
    logic [7:0] SEQ2 = 0; 
    logic TBCLK;
    logic TBZ;
    
    
    //set up UUT connection
    SEQ_DTR UUT (.CLK(TBCLK), .BTN(BTN), .Z(TBZ), .LEDS(LEDS), .SEQ(SEQ), .SW(SW), .SEQ2(SEQ2)); 
    
    //clock signal
    initial begin
        TBCLK = 0;
    end
    
    always begin
        #5 TBCLK = ~TBCLK;
    end
    
    //test cases
    always begin
      
    // button pressed on time
      
        LEDS = 8'b10000000;
        BTN = 0;
        SW = 8'b00010000;
        
   #10  LEDS = 8'b01000000;
        BTN = 0;
        SW = 8'b00010000;
        
   #10  LEDS = 8'b00100000;
        BTN = 1;
        SW = 8'b00010000;
             
   #10  LEDS = 8'b00010000;
        BTN = 0;
        SW = 8'b00010000;
   
   #10  LEDS = 8'b00001000;
        BTN = 0;
        SW = 8'b00010000;
   
   #10  LEDS = 8'b00000100;
        BTN = 0;
        SW = 8'b00010000;             
        
   #10  LEDS = 8'b00000010;
        BTN = 0;
        SW = 8'b00010000;
        
   #10  LEDS = 8'b00000001;
        BTN = 0;
        
             
   #10  LEDS = 8'b01000000;
        BTN = 0;
        
   //button not pressed on time
        
   #10  LEDS = 8'b10000000;
        BTN = 0;
        SW = 8'b00010000;
        
   #10  LEDS = 8'b01000000;
        BTN = 0;
        SW = 8'b00010000;
        
   #10  LEDS = 8'b00100000;
        BTN = 0;
        SW = 8'b00010000;
             
   #10  LEDS = 8'b00010000;
        BTN = 0;
        SW = 8'b00010000;
   
   #10  LEDS = 8'b00001000;
        BTN = 1;
        SW = 8'b00010000;
   
   #10  LEDS = 8'b00000100;
        BTN = 0;
        SW = 8'b00010000;             
        
   #10  LEDS = 8'b00000010;
        BTN = 0;
        SW = 8'b00010000;
        
   #10  LEDS = 8'b00000001;
        BTN = 0;
        
             
   #10  LEDS = 8'b01000000;
        BTN = 0;
             
    end   
    
endmodule
