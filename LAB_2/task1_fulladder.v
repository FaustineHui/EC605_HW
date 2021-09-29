`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/09/28 16:39:49
// Design Name: 
// Module Name: task1_fulladder
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


module task1_fulladder(A,B,Cin,Cout,Sum);
    input A,B,Cin;
    output Cout,Sum;
    
    wire w1,w2,w3;
    
    and and1(w1,A,B);
    and and2(w2,A,Cin);
    and and3(w3,B,Cin);
    xor xor1(Sum,A,B,Cin);
    or or1(Cout,w1,w2,w3);
    
endmodule
