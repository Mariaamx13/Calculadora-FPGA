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


module Receptor(
  input clk, 
  input rst,
  input RxD, //input
  output [7:0] datos_rx 
);

    reg shift; // "bandera" para el shifting de los datos (o sea que vaya bit por bit)
    reg estado, s_estado; 
    reg [3:0] cont_bit; //para contar que hayan 10 bits
    reg [1:0] cont_muestras; //
    reg [13:0] cont_baudrate;// 2^14= 16384  2^13= 8192
    reg [9:0] rxshift_reg; //datos (1 bit de inicio, 1 bit final)
    reg clear_bitcounter, inc_bitcounter, inc_samplecounter, clear_samplecounter; //limpia e incrementa cont_bit  y cont_muestras

    parameter clk_freq = 100_000_000;
    parameter baud_rate = 9_600;
    parameter div_muestra = 4; //es cuatro porque se incrementa la frecuencia 4 veces el baudrate 9600^3 < 100M, se asegura que el receptor y transmisor estén sincronizados.
    parameter div_cont = clk_freq/(baud_rate*div_muestra); //frecuencia a la que hay que dividir la frecuencia de reloj del sistema para conseguir una frecuencia (div_muestra) veces más alta que el baudrate
    parameter mid_muestra = (div_muestra/2); //este es el punto medio de un bit donde desea muestrear los datos
    parameter div_bit = 10; 
    
    assign datos_rx = rxshift_reg [8:1]; // se asigna el dato que se va a recibir del registro de shift, se pone 8:1 porque hay 1 bit de inicio y 1 bit final

//Logica del receptor
always @(posedge clk) 
    begin
    if (rst) begin // si se presiona rst, todos los contadores se resetean (todo se pone en 0)
        estado <= 0;
        cont_bit <= 0;
        cont_baudrate <= 0;
        cont_muestras <=0;
        end
        else begin
        cont_baudrate <= cont_baudrate +1; //el contador de baudrate aumenta +1, o sea este ciclo se repite 9600 veces
        if (cont_baudrate >= div_cont-1) // si el contador alcanza 9600
            begin
            cont_baudrate <= 0; // se resetea el contador, o sea vuelve a 0
            estado <= s_estado; // se mueve al siguiente estado, estando listo para recibir datos o volver a IDLE
            if (shift)rxshift_reg <= {RxD, rxshift_reg[9:1]}; // si se activa shift, se cargan los datos recibidos
            if (clear_samplecounter) cont_muestras <=0; //si se activa este clear, se resetea el contador de muestras
            if (inc_samplecounter) cont_muestras <= cont_muestras + 1; // si se activa inc_samplecounter, se incrementa +1
            if (clear_bitcounter) cont_bit <= 0; //si se activa, se limpia a si mismo
            if (inc_bitcounter) cont_bit <= cont_bit +1; ////si se activa, se aumenta +1
            end
        end 
    end  
//Maquina de estados finitos

always @(posedge clk)
begin 
    shift <= 0; // se pone en 0 para evitar shifting, está en idle
    clear_samplecounter <= 0; 
    inc_samplecounter <= 0;
    clear_bitcounter <= 0;
    inc_bitcounter <=0;
    s_estado <= 0; //idle
    case (estado)
        0: begin //ESTADO IDLE
        if (RxD) // si se activa el input RxD
        begin
            s_estado <= 0; // no cambia de estado, queda en idle. Esto porque RxD ocupa estar en 0 para iniciar la transmisión
        end
        else begin
            s_estado <= 1; //va a empezar a recibir datos
            clear_bitcounter <= 1; //se activa y limpia el contador de bits
            clear_samplecounter <= 1; // se activa y limpia el contador de muestras           
            end
        end
        1: begin // Estado de recepción
        s_estado <= 1;
        if (cont_muestras == mid_muestra -1) shift <= 1; //si el contador es 1, se activa el "movimiento" de datos
            if (cont_muestras == div_muestra -1) begin // si el contador es 3, ya que el ratio de la muestra es de 4 (que es 3)
                if (cont_bit == div_bit -1) begin // revisa si el contador de bits es 9 (o sea 10) y si es así, es que se recibieron todos los bits y el próximo estado es IDLE
            s_estado <= 0;
            end
            inc_bitcounter <= 1; // si cont_bit no es 9, se activa inc_bitcounter
            clear_samplecounter <= 1; // se activa este clear para limpiar el contador de muestras
         end else 
         inc_samplecounter <= 1; // si el contador de muestra no es 4, necesita ser incrementado
         end
         default: s_estado <= 0; //queda en IDLE
         endcase
     end 
endmodule     


