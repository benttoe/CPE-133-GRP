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
    input [7:0] SW,
    input CLK,
    output logic [7:0] SEQ = 0, //initialize SEQ to be 0 by default,
    output logic [7:0] SEQ2 = 0,
    output logic BT = 0,
    output logic GO = 0,
    output logic Z
    );
    
    typedef enum {PLAY, A, B, C, D, E, F, G, H, FIN}STATES;
    
    STATES PS, NS;
      

    
    always_ff @(posedge CLK) begin //button press only does something on the clock cycle to avoid timing issues
      
        PS <= NS;
        
        
        if ((BTN != BT) & (BT == 1'b0)) GO <= 1;
        
        else GO <= 0;
        
        BT <= BTN;
        
    end   
    

//State A: If X == Y, V = 1; Else: V = 0; Go to the next state regardless
//States B - H: If X == Y && V, V = 1; Else: V = 0; Go to the next state regardless
//State FINl: Z = V; If: Z = 1, Delay: 800 ns, V = V; Else: V = v; Go back to A
//Default: A
    
    always_comb begin
        
        Z = 0;
        
        case(PS)
            
            PLAY:begin
            
            Z = 0;
            
            if (GO) begin NS = A; SEQ = LEDS; SEQ2 = SW; end
            
            else NS = PLAY;
            
            end
            
            A:begin

            Z = 0;
            
            if ((SEQ2[0] == SEQ[0])) NS = B;

            
            else NS = PLAY;
            
            end
            
            B:begin

            Z = 0;
            
            if ((SEQ2[1] == SEQ[1])) NS = C;

            
            else NS = PLAY;
            
            end
            
            C:begin

            Z = 0;
            
            if ((SEQ2[2] == SEQ[2])) NS = D;
            

            
            else NS = PLAY;
            
            end
            
            D:begin
            
            Z = 0;
            
            if ((SEQ2[3] == SEQ[3])) NS = E;
            

            
            else NS = PLAY;
            
            end
            
            E:begin
            
            Z = 0;
            
            if ((SEQ2[4] == SEQ[4])) NS = F;
            

            
            else NS = PLAY;
            
            end
            
            F:begin
            
            Z = 0;
            
            if ((SEQ2[5] == SEQ[5])) NS = G;
            

            
            else NS = PLAY;
            
            end    
            
            G:begin
            
            Z = 0;
            
            if ((SEQ2[6] == SEQ[6])) NS = H;
            

            
            else NS = PLAY;
            
            end    
            
            H:begin
            
           Z = 0;
            
            if ((SEQ2[7] == SEQ[7])) NS = FIN;
            

            
            else NS = PLAY;
            
            end
            
            FIN:begin
            
            Z = 1;
            
            //#800 
            
            NS = PLAY;
            
            end
            
            default NS = PLAY;
            
    endcase      
      
    end 
    
endmodule
