`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly CPE 133
// Engineer: Nick Grant
// 
// Create Date: 06/03/2024 01:55:40 PM
// Module Name: SEQ_STORAGE
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

//declaring in/out
module SEQ_STORAGE(
    input BTN,
    input [7:0] LEDS,
    input CLK,
    output logic [7:0] SEQ = 0 //initialize SEQ to be 0 by default
    );
    
    

    
    always_ff @(posedge CLK) begin //button press only does something on the clock cycle to avoid timing issues
     
        if(BTN)
            SEQ <= LEDS; //if the button is pressed the output becomes the position of the moving LED represented as an 8 bit sequence
        else SEQ <= 8'b0; //otherwise the sequence becomes 8 0s: this guarantees that the FSM will always return 0 if the button is never pressed. 
        
    end   
    
   
    
endmodule
