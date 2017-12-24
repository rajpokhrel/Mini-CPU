`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/16/2017 03:14:18 PM
// Design Name: 
// Module Name: Mem_Mux
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


module Mem_Mux
 (
    input [31:0]    do,
    input [31:0]    r,
    input           wm2reg,
    output [31:0]   muxout

  );
  
  assign muxout = wm2reg ? do : r;
  
  
endmodule
