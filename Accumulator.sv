`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Bridget Benson 
// Create Date: 10/26/2018 12:57:18 PM
// Description: 8 bit acculumator.  Adds new value to the
// current value when LD is 1.  
//////////////////////////////////////////////////////////////////////////////////


module Accumulator(
    input clk, LD, CLR,
    input [7:0] D = 1, //modified so that D is always 1 (Accumulator will always add 1 to the score)
    output logic [7:0] Q = 0
    );

    //rest of module...

endmodule
