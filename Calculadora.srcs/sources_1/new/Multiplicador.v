`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.05.2023 16:41:36
// Design Name: 
// Module Name: Multiplicador
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


module Multiplicador(
   input [7:0] A, B,
   output [7:0] S,
   output D // detectar desbordamiento
    );
    wire [7:0]P0, P1, P2, P3, P4, P5, P6, P7;
    wire [7:0]R0, R1, R2, R3, R4, R5, R6, R7;
    wire C1, C2, C3, C4, C5, C6, C7, C8;
    
    assign S[0]= A[0]&B[0];
    
    assign P0[0]= A[0]&B[1];
    assign P0[1]= A[0]&B[2];
    assign P0[2]= A[0]&B[3];
    assign P0[3]= A[0]&B[4];
    assign P0[4]= A[0]&B[5];
    assign P0[5]= A[0]&B[6];
    assign P0[6]= A[0]&B[7];
    assign P0[7]= 0;
    
    assign R0[0]= A[1]&B[0];
    assign R0[1]= A[1]&B[1];
    assign R0[2]= A[1]&B[2];
    assign R0[3]= A[1]&B[3];
    assign R0[4]= A[1]&B[4];
    assign R0[5]= A[1]&B[5];
    assign R0[6]= A[1]&B[6];
    assign R0[7]= A[1]&B[7];
 
    Suma sum1(
        .A(P0[7:0]),
        .B(R0[7:0]),
        .S(P1[7:0]),
        .D(C1)
      );
    //Resultado S1
    assign S[1]= P1[0];  
    //assign P1[6:0] = P1[7:1];
    //assign P1[7] = C1;
      
      
    assign R1[0]= A[2]&B[0];
    assign R1[1]= A[2]&B[1];
    assign R1[2]= A[2]&B[2];
    assign R1[3]= A[2]&B[3];
    assign R1[4]= A[2]&B[4];
    assign R1[5]= A[2]&B[5];
    assign R1[6]= A[2]&B[6];
    assign R1[7]= A[2]&B[7];
 
    Suma sum2(
        .A({C1, P1[7:1]}),
        .B(R1[7:0]),
        .S(P2),
        .D(C2)
      );
    //Resultado S2  
    assign S[2]= P2[0];  
    //assign P2[6:0] = P2[7:1];
    //assign P2[7] = C2;
    
    
    assign R2[0]= A[3]&B[0];
    assign R2[1]= A[3]&B[1];
    assign R2[2]= A[3]&B[2];
    assign R2[3]= A[3]&B[3];
    assign R2[4]= A[3]&B[4];
    assign R2[5]= A[3]&B[5];
    assign R2[6]= A[3]&B[6];
    assign R2[7]= A[3]&B[7];
 
    Suma sum3(
        .A({C2, P2[7:1]}),
        .B(R2[7:0]),
        .S(P3),
        .D(C3)
      );
    //Resultado S3  
    assign S[3]= P3[0];  
    //assign P3[6:0] = P3[7:1];
    //assign P3[7] = C3;
    
    
    assign R3[0]= A[4]&B[0];
    assign R3[1]= A[4]&B[1];
    assign R3[2]= A[4]&B[2];
    assign R3[3]= A[4]&B[3];
    assign R3[4]= A[4]&B[4];
    assign R3[5]= A[4]&B[5];
    assign R3[6]= A[4]&B[6];
    assign R3[7]= A[4]&B[7];
 
    Suma sum4(
        .A({C3, P3[7:1]}),
        .B(R3[7:0]),
        .S(P4),
        .D(C4)
      );
    //Resultado S4  
    assign S[4]= P4[0];  
    //assign P4[6:0] = P4[7:1];
    //assign P4[7] = C4;
    
    
    assign R4[0]= A[5]&B[0];
    assign R4[1]= A[5]&B[1];
    assign R4[2]= A[5]&B[2];
    assign R4[3]= A[5]&B[3];
    assign R4[4]= A[5]&B[4];
    assign R4[5]= A[5]&B[5];
    assign R4[6]= A[5]&B[6];
    assign R4[7]= A[5]&B[7];
 
    Suma sum5(
        .A({C4, P4[7:1]}),
        .B(R4[7:0]),
        .S(P5),
        .D(C5)
      );
    //Resultado S5  
    assign S[5]= P5[0];  
   // assign P5[6:0] = P5[7:1];
    //assign P5[7] = C5;
    
    assign R5[0]= A[6]&B[0];
    assign R5[1]= A[6]&B[1];
    assign R5[2]= A[6]&B[2];
    assign R5[3]= A[6]&B[3];
    assign R5[4]= A[6]&B[4];
    assign R5[5]= A[6]&B[5];
    assign R5[6]= A[6]&B[6];
    assign R5[7]= A[6]&B[7];
 
    Suma sum6(
        .A({C5, P5[7:1]}),
        .B(R5[7:0]),
        .S(P6),
        .D(C6)
      );
    //Resultado S6  
    assign S[6]= P6[0];  
    //assign P6[6:0] = P6[7:1];
    //assign P6[7] = C6;
    
    
    assign R6[0]= A[7]&B[0];
    assign R6[1]= A[7]&B[1];
    assign R6[2]= A[7]&B[2];
    assign R6[3]= A[7]&B[3];
    assign R6[4]= A[7]&B[4];
    assign R6[5]= A[7]&B[5];
    assign R6[6]= A[7]&B[6];
    assign R6[7]= A[7]&B[7];
 
    Suma sum7(
        .A({C6, P6[7:1]}),
        .B(R6[7:0]),
        .S(P7),
        .D(C7)
      );
    //Resultado S7  
    assign S[7]= P7[0];  
    //assign P7[6:0] = P7[7:1];
    //assign P7[7] = C7;
    
    assign D = (P7 > 1'b1);
    
endmodule