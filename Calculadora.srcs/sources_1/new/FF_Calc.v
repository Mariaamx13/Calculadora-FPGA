`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.05.2023 10:50:45
// Design Name: 
// Module Name: FF_Calc
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


module FF_Calc
(
input clk,
input calc_ready,
output reg fix_ready
);
   always @(posedge clk) begin
      fix_ready <= calc_ready;
   end
endmodule
