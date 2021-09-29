`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/09/28 19:05:18
// Design Name: 
// Module Name: Mux
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


module Mux(A,B,S,Out);

input A,B,S;
output Out;

wire w1,w2,w3;

not not1(w1,S);
and and1(w2,A,w1);
and and2(w3,B,S);
or or1(Out,w2,w3);

endmodule
