`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2017 08:27:53 PM
// Design Name: 
// Module Name: CPU_TB
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


module CPU_TB();
       //All the inputs and outputs from the CPU module 
       reg clk;
       wire [31:0] currentPC;
       wire [31:0] IF_ID;
       wire [108:0] ID_EXE;
       wire [71:0] EXE_MEM;
       wire [70:0] MEM_WB;


    CPU testCPU //instaces the CPU module
    (
        .clk(clk),
        .currentPC(currentPC),
        .IF_ID(IF_ID),
        .ID_EXE(ID_EXE),
        .EXE_MEM(EXE_MEM),
        .MEM_WB(MEM_WB)
    );
   
    initial 
        begin 
            clk = 'b0;
        end 

    always
    begin 
        #5 clk = ~clk;
    end
endmodule
