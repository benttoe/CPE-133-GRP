`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 010/31/1024 12:37:110 AM
// Design Name: 
// Module Name: TBFSM
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


module TBFSM();
    logic TBCLK;
    logic TBX;
    logic TBY;
    logic TBZ;
    
    FSM UUT (.CLK(TBCLK), .X(TBX), .Y(TBY), .Z(TBZ)); 
    
    initial begin
        TBCLK = 0;
    end
    
    always begin
        #5 TBCLK = ~TBCLK;
    end
    
    always begin
        
        TBX = 0;
        TBY = 0;
    
    #10 TBX = 1;
        TBY = 1;
        
    #10 TBX = 0;
        TBY = 0;
    
    #10 TBX = 0;
        TBY = 0;
        
    #10 TBX = 0;
        TBY = 0;
    
    #10 TBX = 0;
        TBY = 0;
        
    #10 TBX = 0;
        TBY = 0;
    
    #10 TBX = 1;
        TBY = 1;
        
        ////////
        
    #10 TBX = 0;
        TBY = 0;
    
    #10 TBX = 0;
        TBY = 0;
        
    #10 TBX = 0;
        TBY = 0;
    
    #10 TBX = 0;
        TBY = 0;
        
    #10 TBX = 0;
        TBY = 0;
    
    #10 TBX = 0;
        TBY = 0;
        
    #10 TBX = 1;
        TBY = 0;
    
    #10 TBX = 0;
        TBY = 1;
        
        
        
    end   
    
endmodule
