`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/03 21:22:17
// Design Name: 
// Module Name: hour_gen
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


module hour_gen(
    clk,
    reset_h,
    reset_all,
    min_tic,
    hour
    );
parameter P_HOUR_BIT=5;
input clk,reset_h,reset_all;
input min_tic;
output reg [P_HOUR_BIT-1:0] hour;


 always @ (posedge clk) begin
    if(reset_h) begin
        hour <= 0;
    end else if (reset_all) begin
        hour <= 0;
    end else begin
        if(min_tic) begin
            hour <= hour +1'b1;
            if(hour==23) begin
                hour <=0;
            end
        end 
    end        
 end
endmodule