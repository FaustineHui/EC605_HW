`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/09/28 19:36:23
// Design Name: 
// Module Name: fourbit_MUX
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


module fourbit_MUX(A,B,S,Out);

input [3:0]A,B;
input S;
output [3:0]Out;

Mux mux1(A[0],B[0],S,Out[0]);
Mux mux2(A[1],B[1],S,Out[1]);
Mux mux3(A[2],B[2],S,Out[2]);
Mux mux4(A[3],B[3],S,Out[3]);

endmodule
