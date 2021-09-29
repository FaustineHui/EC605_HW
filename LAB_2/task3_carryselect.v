`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/09/28 19:17:03
// Design Name: 
// Module Name: task3_carryselect
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


module task3_carryselect(A,B,Cin,Cout,Sum);

input [7:0]A,B;
input Cin;
output Cout;
output [7:0]Sum;

wire [3:0] Sum1,Sum2;
wire w1,w2,w3;

fourbit_adder fadd1(A[7:4],B[7:4],0,w1,Sum1[3:0]);
fourbit_adder fadd2(A[7:4],B[7:4],1,w2,Sum2[3:0]);
fourbit_adder fadd3(A[3:0],B[3:0],Cin,w3,Sum[3:0]);
fourbit_MUX fmux1(Sum1[3:0],Sum2[3:0],w3,Sum[7:4]);

Mux mux1(w1,w2,w3,Cout);

endmodule
