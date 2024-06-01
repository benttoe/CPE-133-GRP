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
    output logic V,
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
            
            if ((X == Y)) V = 1;
            
            else V = 0;
            
            NS = B;
            
            end
            
            B:begin

            Z = 0;
            
            if ((X == Y) & V) V = 1;
            
            else V = 0;
            
            NS = C;
            
            end
            
            C:begin

            Z = 0;
            
            if ((X == Y) & V) V = 1;
            
            else V = 0;
            
            NS = D;
            
            end
            
            D:begin
            
            Z = 0;
            
            if ((X == Y) & V) V = 1;
            
            else V = 0;
            
            NS = E;
            
            end
            
            E:begin
            
            Z = 0;
            
            if ((X == Y) & V) V = 1;
            
            else V = 0;
            
            NS = F;
            
            end
            
            F:begin
            
            Z = 0;
            
            if ((X == Y) & V) V = 1;
            
            else V = 0;
            
            NS = G;
            
            end    
            
            G:begin
            
            Z = 0;
            
            if ((X == Y) & V) V = 1;
            
            else V = 0;
            
            NS = H;
            
            end    
            
            H:begin
            
            Z = 0;
            
            if ((X == Y) & V) V = 1;
            
            else V = 0;
            
            NS = FIN;
            
            end
            
            FIN:begin
            
            Z = V;
            
            //#1000
            
            NS = A;
            
            end
            
            default NS = A;
            
    endcase      
      
    end 
            
endmodule
