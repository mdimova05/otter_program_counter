`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2026 05:25:09 PM
// Design Name: 
// Module Name: PC_REGISTER
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


module PC_REGISTER(
    input logic CLK,
    input logic RST,
    input logic WE,
    input logic [31:0] DIN,
    output logic [31:0] COUNT);
    
    always_ff @(posedge CLK) begin
       if (RST==1) //synchronous reset
        COUNT <= 32'h00000000;
                
       else if (WE) //synchronous write
        COUNT <=DIN;
     end
endmodule
