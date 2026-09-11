`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.05.2023 01:10:58
// Design Name: 
// Module Name: divisor
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


module divisor(
input wire [7:0] A,
input wire [7:0] B,
output wire [7:0] resultado,
output wire [8:0] r 
);
						
   wire [8:0] d [7:0];
   wire [8:0] b [7:0];
	 
   generate //se crea una matriz para la division
      genvar ii, jj;
	   for ( ii = 0; ii < 8; ii = ii + 1) begin: gen_ii
         for ( jj = 0; jj < 8 + 1; jj = jj + 1) begin: gen_jj

            divisor2 complemento( 
					 .A  ( jj < 1 ? A[7-ii] : ii > 0 ? d[ii-1][jj-1] : 1'b0 ),
                     .B  ( jj < 8 ? B[jj] : 1'b0 ), 
                     .b_i ( jj > 0 ? b[ii][jj-1] : 1'b0 ),
                     .os ( b[ii][8] ),
                     .d  ( d[ii][jj] ), 
                     .bo ( b[ii][jj] ) );
         end
       end
    
    //con este bucle se calculan los valores del cociente y residuo, usando las señales de b y d (con b se calcula el cociente B con d el residuo).
      for ( ii = 0; ii < 8; ii = ii + 1) begin: gen_p
		     assign resultado[7-ii] = ~b[ii][8];
	   end
		 
      for ( jj = 0; jj <= 8; jj = jj + 1) begin: gen_r
		     assign r[jj] = d[7][jj];
	   end
   endgenerate
endmodule
