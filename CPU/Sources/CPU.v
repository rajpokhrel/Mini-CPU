`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Penn State
// Engineer: Raj Pokhrel
// 
// Create Date: 11/03/2017 08:01:07 PM
// Design Name: CPU
// Module Name: CPU
// Project Name: Lab 5
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

module CPU
(
    //set the input as clk everthing else as a wire
      input clk,
      output reg [31:0] currentPC,
      output reg [31:0] IF_ID,
      output reg [108:0] ID_EXE,
      output reg [71:0] EXE_MEM,
      output reg [70:0] MEM_WB
 ); 
        //temporary registers to hold to value of the new outpout of the register
        reg aluout,ewreg,em2reg,ewmem,mwreg,mm2reg,mwmem, wm2reg,wwreg,ealuimm, finalmux;
        reg [3:0] ealuc;
        reg [4:0] emuxout,mmuxout,regmux; 
        reg [31:0] IF, NewR,Newqa,Newqb,mNewqb, Newimm,NewNewImm, newdo, RR, Newmux, wNewR,Newdo;  
        
        //tempory wires to hold to output of the different components
        wire wreg, m2reg, wmem,aluimm, regrt;
        wire [3:0] aluc;
        wire [4:0] rd,rt,rs,muxout;
        wire [5:0] opcode, funct;
        wire [15:0] imm;
        wire [31:0] IMOut,immediate,qa, qb, NewPC, do, ALUMuxOut, ALUOutput, wmuxout;
      
       
       //assign each bit 
        assign opcode = IF[31:26];
        assign  funct = IF[5:0];
        assign  rs = IF[25:21];
        assign  rd = IF[15:11];
        assign  rt = IF[20:16];
        assign  imm = IF[15:0];    
           
       // wire ealuimm = ID_EXE[101];
           
         //wire finalmux = MEM_WB[68:64];
        //instance the Program counter
        PC add(currentPC,NewPC);
        //instance the instruction Memory
        InstructionMemory IM(currentPC,IMOut);
        //instance the control unit       
        ControlUnit control(opcode,funct,wreg,m2reg,wmem,aluc,aluimm,regrt);
         //instance register file
        RegisterFile regfile(clk,rs,rt,regmux,wmuxout,wwreg,qa,qb);
         //instance the mux
        Mux multiplexer(rd,rt, regrt, muxout);
         //instance the Program sign immediate
        SignImm sign(imm,immediate);
         //instance the alu mux
        ALU_Mux alumux (Newqb,Newimm,ealuimm,ALUMuxOut);
         //instance the ALU
        ALU alu (Newqa,ALUMuxOut,ealuc, ALUOutput);
         //instance the Data memory
        Data_Memory DM (NewR,mNewqb,mwmem,do);
        //instance the newmux
        Mem_Mux newmux(Newdo,wNewR,wm2reg,wmuxout);
              
        
       initial
        begin 
            currentPC = 100; //set the program counter to 100        
        end


          always @(posedge clk)    
           begin
               //strore all the vales in the register on the posedge clk              
                IF <= IMOut;
                currentPC <= NewPC;
                ewreg <= wreg;
                em2reg <= m2reg;
                ewmem <= wmem;
                emuxout <= muxout;
                mmuxout <= emuxout;
                ealuc <= aluc;
                Newimm <= imm;
                NewNewImm <= Newimm;
                Newqa <= qa;
                Newqb <= qb;
                NewR <= ALUOutput;   
                mwreg <= ewreg;
                mm2reg <= em2reg;
                mwmem  <= ewmem;  
                mNewqb <= Newqb; 
                wm2reg <= mm2reg;
                wNewR  <= NewR;
                Newdo  <= do;
                regmux <= mmuxout;
                wwreg <= mwreg;
                ealuimm <= aluimm;
                finalmux <= mmuxout;
               
               //concatnate all outputs to a single register    
               IF_ID[31:0]     <= IMOut;            
               ID_EXE[108:0]   <= {wreg,m2reg,wmem,aluc,aluimm,muxout,qa,qb,immediate};
               EXE_MEM[71:0]   <= {ewreg,em2reg,ewmem,emuxout,ALUOutput,Newqb};
               MEM_WB[70:0]    <= {mwreg,mm2reg,mmuxout,NewR,do};
              
            end                  
 endmodule
         