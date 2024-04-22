`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/11 19:32:41
// Design Name: 
// Module Name: sec_count
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


module sec_count(
    clk,reset,o_one_sec_tick,sec,minute,hour
    );
parameter P_SEC_BIT=6;
parameter P_MIN_BIT=6;
parameter P_HOUR_BIT=5 ;
input clk,reset;
input o_one_sec_tick;

output reg [P_SEC_BIT-1:0] sec;
output [P_MIN_BIT-1:0] minute;
output [P_HOUR_BIT-1:0] hour;
wire one_minute_tick;
wire o_one_sec_tick;


assign one_minute_tick = (sec==59) ? 1'b1 : 1'b0;



//assign one_minute_tick = sec == 59 ? 1'b1 : 1'b0;
    
minute_count # (
.P_MIN_BIT(P_MIN_BIT),
.P_HOUR_BIT(P_HOUR_BIT)
) u_minute_count (
.clk(clk),
.reset(reset),
.o_one_sec_tick(o_one_sec_tick),
.one_minute_tick(one_minute_tick),
.minute(minute),
.hour(hour)
);

always @ (posedge clk) begin
    if(reset) begin
        sec <= 0;
    end else begin
        if(o_one_sec_tick) begin
            if(sec == 59) begin
            sec <= 0;        
            end else begin 
            sec <= sec +1;
            end
        end
    end         
end
endmodule
