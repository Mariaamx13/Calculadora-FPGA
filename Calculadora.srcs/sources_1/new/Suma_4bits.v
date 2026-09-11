`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.05.2023 16:26:17
// Design Name: 
// Module Name: Suma_4bits
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

module Suma_4bits(Cin,A,B,S,Cout
    );
     input Cin;
    input [3:0] A;
    input [3:0] B;
    output [3:0] S;
    output Cout;
    
    reg [4:0] Sum;
    
    always @*
        Sum <= A + B + Cin;
        
        assign S = Sum[3:0];
        assign Cout = Sum[4];
endmodule
