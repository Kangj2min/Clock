`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/03 22:35:43
// Design Name: 
// Module Name: top_clock
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


module top_clock(
clk,en,reset_s,reset_m,reset_h,reset_all,i_freq,sec,min,hour
    );
parameter P_COUNT_BIT=30;
parameter P_SEC_BIT=6;
parameter P_MIN_BIT=6;
parameter P_HOUR_BIT=5;

input clk,en,reset_s,reset_m,reset_h,reset_all;
input [P_COUNT_BIT-1:0]   i_freq;
output [P_SEC_BIT-1:0] sec;
output [P_SEC_BIT-1:0] min;
output [P_HOUR_BIT-1:0] hour;
wire sec_tic;
wire min_tic;
sec_gen # (.P_COUNT_BIT(P_COUNT_BIT),.P_SEC_BIT(P_SEC_BIT)) u_sec_gen(.clk(clk),.reset_s(reset_s),.reset_all(reset_all),.en(en),.sec_tic(sec_tic),.sec(sec));
min_gen # (.P_MIN_BIT(P_MIN_BIT)) u_min_gen(.clk(clk),.reset_m(reset_m),.reset_all(reset_all),.sec_tic(sec_tic),.min_tic(min_tic),.min(min));
hour_gen # (.P_HOUR_BIT(P_HOUR_BIT)) u_hour_gen(.clk(clk),.reset_h(reset_h),.reset_all(reset_all),.min_tic(min_tic),.hour(hour));

endmodule