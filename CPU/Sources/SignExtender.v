`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2017 10:35:01 AM
// Design Name: 
// Module Name: SignExtender
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


module SignImm
(
    //sign extender takes 1 input and return 1 output
    input [15:0] immed,
    output [31:0] extended    
);
     assign extended = {{16 {immed[15]}}, immed[15:0]}; //assign the output to specific bits   
 
endmodule
