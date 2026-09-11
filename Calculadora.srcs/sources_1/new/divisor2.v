`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.05.2023 01:15:25
// Design Name: 
// Module Name: divisor2
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


module divisor2( //arquitectura CSM complemented-sum minimized). Se implementa la operación de resta y se genera un acarreo para calcular la siguiente iteración en la operación de división
input wire A,   
input wire B,   
input wire b_i,    
input wire os,  //sel que escoje si la salida es el resultado de la resta o el carry.
output wire d,    //resultado de resta
output wire bo  //resultado de carry
); 

    wire d1 = A ^ B ^ b_i;
	 assign d = (os & A) + (~os & d1);
	 assign bo = (~A & B) + (b_i & (~(A ^ B)));
endmodule