`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/30/2021 05:31:39 PM
// Design Name: 
// Module Name: Task2_testbench
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


module Task2_testbench(

    );
    reg clk;
    wire Modclk;
    Task2 test(.clk(clk), .Modclk(Modclk));
    initial clk = 0;
    always #5 clk = ~clk;

        
endmodule
