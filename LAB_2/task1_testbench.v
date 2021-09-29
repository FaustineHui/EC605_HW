`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/09/28 17:10:23
// Design Name: 
// Module Name: task1_testbench
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


module task1_testbench(

    );
    
    reg A,B,Cin;
    wire Sum,Cout;
    
    task1_fulladder task1(.A(A),.B(B),.Cin(Cin),.Cout(Cout),.Sum(Sum));
    
    initial
    begin
         A=0;
         B=0;
         Cin=0;
         
         #10 Cin=1;
         #10 B=1;Cin=0;
         #10 Cin=1;
         #10 A=1;B=0;Cin=0;
         #10 Cin=1;
         #10 Cin=0;B=1;
         #10 Cin=1;
         #10 $finish;
    end
    
endmodule
