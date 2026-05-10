`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly
// Engineer: Maria Dimova
// 
// Create Date: 04/14/2026 01:59:13 PM
// Design Name: 
// Module Name: OTTER_PC_TB
// Project Name: Otter Program Counter Test Bench
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


module OTTER_PC_TB;
    logic TB_RST;
    logic TB_CLK;
    logic TB_WE;
    logic [1:0] TB_SEL;
    logic [31:0] TB_JALR;
    logic [31:0] TB_JAL;
    logic [31:0] TB_BRANCH;
    logic [31:0] TB_COUNT;
    logic [31:0] TB_PLUS4;
    
    OTTER_PC UUT(.PCM_RST(TB_RST), .PCM_CLK(TB_CLK), .PCM_WE(TB_WE), .PCM_SEL(TB_SEL),.PCM_JALR(TB_JALR),
                 .PCM_JAL(TB_JAL), .PCM_BRANCH(TB_BRANCH), .PCM_COUNT(TB_COUNT), .PCM_PLUS4(TB_PLUS4));
    
    always begin 
    #5 TB_CLK = ~TB_CLK;
    end
    
    initial begin
    TB_RST = 1;
    TB_CLK =0;
    TB_WE =0;
    TB_SEL = 2'd0;
    TB_JALR = 32'h00000000;
    TB_JAL = 32'h00000000;
    TB_BRANCH = 32'h00000000;
    
    //test if reset works
    #12;
    TB_RST = 0;
    TB_WE = 1;
    
    //test that +4 works
    TB_SEL = 2'd00;
    #10;
    
    //test that +4 works properly after already adding 4 
    TB_SEL = 2'd00;
    #10;
    
    //test that select JALR works
    TB_JALR= 32'h00000020;
    TB_SEL= 2'd01;
    #10;
    
    //test that select JAL works
    TB_JAL = 32'h00000040;
    TB_SEL=2'd11;
    #10;
    
    TB_BRANCH = 32'h00000060;
    TB_SEL = 2'd10;
    #10;
    
    //test that select write enable works
    TB_WE = 0;
    TB_SEL = 2'd00;
    #10;
    
    //test if overflowing the value will cause count to go back to 0 
    TB_RST= 0;
    TB_WE= 1;
    TB_SEL= 2'd1;
    TB_JALR= 32'hFFFFFFFC;
    TB_JAL= 32'h00000000;
    TB_BRANCH = 32'h00000000;
    #10;

    //test overflow +4
    TB_RST = 0;
    TB_WE= 1;
    TB_SEL= 2'd0;
    #10;
    
    $finish;
    
    end
endmodule
