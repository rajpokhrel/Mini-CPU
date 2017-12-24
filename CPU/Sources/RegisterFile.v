`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2017 07:43:16 PM
// Design Name: 
// Module Name: RegisterFile
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


module RegisterFile
(
    //regfile takes 2 inputs and return 2 outputs
    input            clk,
    input   [4:0]    rs,
    input   [4:0]    rt,
    input   [4:0]    wm,
    input   [31:0]   d,
    input            we,
    output  [31:0]   qa,
    output  [31:0]   qb
                   
);
    reg [31:0] RegFile [31:0]; //declare the size of the regfile to be 31 by 31 bits

    always @(posedge clk)
    begin
          if(we)
          begin
              RegFile[wm] = d ;
           end
    end
    
    assign qa = RegFile[rs]; //store the first 5 bits in reg 1
    assign qb = RegFile[rt]; //store the second 5 bits in reg 2
    
    integer index;
    initial
    begin
     for(index = 0; index<32; index = index + 1)
    begin
            RegFile[index] = 32'b0;
     end
   end
endmodule
