`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/20 11:30:32
// Design Name: 
// Module Name: one_sec_generator
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


module one_sec_generator(
    clk,
    reset,
	en,
	i_freq,
	one_sec_tick,
    );
parameter P_COUNT_BIT = 5; // (default) 30b 

input 						clk;
input 						reset;
input 						en;
input [P_COUNT_BIT-1:0]		i_freq;


output reg	one_sec_tick;

//output [P_SEC_BIT-1:0] sec;
//output [P_MIN_BIT-1:0] minute;
//output [P_HOUR_BIT-1:0] hour;

reg 	[P_COUNT_BIT-1:0] 	r_counter; 

always @(posedge clk) begin
    if(reset) begin
        r_counter <= {P_COUNT_BIT{1'b0}};
        one_sec_tick <= 1'b0;
    end else begin
//        if(en) begin
            if(r_counter == i_freq -1) begin
                r_counter <= 0;
                one_sec_tick<= 1'b1;
            end else begin
                r_counter <= r_counter + 1'b1;
                one_sec_tick <= 1'b0;
            end
        end
//    end 
end


endmodule
