//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer: 
//
// Create Date: 2024.04.01
// License : https://github.com/matbi86/matbi_fpga_season_1/blob/master/LICENSE
// Design Name: 
// Module Name: one_sec_generator
// Project Name:
// Target Devices:
// Tool Versions:
// Description: To generate one sec
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////
 
`timescale 1ns / 1ps
module matbi_one_sec_gen(
    clk,
    reset,
	i_run_en,
	i_freq,
    sec,
    minute,
    hour,
    );
parameter P_COUNT_BIT = 30; // (default) 30b 
parameter P_SEC_BIT=6;
parameter P_MIN_BIT=6;
parameter P_HOUR_BIT=5 ;
input 						clk;
input 						reset;
input 						i_run_en;
input [P_COUNT_BIT-1:0]		i_freq;

reg		o_one_sec_tick;

output [P_SEC_BIT-1:0] sec;
output [P_MIN_BIT-1:0] minute;
output [P_HOUR_BIT-1:0] hour;

	reg 	[P_COUNT_BIT-1:0] 	r_counter; 

	always @(posedge clk) begin
	    if(reset) begin
			r_counter <= {P_COUNT_BIT{1'b0}};
			o_one_sec_tick <= 1'b0;
	    end else if (i_run_en) begin
			if(r_counter == i_freq -1) begin
				r_counter <= 0;
				o_one_sec_tick <= 1'b1;
			end else begin
				r_counter <= r_counter + 1'b1;
				o_one_sec_tick <= 1'b0;
			end
		end else begin
			o_one_sec_tick <= 1'b0;
		end
	end
	
endmodule