`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.05.2023 16:25:01
// Design Name: 
// Module Name: Suma
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


module Suma(
   input [7:0] A, B,
   output reg [7:0] S,
   output reg D // detectar desbordamiento
);

  wire [3:0] A0, B0, S0;
  wire [3:0] A1, B1, S1;
  
  
  Suma_4bits sum1(
    .A(A[3:0]),
    .B(B[3:0]),
    .Cin(1'b0),
    .S(S0),
    .Cout()
  );
  
  Suma_4bits sum2(
    .A(A[7:4]),
    .B(B[7:4]),
    .Cin(sum1.Cout),
    .S(S1),
    .Cout()
  );

 // realiza la suma de los dos resultados de 4 bits
  reg [8:0] S_total;
  always @* begin
    S_total = {1'b0, A} + {1'b0, B};
    S = S_total[7:0];
    D = (S_total[8] == 1'b1);
  end

endmodule
