`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2017 07:12:29 PM
// Design Name: 
// Module Name: Adder
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


module PC
(   
    input   [31:0]  input1,//first input
    output  wire [31:0]  sum //output signal as sum
);
    parameter [31:0] input2 = 32'b100; //declare constant 4
    assign sum = input1 + input2; //add input 1 and 2
   
endmodule
