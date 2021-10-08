`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/30/2021 02:31:37 PM
// Design Name: 
// Module Name: Counter
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


module Counter(clk, rst, direction, maximum, pause, count);
    input clk, rst, direction, pause;
    input [7:0] maximum;
    output reg [7:0] count;
    
    initial count = 8'b00000000;
    always @ (posedge clk or posedge rst)
    
    begin
        if (rst == 1)
            count <= 8'b00000000;
        else
            begin
            if(pause == 1)
                count = count;
            else
                begin
                if (direction == 1'b0)
                    begin
                        if(count == 8'b00000000)
                            count <= maximum;
                        else
                            count <= count - 1;                        
                    end
                else
                    begin
                        if(count == maximum)
                            count <= 8'b00000000;
                        else
                            count <= count + 1;                       
                    end
                end
            end
    end
endmodule