`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2021 08:12:36 PM
// Design Name: 
// Module Name: Task4test
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


module Task4test(
    
    );
    reg [3:0] A, B, OPCODE;
    wire [3:0] Y;
    wire N, Z, C, V;
    
    Pro1 test(.A(A), .B(B), .OPCODE(OPCODE), .Y(Y), .N(N), .Z(Z), .C(C), .V(V));
    //Top_Module_Corrected AA1();
    initial
    begin
        A = 4'b0001; B = 4'b0001; OPCODE = 4'b0011;
        
        #20 A = 4'b0000; B = 4'b0000; OPCODE = 4'b0100;
        #20 A = 4'b1010; B = 4'b0001; OPCODE = 4'b0110;
        #20 A = 4'b1010; B = 4'b0001; OPCODE = 4'b1001;
        #20 $finish;
    end
endmodule
