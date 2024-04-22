`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/20 11:50:51
// Design Name: 
// Module Name: top_clock4
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


module top_clock4(
reset,
clk,
i_freq,
en,
sec,
min,
hour
    );
parameter P_COUNT_BIT = 30; // (default) 30b 
parameter P_SEC_BIT=6;
parameter P_MIN_BIT=6;
parameter P_HOUR_BIT=5;

input wire [P_COUNT_BIT-1:0] i_freq;
input wire reset,clk,en;
output [P_SEC_BIT-1:0] sec;
output [P_MIN_BIT-1:0] min;
output [P_HOUR_BIT-1:0] hour;

wire one_sec_tick,min_tic,hour_tic;

assign min_gen_tic = one_sec_tick && min_tic;
assign hour_gen_tic = one_sec_tick && min_tic && hour_tic;

one_sec_generator #(
.P_COUNT_BIT(P_COUNT_BIT))
u_one_sec_generator (
.clk(clk),
.en(en),
.reset(reset),
.i_freq(i_freq),
.one_sec_tick(one_sec_tick)
);

sec_gen #(
.P_SEC_BIT(P_SEC_BIT))
u_sec_gen (
.reset(reset),
.en(en),
.clk(clk),
.one_sec_tick(one_sec_tick),
.sec(sec),
.min_tic(min_tic));

min_gen #(
.P_MIN_BIT(P_MIN_BIT))
u_min_gen (
.reset(reset),
.clk(clk),
.en(en),
.min_gen_tic(min_gen_tic),
.min(min),
.hour_tic(hour_tic)
);

hour_gen #(
.P_HOUR_BIT(P_HOUR_BIT))
u_hour_gen(
.reset(reset),
.clk(clk),
.en(en),
.hour(hour),
.hour_gen_tic(hour_gen_tic)
); 
endmodule
