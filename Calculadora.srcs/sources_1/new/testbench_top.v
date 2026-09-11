`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.05.2023 12:08:14
// Design Name: 
// Module Name: testbench_top
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


module testbench_top(
);
reg clk;
reg RxD;
reg rst;

wire [7:0] Resultado;
wire [7:0] desb;
wire TxD;

top pruebita (
    .clk(clk),
    .RxD(RxD),
    .rst(rst), 
    .LED1(Resultado),
    .desb(desb),
    .TxD(TxD)

);


	initial begin
    clk = 0;
    rst = 0;
    RxD=1;
    
    #100 rst = 1;
    #100 rst = 0;
    
    #100000;
   
    #104166 RxD = 0;//start // Número 1
    #104166 RxD = 1;
    #104166 RxD = 0;
    #104166 RxD = 1;
    #104166 RxD = 0;
    #104166 RxD = 1;
    #104166 RxD = 0;
    #104166 RxD = 1;
    #104166 RxD = 0;
    #104166 RxD = 1; //stop
    
    #100000;
    
    #104166 RxD = 0;//start //Numero 2
    #104166 RxD = 0;
    #104166 RxD = 0;
    #104166 RxD = 1;
    #104166 RxD = 1;
    #104166 RxD = 1;
    #104166 RxD = 1;
    #104166 RxD = 0;
    #104166 RxD = 0;
    #104166 RxD = 1; //stop
    
    #100000;
    
    #104166 RxD = 0;//start //Operando
    #104166 RxD = 1; //LSB
    #104166 RxD = 1;
    #104166 RxD = 0;
    #104166 RxD = 1;
    #104166 RxD = 0;
    #104166 RxD = 1;
    #104166 RxD = 0;
    #104166 RxD = 0; //MSB
    #104166 RxD = 1; //stop
    
    
	
	
	end

always #5 clk = clk +1;

endmodule
