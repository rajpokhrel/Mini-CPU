`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 10/26/2017 08:53:19 PM
// Design Name:
// Module Name: InstructionMemory
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


module InstructionMemory
(
    input       [31:0]  address, //get the address from the counter
    output      [31:0]  InstOut   //set the instuction out
);
    reg [31:0] InstructionMem[0:255]; //declare the size of the IM 31 by 31 bits

    initial
    begin
      InstructionMem[100] = 32'h8c220000; //first store instruction
      InstructionMem[104] = 32'h8c230004; //second strore instruction
      InstructionMem[108] = 32'h8c240008;
      InstructionMem[112] = 32'h8c25000c;
      InstructionMem[116] = 32'h004A3020;
    end
    
       assign InstOut = InstructionMem[address]; //set the instruction
endmodule
