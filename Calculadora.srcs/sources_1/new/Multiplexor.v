`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.05.2023 16:28:57
// Design Name: 
// Module Name: Multiplexor
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


module Multiplexor(
input [7:0] sel, A, B,
output reg [7:0] resultado,
output reg mux_ready,
output reg desbordamiento
    );
    
    
    wire [7:0] res_sum, res_res, res_mul,res_div, residuo;
    wire des_sum, des_mul;
    
    initial begin
    mux_ready = 0;
    end

    

Suma Suma(
    .A(A),
    .B(B),
    .S(res_sum),
    .D(des_sum)
);    
    
Resta Resta(
    .A(A),
    .B(B),
    .R(res_res)
);  
    
Multiplicador Multiplicador(
    .A(A),
    .B(B),
    .S(res_mul),
    .D(des_mul)
    );    
    
divisor Divisor(
.A(A),
.B(B),
.resultado(res_div),
.r(residuo)
);
    
always @(*)
    case (sel)
    8'b00101011: begin //suma
    resultado = res_sum;
    desbordamiento = des_sum;
    mux_ready =1;
    end
    
    8'b00101101: begin
    resultado = res_res;
    desbordamiento = 0;
    mux_ready =1;
    end
    
    8'b00101010: begin
    resultado = res_mul;
    desbordamiento = des_mul;
    
    mux_ready =1;
    end
    
    8'b11110111: begin
    resultado = res_div;
    desbordamiento = 0;

    mux_ready =1;
    end
    
    default: begin
    resultado = 0;
    mux_ready =0;
    desbordamiento = 0;

    end
    endcase
    
endmodule
