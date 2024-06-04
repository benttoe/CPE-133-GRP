`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/19/2024 02:31:44 PM
// Design Name: 
// Module Name: FSM
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


module FSM(
    input CLK,
    input X,
    input Y, 
    output logic Z
    );
    
    typedef enum {A, B, C, D, E, F, G, H, FIN}STATES;
    
    STATES PS, NS;
    
    always_ff@(posedge CLK) begin
    
        PS <= NS;
        
    end
    
    always_comb begin
        
        Z = 0;
        
        case(PS)
        
            A:begin
            
            Z = 0;
            
            if (X == Y) NS = B;
            
            else NS = A;
            
            end
            
            B:begin
            
            Z = 0;
            
            if (X == Y) NS = C;
            
            else NS = A;
            
            end
            
            C:begin
            
            Z = 0;
            
            if (X == Y) NS = D;
            
            else NS = A;
            
            end
            
            D:begin
            
            Z = 0;
            
            if (X == Y) NS = E;
            
            else NS = A;
            
            end
            
            E:begin
            
            Z = 0;
            
            if (X == Y) NS = F;
            
            else NS = A;
            
            end
            
            F:begin
            
            Z = 0;
            
                if (X == Y) NS = G;
            
            else NS = B;
            
            end    
            
            G:begin
            
            Z = 0;
            
            if (X == Y) NS = H;
            
            else NS = B;
            
            end    
            
            H:begin
            
            Z = 0;
            
            if (X == Y) NS = FIN;
            
            else NS = B;
            
            end
            
            FIN:begin
            
            Z = 1;
            
            #1000
            
            NS = A;
            
            end
            
            default NS = A;
            
    endcase      
      
    end 
            
endmodule
