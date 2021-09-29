`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/09/28 17:38:23
// Design Name: 
// Module Name: task2_ripplecarry
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


module task2_ripplecarry(A,B,Cin,Cout,Sum);

input [7:0]A,B;
input Cin;
output Cout;
output [7:0]Sum;

wire [6:0]w;

task1_fulladder add1(A[0],B[0],Cin,w[0],Sum[0]);
task1_fulladder add2(A[1],B[1],w[0],w[1],Sum[1]);
task1_fulladder add3(A[2],B[2],w[1],w[2],Sum[2]);
task1_fulladder add4(A[3],B[3],w[2],w[3],Sum[3]);
task1_fulladder add5(A[4],B[4],w[3],w[4],Sum[4]);
task1_fulladder add6(A[5],B[5],w[4],w[5],Sum[5]);
task1_fulladder add7(A[6],B[6],w[5],w[6],Sum[6]);
task1_fulladder add8(A[7],B[7],w[6],Cout,Sum[7]);

endmodule
