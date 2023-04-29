`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.04.2023 20:37:33
// Design Name: 
// Module Name: Calculadora
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


module Calculadora(
  input clk,
  input reset,
  input RxD,
  
  output reg [7:0] resultado
);

    reg [7:0] num1;
    reg [7:0] num2;
    reg [7:0] op;
    reg [7:0] rx_data;
    
  // Instanciar el módulo Receptor con los datos de UART
  Receptor uart_rx (
    .clk(clk),
    .reset(reset),
    .RxD(RxD),
    .datos(rx_data)
  );

  // Instanciar el módulo data handler
  data_handler handler (
    .clk(clk),
    .reset(reset),
    .dato_ingresado(rx_data),
    .num1(num1),
    .num2(num2),
    .op(op)
  );
endmodule
