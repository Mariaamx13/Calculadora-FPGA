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


module top
(
	input clk,
	input rst,
	input RxD,
	output [7:0] LED1,
	output desb,
	output TxD
	);
	
	wire tick;
	wire rx_done_tick; 
	wire mux_ready;
	wire mux_ready_fix;
	wire tx_done_tick; 
	wire BD;
	
	wire [7:0] op, num1, num2, resultado;
	wire [7:0] datos_rx;
	
	assign LED1 = resultado;
	assign desb = BD;
	
baudrate_gen generador(
	
	.clk(clk), 
    .rst(rst),
    .tick(tick)
    );
	
Receptor receptor_uart(
            .clk(clk),
            .rst(rst),
            .RxD(RxD),
            .tick(tick),
            .rx_ready(rx_done_tick),
            .datos_rx(datos_rx)
         );


shiftregister SIPO(
    .clk(clk),
    .rst(rst),
    .en(rx_done_tick),
    .din(datos_rx),
    .reg1(op), // puente
    .reg2(num2),
    .reg3(num1)
);  
Multiplexor Calculo_Operaciones(
.A(num1),
.B(num2),
.sel(datos_rx),
.resultado(resultado),
.mux_ready(mux_ready),
.desbordamiento(BD)

);

FF_Calc mux_ready_rx(
.clk(clk),
.calc_ready(mux_ready),
.fix_ready(mux_ready_fix)
);

Transmisor TransmisorUART(
.clk(clk),
.rst(rst),
.tx_en(mux_ready_fix),
.tick(tick),
.resultado(resultado),
.TxD(TxD));



endmodule
