`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2017 12:39:08 PM
// Design Name: 
// Module Name: ALU
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


module ALU
(
      input [31:0] A,
      input [31:0] B,
      input [3:0] ealuc,
      output reg [31:0] result
);

    always @(A,B,ealuc)
    begin
    case(ealuc)
      0:   result <= A & B;
      1:   result <= A & B;
      2:   result <= A + B;
      6:   result <= A - B;
      7:   result <= A < B ? 1:0;
      12:  result <= ~(A|B);
    endcase
    end
endmodule
