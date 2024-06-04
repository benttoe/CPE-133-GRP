`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/03/2024 01:55:40 PM
// Design Name: 
// Module Name: SEQ_STORAGE
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


module SEQ_STORAGE(
    input BTN,
    input [7:0] LEDS,
    input CLK,
    output logic [7:0] SEQ = 0
    );
    
    

    
    always_ff @(posedge CLK)begin
     
    if(BTN)
        SEQ <= LEDS;
    else SEQ <= 8'b0;
        
    end   
    
   
    
endmodule
