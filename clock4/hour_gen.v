`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/20 11:36:17
// Design Name: 
// Module Name: sec_gen
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
reset,
en,
clk,
hour,
hour_gen_tic
);
parameter P_HOUR_BIT=5;

input reset,en,clk;
input hour_gen_tic;
output reg [P_HOUR_BIT-1:0] hour;

 always @ (posedge clk ) begin
    if(reset) begin
        hour <={P_HOUR_BIT{1'b0}};
    end else begin
        if(en && hour_gen_tic) begin
            if(hour == 23) begin
                hour <= 0;
            end else begin
                hour <= hour+ 1'b1;
            end
        end
    end
end
endmodule
