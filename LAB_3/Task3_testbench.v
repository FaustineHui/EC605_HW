`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2021 02:30:40 PM
// Design Name: 
// Module Name: Task3_testbench
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


module Task3_testbench(

    );
    reg clk, rst, sw0, sw1, sw2;
    reg [7:0] counter;
    wire [3:0] Led; 

    //Task3 test(.clk(clk), .rst(rst), .sw0(sw0), .sw1(sw1), .sw2(sw2), .counter(counter), .Led(Led));
    Task3 test(.clk(clk), .rst(rst), .sw0(sw0), .sw1(sw1), .sw2(sw2), .counter(counter), .Led(Led));
    initial clk = 0;
    always #2 clk = ~clk;   
    initial
    begin
        rst = 0; sw0 = 0; sw1 = 0; sw2 = 0; counter = 8'b00000101;
        #10 sw0 = 1;
        #200000000 sw1 = 1;
        #200000000 sw0 = 0; 
    end 
endmodule
