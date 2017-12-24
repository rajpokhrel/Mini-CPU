`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2017 07:41:37 PM
// Design Name: 
// Module Name: ControlUnit
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


module ControlUnit
(
    //control units takes 2 inputs and returns 6 outputs
    input          [5:0]    opcode,
    input          [5:0]    fun,
    output reg              writereg,
    output reg              memory2reg,
    output reg              WMEM,
    output reg [3:0]        ALUcontrol,
    output reg              ALUImm,
    output reg              regrt 
    
 );
       always @(opcode, fun) begin
        case(opcode)
           6'b000000: begin //load word
           case(fun)
           6'b100000: begin //add
           writereg      <= 'b1; //lw = false
           memory2reg    <= 'b0; // lw = true
           WMEM          <= 'b0; // lw = true
           ALUcontrol    <= 4'b0010; //lw = 2
           ALUImm        <= 'b0;  // lw = false
           regrt         <= 'b0;  // lw = true
           end 
           endcase
           end
           
           6'b100011: begin //loward
           writereg      <= 'b1; //lw = false
           memory2reg    <= 'b1; // lw = true
           WMEM          <= 'b0; // lw = true
           ALUcontrol    <= 4'b0010; //lw = 2
           ALUImm        <= 'b1;  // lw = false
           regrt         <= 'b1;  // lw = true
           end
                
        endcase
        end
endmodule
