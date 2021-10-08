`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/30/2021 02:51:25 PM
// Design Name: 
// Module Name: Task1_Testbench
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


module Task1_Testbench(

    );
    reg clk, rst, direction, pause;
    reg [7:0] maximum;
    wire [7:0] count;
    
    Task1 Counter(.clk(clk), .rst(rst), .maximum(maximum), .direction(direction), . pause(pause), .count(count));
    initial clk = 0;
    always #2 clk = ~clk;
    initial
    begin
        rst = 1; maximum = 8'b00001111; direction = 1; pause = 0;
        #1 rst = 0;
        #100  direction = 1; pause = 0;
        #100  direction = 0; pause = 0;
        #100  direction = 1; pause = 1;
        #100  direction = 0; pause = 0;
        #100  direction = 1; pause = 0;
        #100 $finish;
    end
endmodule
