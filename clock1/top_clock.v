//////////////////////////////////////////////////////////////////////////////////
// Company: Personal
// Engineer: Matbi / Austin
//
// Create Date: 2024.04.01
// License : https://github.com/matbi86/matbi_fpga_season_1/blob/master/LICENSE
// Design Name: top_clock
// Module Name: top_clock
// Project Name:
// Target Devices:
// Tool Versions:
// Description: Top module 
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps

module top_clock(
    clk,
    reset,
	i_run_en,
	i_freq,
    sec,
    min,
    hour
    );
parameter P_COUNT_BIT = 30; // (default) 30b, under 1GHz. 2^30 = 1073741824
parameter P_SEC_BIT	 = 6; // 2^6 = 64
parameter P_MIN_BIT	 = 6; // 2^6 = 64 
parameter P_HOUR_BIT = 5; // 2^5 = 32 

input 							clk;
input 							reset;
input 							i_run_en;
input		[P_COUNT_BIT-1:0]	i_freq;
output reg 	[P_SEC_BIT-1:0]		sec;
output reg 	[P_MIN_BIT-1:0]		min;
output reg 	[P_HOUR_BIT-1:0]	hour;

wire w_one_sec_tick;

// Gen one sec
one_sec_generator 
# (
	.P_COUNT_BIT	(P_COUNT_BIT) 
) u_one_sec_generator(
	.clk 				(clk			),
	.reset 				(reset			),
	.i_run_en			(i_run_en		),
	.i_freq				(i_freq			),
	.o_one_sec_tick 	(w_one_sec_tick	)
);

reg [6-1:0] r_min_cnt;
reg [12-1:0] r_hour_cnt;
wire sec_tick = sec == 60-1;
wire min_tick = min == 60-1;
wire hour_tick = hour == 24-1;
	always @(posedge clk) begin
	    if(reset) begin
			sec		<= 0;
		end else if(w_one_sec_tick) begin
			if(sec_tick) begin
				sec		<= 0;
			end else begin
				sec	<= sec + 1'b1;
			end
		end
	end

	always @(posedge clk) begin
	    if(reset) begin
			r_min_cnt 	<= 0;
			min		<= 0;
		end else if(w_one_sec_tick) begin
			if(sec_tick & min_tick) begin
				min		<= 0;
				r_min_cnt 	<= 0;
			end else if (r_min_cnt == 60-1)  begin
				min	<= min + 1'b1;
				r_min_cnt 	<= 0;
			end else begin
				r_min_cnt <= r_min_cnt + 1'b1;
			end
		end
	end

	always @(posedge clk) begin
	    if(reset) begin
			r_hour_cnt 	<= 0;
			hour		<= 0;
		end else if(w_one_sec_tick) begin
			if(sec_tick & min_tick & hour_tick) begin
				hour		<= 0;
				r_hour_cnt 	<= 0;
			end else if (r_hour_cnt == 60*60-1)  begin
				hour	<= hour + 1'b1;
				r_hour_cnt 	<= 0;
			end else begin
				r_hour_cnt <= r_hour_cnt + 1'b1;
			end
		end
	end
endmodule


