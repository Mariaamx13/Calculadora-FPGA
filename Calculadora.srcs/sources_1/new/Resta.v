`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.05.2023 16:37:59
// Design Name: 
// Module Name: Resta
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


module Resta(
input [7:0] A,
  input [7:0] B,
  output reg [7:0] R
);

  wire [3:0] S1, S2;
  wire C1, C2;

  // Obtener el complemento a 2 de B
  wire [7:0] B_comp2;
  assign B_comp2 = ~B + 1;

  // Restar los bits menos significativos 
  Suma_4bits Sum1(
    .A(A[3:0]),
    .B(B_comp2[3:0]),
    .Cin(0),
    .S(S1),
    .Cout(C1)
  );

  // Restar los bits m?s significativos 
  Suma_4bits Sum2(
    .A(A[7:4]),
    .B(B_comp2[7:4]),
    .Cin(C1),
    .S(S2),
    .Cout(C2)
  );
 // Combinar los resultados de ambos sumadores de 4 bits para obtener el resultado final
  always @* begin
    R = {S2, S1};
  end
endmodule

