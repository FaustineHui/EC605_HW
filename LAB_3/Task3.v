`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/30/2021 06:50:55 PM
// Design Name: 
// Module Name: Task3
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


module Task3(clk, rst, sw0, sw1, sw2, counter, Led
    );
    input clk, rst, sw0, sw1, sw2;
    input [7:0] counter;
    output reg [3:0] Led;
    //output [7:0] Count_Number;    
    reg state;
    wire Modclk;
    wire [7:0] Count_Number;
    initial state = 1;
    initial Led = 0;
    Clock_Divider clock(.clk(clk), .Modclk(Modclk));
    Counter count(Modclk, rst, 0, counter, sw2, Count_Number);
    always @ (posedge Modclk,posedge rst)
        begin
        if(rst == 1)
            Led <= 4'b0000;
        else
            if(sw2 == 1 || sw0 == sw1)
                state = state;
            else
                begin
                if(state != 0 && Count_Number == 0 && sw0 == 1)
                    begin
                    if(Led == 0)
                        begin
                        Led <= 4'b0001;
                        //state <= state + 1;
                        end
                    else if(Led == 4'b1000)
                        begin
                        Led <= 0;
                        state <= 1;
                        end
                    else 
                        begin
                        Led <= Led << 1;
                        //state <= state + 1;
                        end
                    end
                else if(state != 0 && Count_Number == 0 && sw1 == 1)
                    begin
                    if(Led == 0)
                        begin
                        Led <= 4'b1000;
                        //state <= state + 1;
                        end
                    else if(Led == 4'b0001)
                        begin
                        Led <= 0;
                        state <= 1;
                        end
                    else 
                        begin
                        Led <= Led >> 1;
                        //state <= state + 1;
                        end
                    end  
                else
                    state = state;             
                end
             
        end
    
endmodule