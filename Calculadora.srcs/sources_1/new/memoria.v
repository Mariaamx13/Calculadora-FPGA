`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.05.2023 15:06:18
// Design Name: 
// Module Name: memoria
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


module shiftregister(
input clk,
input rst,
input en,
input [7:0] din,
output reg [7:0] reg1, reg2, reg3
);



	always@(posedge clk)
	begin
	if (rst) begin
	reg1 <= 8'b0000;
	reg2 <= 8'b0000;
	reg3 <= 8'b0000;
	end
	else
	if (en) begin
	reg1 <= din;
	reg2 <= reg1;
	reg3 <= reg2;

	end
	end

	
endmodule