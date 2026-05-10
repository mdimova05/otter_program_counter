`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly
// Engineer: Maria Dimova
// 
// Create Date: 04/14/2026 01:19:13 PM
// Design Name: 
// Module Name: OTTER_PC
// Project Name: Otter Program Counter
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


module OTTER_PC(
    input PCM_RST,
    input PCM_CLK,
    input PCM_WE,
    input [1:0] PCM_SEL,
    input [31:0] PCM_JALR,
    input [31:0] PCM_JAL,
    input [31:0] PCM_BRANCH,
    output [31:0] PCM_PLUS4,
    output logic [31:0] PCM_COUNT);
    
    logic [31:0] PC_DIN;
    logic[31:0] PCMUX_OUT;
    
    assign PCM_PLUS4 = PCM_COUNT + 32'd4;
  
    always_comb begin
        case(PCM_SEL)
        2'd0: PCMUX_OUT = PCM_PLUS4;
        2'd1: PCMUX_OUT= PCM_JALR;
        2'd2: PCMUX_OUT = PCM_BRANCH;
        2'd3: PCMUX_OUT= PCM_JAL;
        default: PCMUX_OUT = 32'h00000000;
        endcase
        end
        
     assign PC_DIN = PCMUX_OUT;
     
     PC_REGISTER PC_reg(
        .CLK(PCM_CLK),
        .RST(PCM_RST),
        .WE(PCM_WE),
        .DIN(PC_DIN),
        .COUNT(PCM_COUNT));
    
    endmodule
