`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.04.2023 23:47:27
// Design Name: 
// Module Name: top
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


module top(
    input clk,
    input rst,
    input RxD

    );
    
    wire [7:0] datos_rx;
    wire write_en;
    wire [1:0] direc;
    wire [7:0] data_out_0;
    wire [7:0] data_out_1;
    wire [7:0] data_out_2;
    
    assign direc = 2'b00;
    assign write_en = |{datos_rx};
      
    Receptor receptorUART(
        .clk(clk),
        .rst(rst),
        .RxD(RxD),
        .datos_rx(datos_rx)
    );
    
    flipflop memoria(
        .clk(clk),
        .datoRx(datos_rx),
        .write_en(write_en),
        .direc(direc),
        .data_out_0(data_out_0),
        .data_out_1(data_out_1),
        .data_out_2(data_out_2)
    );
    
endmodule
