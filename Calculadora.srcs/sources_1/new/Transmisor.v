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


module Transmisor //maquina de estados igual a la del receptor, lo que cambia es la logica del estado de recepcion, que en este caso se llama transmision
    (
        input clk,               // basys 3 FPGA
        input rst,                    // rst
        input tx_en,                 // begin data transmission (FIFO NOT empty)
        input tick,              // from baud rate generator
        input [7:0] resultado,      // data word from FIFO
        output TxD                       // transmitter data line
    );
    
    // State Machine States
    localparam [1:0]    idle  = 2'b00,
                        start = 2'b01,
                        transmision  = 2'b10,
                        stop  = 2'b11;
    
    // Registers                    
    reg [1:0] estado, sig_estado;            // estado registers
    reg [3:0] tick_reg, tick_sig;          // number of ticks received from baud rate generator
    reg [2:0] nbits_reg, nbits_sig;        // number of bits transmitted in data estado
    reg [7:0] data_reg, data_sig;    // assembled data word to transmit serially
    reg TxD_reg, TxD_sig;                    // data filter for potential glitches
    
    // Register Logic
    always @(posedge clk, posedge rst)
        if(rst) begin
            estado <= idle;
            tick_reg <= 0;
            nbits_reg <= 0;
            data_reg <= 0;
            TxD_reg <= 1'b1;
        end
        else begin
            estado <= sig_estado;
            tick_reg <= tick_sig;
            nbits_reg <= nbits_sig;
            data_reg <= data_sig;
            TxD_reg <= TxD_sig;
        end
    
    // estado Machine Logic
    always @* begin
        sig_estado = estado;
        tick_sig = tick_reg;
        nbits_sig = nbits_reg;
        data_sig = data_reg;
        TxD_sig = TxD_reg;
        
        case(estado)
            idle: begin                  
                TxD_sig = 1'b1;            
                if(tx_en) begin          
                    sig_estado = start;
                    tick_sig = 0;
                    data_sig = resultado;
                end
            end
            
            start: begin
                TxD_sig = 1'b0; //bit de inicio siempre debe de ser 0
                if(tick)
                    if(tick_reg == 15) begin
                        sig_estado = transmision;
                        tick_sig = 0;
                        nbits_sig = 0;
                    end
                    else
                        tick_sig = tick_reg + 1;
            end
            
            transmision: begin
                TxD_sig = data_reg[0];
                if(tick)
                    if(tick_reg == 15) begin
                        tick_sig = 0;
                        data_sig = data_reg >> 1; //se va separando bit por bit
                        if(nbits_reg == (7))
                            sig_estado = stop;
                        else
                            nbits_sig = nbits_reg + 1;
                    end
                    else
                        tick_sig = tick_reg + 1;
            end
            
            stop: begin
                TxD_sig = 1'b1;       
                if(tick)
                    if(tick_reg == (15)) begin
                        sig_estado = idle;
                        sig_estado = idle;
                    end
                    else
                        tick_sig = tick_reg + 1;
            end
        endcase    
    end
    
    assign TxD = TxD_reg;
 
endmodule
