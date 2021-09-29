`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/09/28 17:43:27
// Design Name: 
// Module Name: task2_testbench
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


module task2_testbench(

    );
    
    reg [7:0]A,B;
    reg Cin;
    wire Cout;
    wire [7:0]Sum;
    
    task2_ripplecarry task2(.A(A),.B(B),.Cin(Cin),.Cout(Cout),.Sum(Sum));
    
    initial
    begin
       A=00000000;
       B=00000000;
       Cin=0;
       
       #50 A=01000110;B=00111001;
       #20 Cin=1;
       #50 A=00001111;B=01001000;
       #50 Cin=0;
       #30 $finish;
    end
    
endmodule
