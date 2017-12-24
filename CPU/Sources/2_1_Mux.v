`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/30/2017 10:25:06 PM
// Design Name: 
// Module Name: 2_1_Mux
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

module Mux
( 
    //mux takes in 3 inputs and return 1 outputs 
    input   [4:0]   in1, 
    input   [4:0]   in2,
    input           selector,
    output  [4:0]   muxoutput
);
    assign muxoutput   = selector? in2 : in1; //if the selector is true pick in1 else in2
   
endmodule
