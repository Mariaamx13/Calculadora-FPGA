`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.05.2023 14:49:51
// Design Name: 
// Module Name: baudrate_gen
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


module baudrate_gen // se genera un tick a una velocidad de baudios específica (9600)
    (              
        input clk,       
        input rst,            
        output tick            
    );
    
    // Counter Register
    reg [9:0] contador; //  sirve para contar el número de ciclos de reloj     
    wire [9:0] sig_cont;  //genera el tick     
    
    // Register Logic
    always @(posedge clk, posedge rst)
        if(rst)
            contador <= 0;
        else
            contador <= sig_cont;
            
    // sig_cont contador Value Logic
    assign sig_cont = (contador == (650)) ? 0 : contador + 1;
    
    // Output Logic
    assign tick = (contador == (650)) ? 1'b1 : 1'b0;
       
endmodule
