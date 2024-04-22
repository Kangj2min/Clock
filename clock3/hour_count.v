`timescale 1ns / 1ps
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


module hour_count(
    clk,reset,one_minute_tick,o_one_sec_tick,one_hour_tick,hour,
    );
parameter P_HOUR_BIT=5;

input clk,reset,one_minute_tick,o_one_sec_tick,one_hour_tick;

output reg [P_HOUR_BIT-1:0] hour; 
    

    always @ (posedge clk) begin
        if(reset) begin
            hour <= 0;
        end else begin
            if(one_minute_tick && o_one_sec_tick && one_hour_tick) begin
                if(hour == 23) begin
//                    one_hour_tick <= 1;
                    hour <= 0;        
                end else begin
//                    one_hour_tick <= 0;
                    hour <= hour +1 ;
                end
            end
        end            
    end
endmodule

