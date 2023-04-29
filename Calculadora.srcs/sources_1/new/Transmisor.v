`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.04.2023 19:11:51
// Design Name: 
// Module Name: Transmisor
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


module Transmisor(
    input wire [7:0] data,
    input wire clk,
    input wire rst,
    output reg tx_ready,
    output reg resp
    );
    
    reg [3:0] cont_tx;
    reg [7:0] datos_tx;
    
    //Inicialización
    initial begin
    cont_tx <= 0;
    datos_tx <= 0;
    tx_ready <= 0;
    resp <= 1;
    end
    
  //Máquina de estados
    always @(posedge clk) begin
    if (rst) begin
        cont_tx <= 0;
        datos_tx <= 0;
        tx_ready <= 1;
        resp <= 1;
    end else if (tx_ready) 
    begin
        datos_tx <= data;
        tx_ready <= 0;
        resp <= 0;
        cont_tx <= 0;
    end else if (cont_tx < 8) begin
        cont_tx <= cont_tx + 1;
    end else begin
        cont_tx <= 0;
        datos_tx <= datos_tx << 1;
        resp <= datos_tx[7];
        if (cont_tx == 7) begin
            tx_ready <=1;
        end
    end
end

endmodule
