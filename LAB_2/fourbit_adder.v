`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/09/28 19:29:22
// Design Name: 
// Module Name: fourbit_adder
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


module fourbit_adder(A,B,Cin,Cout,Sum);

input [3:0]A,B;
input Cin;
output Cout;
output [3:0]Sum;

wire [2:0]w;

task1_fulladder add1(A[0],B[0],Cin,w[0],Sum[0]);
task1_fulladder add2(A[1],B[1],w[0],w[1],Sum[1]);
task1_fulladder add3(A[2],B[2],w[1],w[2],Sum[2]);
task1_fulladder add4(A[3],B[3],w[2],Cout,Sum[3]);
endmodule
