`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly
// Engineer: Brycen? Asha?
// 
// Create Date: 05/30/2024 02:31:44 PM
// Design Name: 
// Module Name: FSM
// Project Name: PBP
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
//State A: If X == Y, V = 1; Else: V = 0; Go to the next state regardless
//States B - H: If X == Y && V, V = 1; Else: V = 0; Go to the next state regardless
//State FINl: Z = V; If: Z = 1, Delay: 800 ns, V = V; Else: V = v; Go back to A
    
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
            
            if (Z) begin #800 V = V; end
            
            else begin V = V; end
            
            NS = A;
            
            end
            
            default NS = A;
            
    endcase      
      
    end 
            
endmodule
