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
    
    input CLK,
    output LD,
    output logic [7:0] SEQ
    );
    
    
    typedef enum {A, B, C, D, E, F, G, H, FINISH}STATES;
    STATES PS, NS;
    
    always_ff @(posedge CLK)begin
        PS <= NS;
    end
    
    always_comb begin
    SEQ = 8'b0;
    case(PS) 
        A: begin
            SEQ = 8'b0;
            if(BTN)SEQ = 8'd1;
            else SEQ = 8'b0;
            NS = B;
        end
        
        B: begin
           if(BTN) SEQ = 8'd2;
           else SEQ = 8'b0;
           NS = C;
        end
    
        C: begin
           if(BTN) SEQ = 8'd4;
           else SEQ = 8'b0;
           NS = D;
        end
    
        D: begin
           if(BTN) SEQ = 8'd8;
           else SEQ = 8'b0;
           NS = E;
        end
    
        E: begin
           if(BTN) SEQ = 8'd16;
           else SEQ = 8'b0;
           NS = F;
        end
    
        F: begin
           if(BTN) SEQ = 8'd32;
           else SEQ = 8'b0;
           NS = G;
        end
    
        G: begin
           if(BTN) SEQ = 8'd64;
           else SEQ = 8'b0;
           NS = H;
        end
        
        H: begin
           if(BTN) SEQ = 8'd128;
           else SEQ = 8'b0;
           NS = A;
        end
        
        default: NS = A;
        endcase
        
      end  
    
endmodule
