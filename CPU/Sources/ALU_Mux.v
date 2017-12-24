`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2017 06:42:30 PM
// Design Name: 
// Module Name: ALU_Mux
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


module ALU_Mux
(
         input   [31:0]   in1, 
         input   [31:0]   in2,
         input           selector,
         output  [31:0]   muxoutput
);
       
        assign muxoutput = selector ? in2 : in1; //if the selector is true pick in1 else in2
       

endmodule
