u`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/11 23:45:44
// Design Name: 
// Module Name: minute_count
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


module minute_count (
    clk,reset,o_one_sec_tick,one_minute_tick,minute,hour,
    );
parameter P_MIN_BIT=6;
parameter P_HOUR_BIT=5;
input clk,reset;
input o_one_sec_tick,one_minute_tick;
output reg [P_MIN_BIT-1:0] minute;
output [P_HOUR_BIT-1:0] hour;

wire o_one_sec_tick,one_minute_tick,one_hour_tick;

assign one_hour_tick = minute == 59  ? 1'b1 : 1'b0 ; 
    
hour_count # (
.P_HOUR_BIT(P_HOUR_BIT)
) u_hour_count(
.clk(clk),
.reset(reset),
.o_one_sec_tick(o_one_sec_tick),
.one_minute_tick(one_minute_tick),
.one_hour_tick(one_hour_tick),
.hour(hour));

    always @ (posedge clk) begin
        if(reset) begin
            minute <= 0;
        end else begin
            if(one_minute_tick && o_one_sec_tick ) begin
                if(minute == 59) begin
                    minute <= 0;        
                end else begin
                    minute <= minute  + 1 ;
                end
            end 
        end            
    end
endmodule

