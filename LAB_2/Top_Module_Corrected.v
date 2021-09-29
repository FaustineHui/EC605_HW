`timescale 1ns / 1ps

module Top_module(clk, rst, switches, leds, seven_seg, seven_enable, btn);
    input clk, rst;			// Needed for synchronous inputs
    input [1:0] btn;			// For better control of simulation
    input [15:0] switches;			// Input switches
    output [3:0] leds;				// Display N, V, C, Z
    output reg [6:0] seven_seg;		// Display outputs to seven segment
    output reg [3:0] seven_enable;	// Select which seven segment to display

    reg [3:0] A, B;
    reg [3:0] SEL;
    reg [3:0] LED_BCD;
    reg [19:0] refresh_counter;
/********* ADD MODULE DECLARATIONS HERE ************/
    wire [3:0] Yout;
    wire [1:0] LED_activating_counter; 
//Pro1 task4(switches[11:8], switches[7:4], switches[3:0], Yout, leds[3], leds[0], leds[1], leds[2]);

/********* END MODULE DECLARATIONS HERE ************/

/**************** SAVE INPUT TO REGISTERS ******************/
/* This always block saves switch inputs into      */
/* registers when buttons are pressed.             */
    always @ (posedge clk or posedge rst)
    begin
        if (rst)
        begin
            A <= 0;
            B <= 0;
            SEL <= 0;
        end
        else
        begin
            if (btn[0])
                A <= switches[11:8];
                B <= switches[7:4];
            if (btn[1])
                SEL <= switches[3:0];
        end
    end
/********* End always block **********/

    

/**************** CONNECT FLAGS WITH LEDS ******************/

    Pro1 task4A(.A(A), .B(B), .OPCODE(SEL), .Y(Yout), .N(leds[3]), .Z(leds[0]), .C(leds[1]), .V(leds[2]));

/********* End connect flags with LEDS implementation **********/
    always @ (posedge clk or posedge rst)
    begin 
        if(rst==1)
            refresh_counter <= 0;
        else
            refresh_counter <= refresh_counter + 1;
    end
    assign LED_activating_counter = refresh_counter[19:18];
    
    always @(*)
    begin
        case(LED_activating_counter)
        2'b00: begin
            seven_enable = 4'b0111; 
            // activate LED1 and Deactivate LED2, LED3, LED4
            LED_BCD = Yout / 4096;
            // the first digit of the 16-bit number
              end
        2'b01: begin
            seven_enable = 4'b1011; 
            // activate LED2 and Deactivate LED1, LED3, LED4
            LED_BCD = (Yout % 4096) / 256;
            // the second digit of the 16-bit number
              end
        2'b10: begin
            seven_enable = 4'b1101; 
            // activate LED3 and Deactivate LED2, LED1, LED4
            LED_BCD = ((Yout % 4096) % 256) / 16;
            // the third digit of the 16-bit number
                end
        2'b11: begin
            seven_enable = 4'b1110; 
            // activate LED4 and Deactivate LED2, LED3, LED1
            LED_BCD = ((Yout % 4096) % 256) % 16;  
            // the fourth digit of the 16-bit number    
               end
        endcase
    end
    
    
    always @(*)
    begin
      case(LED_BCD)
        4'b0000: seven_seg = 7'b0000001; // "0"     
        4'b0001: seven_seg = 7'b1001111; // "1" 
        4'b0010: seven_seg = 7'b0010010; // "2" 
        4'b0011: seven_seg = 7'b0000110; // "3" 
        4'b0100: seven_seg = 7'b1001100; // "4" 
        4'b0101: seven_seg = 7'b0100100; // "5" 
        4'b0110: seven_seg = 7'b0100000; // "6" 
        4'b0111: seven_seg = 7'b0001111; // "7" 
        4'b1000: seven_seg = 7'b0000000; // "8"     
        4'b1001: seven_seg = 7'b0000100; // "9" 
        4'b1010: seven_seg = 7'b0001000; // "A" 
        4'b1011: seven_seg = 7'b1100000; // "b" 
        4'b1100: seven_seg = 7'b0110001; // "C" 
        4'b1101: seven_seg = 7'b1000010; // "d" 
        4'b1110: seven_seg = 7'b0110000; // "E" 
        4'b1111: seven_seg = 7'b0111000; // "F"       
        default: seven_seg = 7'b0000001; // "0"
        endcase
    end
    
//    always @ (*)
//    begin
//        seven_enable = 4'b0111;
//        LED_BCD = Yout / 4096;
//        seven_enable = 4'b1011;
//        LED_BCD = (Yout % 4096) / 256;
//        seven_enable = 4'b1101;
//        LED_BCD = ((Yout % 4096) % 256) / 16;
//        seven_enable = 4'b1110;
//        LED_BCD = ((Yout % 4096) % 256) % 16;    
//    end

/**************** CONNECT ALU OUTPUT WITH SEVEN SEGMENT DISPLAY ******************/
/* Here you initialize seven_seg, the register for the output of the seven segment dsiplay*/

/********* End connect alu output to seven seg implementation**********/





endmodule
/************ End module *************/





