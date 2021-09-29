`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2021 06:49:09 PM
// Design Name: 
// Module Name: Pro1
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


module Pro1(A, B, OPCODE, Y, N, Z, C, V);
    input [3:0] A,B,OPCODE;
    output reg [3:0] Y; 
    output  reg N, Z, C, V;

    function Comparing;
        input [1:0] A1, B1;
        if(A1 > B1)
            Comparing = 1'b1;
        else
            Comparing = 1'b0;
    endfunction
    
    function BitAdder;
        input A2, B2, Cin;
        reg [1:0] mid;
        begin
            mid = A2 + B2 + Cin;
            //BitAdder = 1;
            BitAdder = Comparing(mid, 2'b01);   
        end 
    endfunction

    function Calcout;
        input [3:0] AA, BB;
        reg [3:0] tmpsum; 
        reg Carry;
        begin
            //tmpsum[0] = AA[0] + BB[0];
            Carry = BitAdder(AA[0], BB[0], 0);
            Carry = BitAdder(AA[1], BB[1], Carry);
            Carry = BitAdder(AA[2], BB[2], Carry);
            Calcout = BitAdder(AA[3], BB[3], Carry);
        end       
    endfunction
    
    function Calcin;
        input [3:0] AA1, BB1;
        reg [3:0] tmpsum; 
        reg Carry;
        
        begin
            tmpsum[0] = AA1[0] + BB1[0];
            Carry = BitAdder(AA1[0], BB1[0], 0);
            Carry = BitAdder(AA1[1], BB1[1], Carry);
            Calcin = BitAdder(AA1[2], BB1[2], Carry);
        end
    endfunction
    
    always @(A, B, OPCODE) begin
        case(OPCODE)
            4'b0001  : Y = A & B;
            4'b0010  : Y = A | B;
            4'b0011  : Y = ~A;
            4'b0100  : Y = A ^ B;
            4'b0101  : Y = A << B;
            4'b0110  : Y = A >>> B;
            4'b0111  : Y = A >> B;
            4'b1000  : Y = A + B;
            4'b1001  : Y = A - B;
            default  : Y = 0;
        endcase
        N = 0; Z = 0; C = 0; V = 0;
        if((A < B) && (OPCODE == 4'b1001)) 
            N = 1;
        if(Y == 0)
            Z = 1;
        if(Calcout(A, B) == 1'b1)
            C = 1;
        if(Calcin(A, B) != Calcout(A, B))
            V = 1;
    end
    
//    always @(Y) begin
//        N <= 0; Z <= 0; C <= 0; V <= 0;
//        if(Y < 0) 
//            N <= 1;
//        if(Y == 0)
//            Z <= 1;
//        if(Calcout(A, B) == 1)
//            C <= 1;
//        if(Calcin(A, B) != Calcout(A, B))
//            V <= 1;
//    end
endmodule
