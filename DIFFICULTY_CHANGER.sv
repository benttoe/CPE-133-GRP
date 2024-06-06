`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly
// Engineer: Nick Grant CPE 133
// 
// Create Date: 06/06/2024 12:21:36 PM
// Design Name: 
// Module Name: DIFFICULTY_CHANGER
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


module DIFFICULTY_CHANGER(
    input CLK,
    input CLK1,
    input CLK2,
    input SW,
    output logic MODE
    );    
    
    always_comb begin
    
        if (SW) begin
        
            MODE = CLK1;    
        
        end
        
        else MODE = CLK2;
        
   end
    
endmodule
