`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2017 06:44:36 PM
// Design Name: 
// Module Name: Instruction_Memory
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


module Data_Memory
(
   input    [31:0] a,
   input    [31:0] di,
   input    we,
   output   [31:0] do
);

    reg [31:0] DataMemory [0:255];
    
     initial
     begin
        DataMemory[0]  <= 32'hA00000AA;
        DataMemory[4]  <= 32'h10000011;
        DataMemory[8]  <= 32'h20000022;
        DataMemory[12] <= 32'h30000033;
        DataMemory[16] <= 32'h40000044;
        DataMemory[20] <= 32'h50000055;
        DataMemory[24] <= 32'h60000066;                                
        DataMemory[28] <= 32'h70000077;
        DataMemory[32] <= 32'h80000088;
        DataMemory[36] <= 32'h90000099;
      end
         
      always @(a,di,we)
       begin 
        if(we)
           DataMemory[a] <= di;
       end
       
        assign do = DataMemory[a];

endmodule
