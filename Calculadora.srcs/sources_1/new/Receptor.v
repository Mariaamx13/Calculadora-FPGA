`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.04.2023 15:54:58
// Design Name: 
// Module Name: Receptor
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
module Receptor
    (
        input clk,              //input de la FPGA
        input rst,              //reset
        input RxD,              //input RxD, es de 1 solo bit, secuencial.         
        input tick,             //
        output reg rx_ready,    //tick para avisarle al módulo de registro que ya el dato está listo para shiftearse y guardarse.      
        output [7:0] datos_rx   //dato paralelo  
    );
    
    localparam [1:0] idle  = 2'b00, //se definen los estados para la máquina de estados
                     inicio = 2'b01,
                     recepcion  = 2'b10,
                     parada  = 2'b11;
    
    // Registers                 
    reg [1:0] estado, sig_estado;  //estado almacena el estado actual de la máquina y sig_estado se actualiza según el valor de estado y determina el siguiente estado
    reg [3:0] tick_reg, tick_sig;  //guarda el valor del contador de ticks en el ciclo de reloj actual, tick_sig guarda el valor de tick_reg en el siguiente 
                                   //ciclo de reloj, esto permite que tick se mantenga durante clk (tick_sig = tick_reg)
    reg [2:0] nbits_reg, nbits_sig;  //nbits_reg es un contador de los bits recibidos
    reg [7:0] data_reg, data_sig;    //registro del dato recibido 
    
    //logica de los registros para el funcionamiento de la maquina de estados
    always @(posedge clk, posedge rst)
        if(rst) begin //si se activa, se coloca en idle y se reinician los valores
            estado <= idle;
            tick_reg <= 0;
            nbits_reg <= 0;
            data_reg <= 0;
        end
        else begin //si rst no se activa, se guardan los valores en los reg _sig
            estado <= sig_estado;
            tick_reg <= tick_sig;
            nbits_reg <= nbits_sig;
            data_reg <= data_sig;
        end        

    // Maquina de estados
    always @* begin //se asignan los valores del flanco de reloj pasado a la señal actual.
        sig_estado = estado;
        rx_ready = 1'b0; //importante, el dato todavía no está listo, por lo que se mantiene en 0
        tick_sig = tick_reg;
        nbits_sig = nbits_reg;
        data_sig = data_reg;
        
        case(estado)
            idle:
                if(~RxD) begin       //el bit de inicio siempre es 0, por lo que se niega el condicional      
                    sig_estado = inicio; //el proximo estado es de inicio
                    tick_sig = 0; // se reinicia el contador de ticks para empezar a contar los datos
                end
            inicio:
                if(tick) 
                    if(tick_reg == 7) begin //se debe de esperar a que el contador de ticks llegue a 7 para que confirmar que RxD se mantuvo en 1 por 8 flancos, o sea, llego un dato.
                        sig_estado = recepcion; //al llegar un dato, se coloca el proximo estado en recepcion
                        tick_sig = 0; // se reinician ambos contadores
                        nbits_sig = 0;
                    end
                    else
                        tick_sig = tick_reg + 1; // se suma +1 cada que RxD cambie, hasta llegar a 7
            recepcion:
                if(tick)
                    if(tick_reg == 15) begin
                        tick_sig = 0;
                        data_sig = {RxD, data_reg[7:1]};
                        if(nbits_reg == (7))
                            sig_estado = parada;
                        else
                            nbits_sig = nbits_reg + 1;
                    end
                    else 
                        tick_sig = tick_reg + 1; //misma logica que el estado de inicio, solo que 
            parada:
                if(tick)
                    if(tick_reg == (15)) begin
                        sig_estado = idle;
                        rx_ready = 1'b1; //el dato está listo
                    end
                    else
                        tick_sig = tick_reg + 1;
        endcase                    
    end
    
    assign datos_rx = data_reg;
    

endmodule