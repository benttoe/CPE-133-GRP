`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly CPE 133
// Engineer: Brycen Jermagian
// 
// Create Date: 06/03/2024 01:55:40 PM
// Module Name: SEQ_STORAGE + FSM
// Project Name: Precision Button Press
// Target Devices: 
// Tool Versions: 
// Description:
// We combined the sequence storage and the fsm to fix the timing issues caused by keeping them separate.
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
      

    
    always_ff @(posedge CLK) begin //Button press only does something on the clock cycle to avoid timing issues
      
        PS <= NS;
        
        //Detects falling edge of the button (GO is only 1 if the button is being unpressed)
        if ((BTN != BT) & (BT == 1'b0)) GO <= 1;
        
        else GO <= 0;
        
        BT <= BTN; //sets the variable BT to be the current state of the button to be used for comparison next clock cycle
        
    end   
    

//State Play: Z = 0; 
        //If: GO == 1, SEQ = LEDS; SEQ2 = SW; Go to state A Else: Stay in PLAY    
//States A - H:  Z = 0;
          //If: The bit respective bit of SEQ and SEQ2 match, Go to the next state Else: Go back to PLAY  
//State FIN: Z = 1; 
       //Go back to PLAY 
//Default: PLAY
    
    always_comb begin
        
        Z = 0;
        
        case(PS)
            
            PLAY:begin
            
            Z = 0;
            
                if (GO) begin NS = A; SEQ = LEDS; SEQ2 = SW; end // stores the current positions of the switches and LEDs in temporary variables
            
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
            
            Z = 1; // Sequences match

            
            NS = PLAY;
            
            end
            
            default NS = PLAY;
            
    endcase      
      
    end 
    
endmodule
