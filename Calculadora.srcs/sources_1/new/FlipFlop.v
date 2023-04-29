`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.04.2023 18:09:22
// Design Name: 
// Module Name: flipflop
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


module flipflop(
    input clk,
    input [7:0] datoRx,
    input [1:0] direc,
    input write_en,
    output [7:0] data_out_0,
    output [7:0] data_out_1,
    output [7:0] data_out_2
);

reg [7:0] reg_file [0:2];

always @ (posedge clk)
begin
  if (write_en)
    reg_file[direc] <= datoRx;
end

assign data_out_0 = (direc == 2'b00) ? reg_file[0] : (direc == 2'b01) ? reg_file[1] : reg_file[2];
assign data_out_1 = (direc == 2'b10) ? reg_file[0] : (direc == 2'b00) ? reg_file[1] : reg_file[2];
assign data_out_2 = (direc == 2'b01) ? reg_file[0] : (direc == 2'b10) ? reg_file[1] : reg_file[2];

endmodule